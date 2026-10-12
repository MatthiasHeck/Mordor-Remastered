"""Read-only first-pass fidelity audit. Uses Python's standard library only.

Reads the supplied original tree; writes only research/fidelity-foundations.
Never executes the game, a DLL, a decompiler, or an installer. NE header layout:
Microsoft Windows 3.00 Developer's Notes, Executable-File Header Format,
preserved at https://github.com/qb40/exe-format/blob/master/README.txt.
"""
from pathlib import Path
from collections import Counter
import argparse
import csv
import hashlib
import io
import json
import re
import shutil
import struct
import wave
import zipfile

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def save_json(name, value):
    path = OUT / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def save_csv(name, rows):
    assert rows, name
    with (OUT / name).open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


def ne_header(data):
    assert data[:2] == b"MZ"
    base = struct.unpack_from("<I", data, 0x3C)[0]
    assert data[base:base + 2] == b"NE"
    word = lambda offset: struct.unpack_from("<H", data, base + offset)[0]
    shift = word(0x32)
    assert shift <= 16
    table = base + word(0x22)
    segments = []
    for i in range(word(0x1C)):
        sector, length, flags, allocation = struct.unpack_from("<4H", data, table + 8 * i)
        offset = sector << shift
        length = length or 65536
        if sector:
            assert offset + length <= len(data)
        segments.append(dict(index=i + 1, file_offset=offset, file_bytes=length if sector else 0,
                             flags=flags, minimum_allocation=allocation or 65536))
    imports = []
    for i in range(word(0x1E)):
        rel = struct.unpack_from("<H", data, base + word(0x28) + 2 * i)[0]
        p = base + word(0x2A) + rel
        imports.append(data[p + 1:p + 1 + data[p]].decode("ascii"))
    return dict(ne_offset=base, target_os=data[base + 0x36], alignment_shift=shift,
                imported_modules=imports, segments=segments)


def relocation_storage(data, segment):
    """Offsets changed by NE loader fixups; do not certify loader correctness."""
    result = set()
    start, length = segment["file_offset"], segment["file_bytes"]
    if not length or not segment["flags"] & 0x100:
        return result
    table = start + length
    count = struct.unpack_from("<H", data, table)[0]
    assert table + 2 + 8 * count <= len(data)
    for i in range(count):
        kind, flags, pos, _, _ = struct.unpack_from("<BBHHH", data, table + 2 + 8 * i)
        width = {0: 1, 2: 2, 3: 4, 5: 2}.get(kind & 15)
        assert width is not None, kind
        seen = set()
        while pos != 65535:
            assert pos not in seen and pos + max(width, 2) <= length
            seen.add(pos)
            result.update(range(pos, pos + max(width, 2)))
            if flags & 4:
                break
            pos = struct.unpack_from("<H", data, start + pos)[0]
    return result


def reko_dump_lines(text):
    rows = []
    for number, line in enumerate(text.splitlines(), 1):
        match = re.match(r"^([0-9A-F]{4}):([0-9A-F]{4}) ", line)
        if match:
            # Reko's hexadecimal data column is 47 characters wide.
            column = line[10:57].split()
            if column and all(re.fullmatch(r"[0-9A-F]{2}", x) for x in column):
                rows.append((number, int(match[2], 16), bytes.fromhex(" ".join(column))))
    return rows


def expand_szdd(data):
    """Decode SZDD mode A; verified against the separately supplied VBRUN300.

    Format reference: libmspack's LZSS_MODE_EXPAND (lzss.h / lzssd.c).
    This small reader is project-authored; it does not execute compressed files.
    """
    assert data[:9] == b"SZDD\x88\xf0\x27\x33A"
    expected = struct.unpack_from("<I", data, 10)[0]
    ring = bytearray(b" " * 4096)
    cursor, pos, result = 4080, 14, bytearray()
    while len(result) < expected:
        flags = data[pos]
        pos += 1
        for bit in range(8):
            if len(result) == expected:
                break
            if flags & (1 << bit):
                payload = [data[pos]]
                pos += 1
                for value in payload:
                    ring[cursor] = value
                    cursor = (cursor + 1) & 4095
                    result.append(value)
            else:
                offset = data[pos] | ((data[pos + 1] & 240) << 4)
                count = (data[pos + 1] & 15) + 3
                pos += 2
                assert len(result) + count <= expected
                for j in range(count):
                    value = ring[(offset + j) & 4095]
                    ring[cursor] = value
                    cursor = (cursor + 1) & 4095
                    result.append(value)
    assert pos == len(data), "Unexpected trailing compressed bytes"
    return bytes(result)


