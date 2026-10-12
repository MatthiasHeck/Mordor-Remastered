"""Map the saved Reko segment dumps to the NE image without executing code.

The saved MORDOR Reko project contains byte dumps for all 50 NE segments, but
only one segment has a ``.dis``/``.c`` function listing.  This report makes
that boundary explicit: segment identity and relocation storage can be
verified from bytes; individual DoDi procedure addresses still require a
function-level disassembly or a fresh Reko analysis.
"""
from pathlib import Path
import csv
import json
import re
import struct

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
SOURCE = Path(r"D:\Programming Projects\Mordor")
ORIGINAL = SOURCE / "_Original Game Files"
REKO = ORIGINAL / "MORDOR.reko"


def ne_header(data):
    base = struct.unpack_from("<I", data, 0x3C)[0]
    assert data[base:base + 2] == b"NE"
    word = lambda offset: struct.unpack_from("<H", data, base + offset)[0]
    shift = word(0x32)
    table = base + word(0x22)
    segments = []
    for index in range(word(0x1C)):
        sector, length, flags, allocation = struct.unpack_from("<4H", data, table + 8 * index)
        length = length or 65536
        segments.append({
            "segment_index": index + 1,
            "file_offset": sector << shift,
            "file_bytes": 0 if not sector else length,
            "flags": flags,
            "minimum_allocation": allocation or 65536,
        })
    return segments


def relocation_count(data, segment):
    if not segment["file_bytes"] or not segment["flags"] & 0x100:
        return 0
    table = segment["file_offset"] + segment["file_bytes"]
    return struct.unpack_from("<H", data, table)[0]


def parse_header():
    text = (REKO / "MORDOR.h").read_text(encoding="utf-8-sig")
    records = {}
    for match in re.finditer(r'\(segment "seg([0-9A-F]{4})_t" ([0-9A-F]+)\)', text):
        records[match.group(1)] = {"reko_segment": match.group(1), "declared_bytes": int(match.group(2), 16)}
    for match in re.finditer(r'\(in seg([0-9A-F]{4}) @ ([0-9A-F]+) : selector\)', text):
        records.setdefault(match.group(1), {"reko_segment": match.group(1)})["selector_value"] = int(match.group(2), 16)
    return records


def dump_bytes(path):
    rows = []
    for number, line in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
        match = re.match(r"^([0-9A-F]{4}):([0-9A-F]{4}) ", line)
        if not match:
            continue
        fields = line[10:57].split()
        if fields and all(re.fullmatch(r"[0-9A-F]{2}", field) for field in fields):
            rows.append((number, int(match.group(2), 16), bytes.fromhex(" ".join(fields))))
    return rows


def score_segment(binary, segment, chunks):
    if not segment["file_bytes"]:
        return 0
    probes = [(offset, payload) for _, offset, payload in chunks if len(set(payload)) >= 4][:200]
    return sum(
        offset + len(payload) <= segment["file_bytes"]
        and binary[segment["file_offset"] + offset:segment["file_offset"] + offset + len(payload)] == payload
        for offset, payload in probes
    )


def main():
    binary = (ORIGINAL / "MORDOR.EXE").read_bytes()
    segments = ne_header(binary)
    header = parse_header()
    dis_segments = {path.stem.rsplit("_", 1)[1] for path in REKO.glob("*.dis")}
    c_segments = {path.stem.rsplit("_", 1)[1] for path in REKO.glob("*.c")}
    asm_paths = sorted(REKO.glob("*.asm"))
    report = []
    for path in asm_paths:
        reko_segment = path.stem.rsplit("_", 1)[1]
        chunks = dump_bytes(path)
        declared = header.get(reko_segment, {}).get("declared_bytes", 0)
        candidates = []
        for segment in segments:
            if declared and (segment["file_bytes"] == declared or segment["minimum_allocation"] == declared):
                candidates.append((score_segment(binary, segment, chunks), segment))
        candidates.sort(key=lambda item: item[0], reverse=True)
        best_score = candidates[0][0] if candidates else 0
        tied = len(candidates) > 1 and candidates[0][0] == candidates[1][0]
        mapped = bool(candidates) and not tied
        segment = candidates[0][1] if mapped else {}
        max_dump = max((offset + len(payload) for _, offset, payload in chunks), default=0)
        report.append({
            "reko_segment": reko_segment,
            "selector_value": f"0x{header.get(reko_segment, {}).get('selector_value', 0):04X}",
            "declared_bytes": declared,
            "asm_dump_lines": len(chunks),
            "dump_bytes_end": max_dump,
            "function_listing": "yes" if reko_segment in dis_segments else "no",
            "c_listing": "yes" if reko_segment in c_segments else "no",
            "segment_index": segment.get("segment_index", ""),
            "file_offset": f"0x{segment.get('file_offset', 0):X}" if mapped else "",
            "file_bytes": segment.get("file_bytes", ""),
            "segment_flags": f"0x{segment.get('flags', 0):X}" if mapped else "",
            "relocation_records": relocation_count(binary, segment) if mapped else "",
            "byte_probe_score": best_score,
            "mapping_status": ("mapped_bytes_and_declared_size" if best_score >= 3 else "mapped_declared_size_only") if mapped else "ambiguous_or_unmapped",
            "function_address_status": "function_range_available" if reko_segment in dis_segments else "no_function_range_in_saved_reko_output",
        })
    assert len(report) == 50
    assert sum(row["mapping_status"].startswith("mapped_") for row in report) == 50
    assert sum(row["function_listing"] == "yes" for row in report) == 1
    OUT.mkdir(parents=True, exist_ok=True)
    with (OUT / "reko-segment-relocation-map.csv").open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(report[0]))
        writer.writeheader()
        writer.writerows(report)
    summary = {
        "status": "SEGMENT_MAPPING_VERIFIED_FUNCTION_MAPPING_PENDING",
        "reko_asm_segments": len(report),
        "mapped_segments": sum(row["mapping_status"].startswith("mapped_") for row in report),
        "byte_verified_segments": sum(row["mapping_status"] == "mapped_bytes_and_declared_size" for row in report),
        "declared_size_only_segments": sum(row["mapping_status"] == "mapped_declared_size_only" for row in report),
        "segments_with_function_listing": sum(row["function_listing"] == "yes" for row in report),
        "segments_with_c_listing": sum(row["c_listing"] == "yes" for row in report),
        "segments_with_relocation_records": sum(bool(row["relocation_records"]) and int(row["relocation_records"]) > 0 for row in report),
        "selected_procedure_addresses_resolved": 0,
        "next_required_evidence": "Function-level Reko p-code/disassembly with entry ranges and relocation-aware call/global-reference xrefs",
    }
    (OUT / "reko-segment-relocation-summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