def audit_reko(read, source, binary_name, binary, header):
    rows = []
    directory = source / "_Original Game Files" / (Path(binary_name).stem + ".reko")
    for path in sorted(directory.glob("*.asm")):
        relative = path.relative_to(source).as_posix()
        chunks = reko_dump_lines(read(relative).decode("utf-8-sig"))
        # Score multiple nonconstant chunks, not a generic all-zero header.
        probes = [(off, b) for _, off, b in chunks if len(set(b)) >= 4][:200]
        candidates = []
        for seg in header["segments"]:
            if seg["file_bytes"]:
                score = sum(binary[seg["file_offset"] + off:seg["file_offset"] + off + len(b)] == b
                            for off, b in probes if off + len(b) <= seg["file_bytes"])
                if score:
                    candidates.append((score, seg["index"]))
        candidates.sort(reverse=True)
        row = dict(source=relative, binary=binary_name, dump_lines=len(chunks),
                   segment_index="", file_offset="", evidence="unmapped",
                   matching_bytes=0, excluded_relocation_bytes=0, outside_file_bytes=0, mismatching_bytes=0,
                   first_mismatch_offsets="")
        if candidates and candidates[0][0] >= 3 and (len(candidates) == 1 or candidates[0][0] > candidates[1][0]):
            seg = header["segments"][candidates[0][1] - 1]
            excluded = relocation_storage(binary, seg)
            mismatches = []
            row.update(segment_index=seg["index"], file_offset=seg["file_offset"])
            for _, off, data in chunks:
                for j, b in enumerate(data):
                    pos = off + j
                    if pos >= seg["file_bytes"]:
                        # Reko can show allocation/alignment bytes beyond file data.
                        # These have no corresponding original segment-file bytes.
                        row["outside_file_bytes"] += 1
                    elif pos in excluded:
                        row["excluded_relocation_bytes"] += 1
                    elif pos < seg["file_bytes"] and binary[seg["file_offset"] + pos] == b:
                        row["matching_bytes"] += 1
                    else:
                        row["mismatching_bytes"] += 1
                        if len(mismatches) < 8:
                            mismatches.append(hex(pos))
            row["first_mismatch_offsets"] = ";".join(mismatches)
            row["evidence"] = "dump_bytes_match_excluding_fixups" if not row["mismatching_bytes"] else "mapped_with_mismatches"
        rows.append(row)
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=ROOT.parent.parent / "Mordor")
    args = parser.parse_args()
    source = args.source.resolve()
    assert source.is_dir() and source != OUT and source not in OUT.parents
    OUT.mkdir(exist_ok=True)
    original = json.loads((ROOT / "local-original/source-inventory.json").read_text())
    inputs = {}

    def read(relative):
        data = (source / relative).read_bytes()
        entry = dict(size=len(data), sha256=sha(data))
        assert entry == original["files"][relative.replace("/", "\\")], relative
        inputs[relative] = entry
        return data

    binaries = {}
    reko = []
    for name in ["MORDOR.EXE", "VBRUN300.DLL"]:
        data = read("_Original Game Files/" + name)
        header = ne_header(data)
        binaries[name] = dict(sha256=sha(data), size=len(data), **header)
        reko += audit_reko(read, source, name, data, header)
    save_json("binary-baseline.json", binaries)
    save_csv("reko-byte-comparison.csv", reko)

    procedures = json.loads((ROOT / "original-export/code/procedures.json").read_text())
    sources = {p.name: read("POOP/" + p.name).decode("cp1252").splitlines()
               for p in sorted((source / "POOP").glob("*.bas"))}
    sources["main.txt"] = read("POOP/main.txt").decode("cp1252").splitlines()

    def enclosing(file, line):
        return next((p["name"] for p in procedures if p["file"] == file and p["start_line"] <= line <= p["end_line"]), "declarations")

    refs = []
    for file, lines in sources.items():
        for number, line in enumerate(lines, 1):
            if line.lstrip().startswith("'"):
                continue
            # Exclude literals/comments when looking for executable tokens.
            code = re.sub(r'"(?:[^"]|"")*"', '""', line).split("'", 1)[0]
            tags = []
            if re.search(r"\b(?:Rnd|Randomize)\b", code, re.I):
                tags.append("random")
            if re.search(r"tim\w+\.(?:Enabled|Interval)|\bM602F\b", code, re.I):
                tags.append("timer_or_pause")
            if re.search(r"\b(?:fn0DEE|sub155A)\b", code, re.I):
                tags.append("combat_entry")
            if tags:
                refs.append(dict(file=file, line=number, procedure=enclosing(file, number),
                                 category=";".join(tags), expression=line.strip()))
    save_csv("random-timer-combat-references.csv", refs)

    timers = []
    for path in sorted((source / "POOP").glob("*.FRM")):
        data = read("POOP/" + path.name)
        for match in re.finditer(rb"tim[A-Za-z]+", data):
            start, end = match.span()
            if data[start - 1] != end - start or data[end:end + 3] != b"\x0b\xff\x03":
                continue
            timers.append(dict(file=path.name, control=match[0].decode(), name_offset=start,
                               value_offset=end + 3, raw_u32=struct.unpack_from("<I", data, end + 3)[0],
                               bytes=data[start - 1:end + 19].hex(" "),
                               status="candidate_interval_property_not_runtime_measurement"))
    save_csv("form-timer-candidates.csv", timers)

    constants = {}
    for file, lines in sources.items():
        for line in lines:
            m = re.match(r"(?:Global )?Const (\w+) = (-?\d+)\b", line)
            if m:
                constants[(file, m[1])] = int(m[2])
    def integer(file, symbol):
        return constants.get((file, symbol), constants.get(("main.txt", symbol)))

    audio = []
    audio_path = OUT / "audio"
    audio_path.mkdir(exist_ok=True)
    for path in sorted((source / "_Original Game Files/MUSIC").iterdir()):
        if path.suffix.upper() not in [".MID", ".WAV"]:
            continue
        relative = path.relative_to(source).as_posix()
        data = read(relative)
        record = dict(name=path.name, source=relative, size=len(data), sha256=sha(data))
        if path.suffix.upper() == ".WAV":
            with wave.open(io.BytesIO(data)) as wav:
                record.update(channels=wav.getnchannels(), sample_rate=wav.getframerate(),
                              bits_per_sample=8 * wav.getsampwidth(), frames=wav.getnframes(),
                              duration_seconds=wav.getnframes() / wav.getframerate())
        else:
            assert data[:4] == b"MThd" and struct.unpack_from(">I", data, 4)[0] == 6
            form, tracks, division = struct.unpack_from(">3H", data, 8)
            p = 14
            for _ in range(tracks):
                assert data[p:p + 4] == b"MTrk"
                size = struct.unpack_from(">I", data, p + 4)[0]
                p += size + 8
                assert p <= len(data)
            assert p == len(data)
            record.update(midi_format=form, midi_tracks=tracks, division_raw=division)
        (audio_path / path.name).write_bytes(data)
        assert sha((audio_path / path.name).read_bytes()) == record["sha256"]
        audio.append(record)
    save_json("audio-manifest.json", audio)
    names = {r["name"].upper() for r in audio}
    assignments = []
    for file, lines in sources.items():
        for number, line in enumerate(lines, 1):
            m = re.search(r'(gv20CA|gv2164)\((\w+)\) = "([^"]+)"', line)
            if m:
                value = integer(file, m[2])
                # These two module/global variables are declared, never assigned;
                # keep their default-zero interpretation explicitly provisional.
                if value is None and m[2] in ["m0624", "gv2096"]:
                    value = "0 (implicit-default candidate)"
                assignments.append(dict(file=file, line=number, array=m[1], symbol=m[2],
                                        index=value if value is not None else "unresolved", asset=m[3],
                                        present=m[3].upper() in names))
    save_csv("audio-index-assignments.csv", assignments)
    wav_index = {str(row["index"]): row["asset"] for row in assignments if row["array"] == "gv20CA"}
    wav_index["0"] = next(row["asset"] for row in assignments if row["symbol"] == "m0624")
    calls = []
    for file, lines in sources.items():
        for number, line in enumerate(lines, 1):
            m = re.match(r"\s*(sub09DE|sub086D|sub063F)\s+(.+?)\s*$", line)
            if not m:
                continue
            arg = m[2]
            value = integer(file, arg)
            calls.append(dict(file=file, line=number, procedure=enclosing(file, number), helper=m[1],
                              argument=arg, index=value if value is not None else "unresolved_expression",
                              wav_asset=wav_index.get(str(value), "") if m[1] != "sub063F" else ""))
    save_csv("audio-call-sites.csv", calls)

    # Audit packaged dependencies without running or unpacking the installer.
    package = read("Mordor/setup/MORDOR.WIP")
    with zipfile.ZipFile(io.BytesIO(package)) as archive:
        members = [dict(name=i.filename, size=i.file_size, sha256=sha(archive.read(i))) for i in archive.infolist() if not i.is_dir()]
    mak = read("POOP/MORDOR.MAK").decode("cp1252")
    dependencies = []
    required = sorted(set(re.findall(r'^([A-Z0-9]+\.VBX)\r?$', mak, re.M)) | {"VBRUN300.DLL", "WAVMIX16.DLL", "SETUPKIT.DLL"})
    source_files = list(original["files"])
    lib = OUT / "runtime-libraries"
    lib.mkdir(exist_ok=True)
    for name in required:
        loose = [p for p in source_files if Path(p.replace("\\", "/")).name.upper() == name]
        archived = [i for i in members if Path(i["name"]).name.upper() == name]
        compressed = "Mordor/setup/" + name[:-1] + "_"
        packed = None
        payload = None
        if (source / compressed).is_file():
            payload = expand_szdd(read(compressed))
            packed = dict(source=compressed, size=len(payload), sha256=sha(payload))
        if loose:
            separate = read(loose[0].replace("\\", "/"))
            if payload is not None:
                assert payload == separate, name
                packed["matches_separately_supplied_file"] = True
            payload = separate
        elif archived:
            with zipfile.ZipFile(io.BytesIO(package)) as archive:
                separate = archive.read(archived[0]["name"])
            if payload is not None:
                assert payload == separate, name
            payload = separate
        if payload is not None:
            (lib / name).write_bytes(payload)
            assert (lib / name).read_bytes() == payload
        dependencies.append(dict(name=name, loose_paths=loose, installer_members=archived,
                                 compressed_member=packed, available=payload is not None,
                                 staged_sha256=sha(payload) if payload is not None else None))
    save_json("runtime-dependencies.json", dict(dependencies=dependencies,
              path_runners={name: shutil.which(name) for name in ["otvdm", "otvdmw", "dosbox", "dosbox-x", "qemu-system-i386"]},
              execution_status="not_executed", runtime_compatibility="not_validated"))

    with zipfile.ZipFile(io.BytesIO(read("Mordor/setup/WAVES.WIP"))) as archive:
        wave_archive = []
        for entry in archive.infolist():
            if entry.is_dir():
                continue
            data = archive.read(entry)
            copied = audio_path / Path(entry.filename).name
            same = copied.is_file() and copied.read_bytes() == data
            wave_archive.append(dict(name=entry.filename, sha256=sha(data), matches_installed_audio=same))
        assert all(r["matches_installed_audio"] for r in wave_archive)
    save_json("wave-archive-comparison.json", wave_archive)

    # Match source literals to bytes, explicitly weaker than procedure mapping.
    exe = read("_Original Game Files/MORDOR.EXE")
    literals = []
    for file, lines in sources.items():
        for number, line in enumerate(lines, 1):
            if line.lstrip().startswith("'"):
                continue
            for m in re.finditer(r'"((?:[^"]|"")*)"', line):
                value = m[1].replace('""', '"')
                if len(value) < 24:
                    continue
                raw = value.encode("cp1252")
                off = exe.find(raw)
                literals.append(dict(file=file, line=number, procedure=enclosing(file, number),
                                     literal=value, exe_offset=off if off >= 0 else "not_found",
                                     status="literal_match_only" if off >= 0 else "not_found"))
    save_csv("source-literal-provenance.csv", literals)

    changed, missing = [], []
    for relative, expected in original["files"].items():
        path = source / relative
        if not path.is_file():
            missing.append(relative)
        elif dict(size=path.stat().st_size, sha256=sha(path.read_bytes())) != expected:
            changed.append(relative)
    actual = {str(p.relative_to(source)) for p in source.rglob("*") if p.is_file()}
    added = sorted(actual - set(original["files"]))
    preservation = dict(files=len(original["files"]), changed=changed, missing=missing, added=added,
                        passed=not (changed or missing or added))
    save_json("source-preservation-check.json", preservation)
    assert preservation["passed"], preservation
    save_json("source-manifest.json", dict(source_root=str(source), files=inputs))
    summary = dict(review_date="2026-10-10", original_runtime_executed=False,
                   audio_files=len(audio), audio_types=dict(Counter(Path(r["name"]).suffix for r in audio)),
                   audio_index_assignments=len(assignments),
                   missing_indexed_audio=[r["asset"] for r in assignments if not r["present"]],
                   audio_call_sites=len(calls), form_timer_candidates=len(timers),
                   reko_files=len(reko), reko_status_counts=dict(Counter(r["evidence"] for r in reko)),
                   reko_matching_dump_bytes=sum(r["matching_bytes"] for r in reko),
                   reko_unbacked_dump_bytes=sum(r["outside_file_bytes"] for r in reko),
                   reko_unexplained_mismatch_bytes=sum(r["mismatching_bytes"] for r in reko),
                   source_literal_occurrences=len(literals),
                   source_literal_matches=sum(r["status"] == "literal_match_only" for r in literals),
                   random_timer_combat_references=len(refs),
                   runtime_libraries_staged=sum(r["available"] for r in dependencies),
                   original_files_unchanged=preservation["passed"])
    save_json("summary.json", summary)
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
