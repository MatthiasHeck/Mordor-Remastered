"""Build a conservative provenance map for the selected decompiler routines.

This intentionally does not claim that a source procedure has been located at a
particular machine-code address. Long string matches anchor data bytes only;
generated DoDi names are not executable symbols. The output records source
call-graph evidence and the exact evidence still needed for code-address mapping.
"""
from pathlib import Path
import csv
import json
import re

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export"


def rows(path):
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def write_csv(path, records):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(records[0]))
        writer.writeheader()
        writer.writerows(records)


def main():
    procedures = json.loads((EXPORT / "code/procedures.json").read_text(encoding="utf-8"))
    selected = rows(EXPORT / "code/selected-routines.csv")
    selected_keys = {(r["file"], r["procedure"]): r for r in selected}
    by_file_name = {(p["file"], p["name"]): p for p in procedures}
    known = {p["name"] for p in procedures}
    source = {}
    for path in sorted((EXPORT / "code/source").glob("*.bas")):
        source[path.name] = path.read_text(encoding="cp1252").splitlines()
    literal_rows = rows(OUT / "source-literal-provenance.csv")
    long_literals = {(r["file"], int(r["line"])): r for r in literal_rows}
    reverse = {name: [] for name in known}
    for p in procedures:
        lines = source[p["file"]][p["start_line"] - 1:p["end_line"]]
        body = "\n".join(lines)
        calls = sorted({x for x in re.findall(r"\b(?:fn|sub)[0-9A-Fa-f]{4}\b", body) if x in known})
        for callee in calls:
            reverse.setdefault(callee, []).append(f"{p['file']}:{p['name']}")

    report = []
    for selected_row in selected:
        key = (selected_row["file"], selected_row["procedure"])
        p = by_file_name.get(key)
        assert p, key
        lines = source[p["file"]][p["start_line"] - 1:p["end_line"]]
        body = "\n".join(lines)
        calls = sorted({x for x in re.findall(r"\b(?:fn|sub)[0-9A-Fa-f]{4}\b", body) if x in known and x != p["name"]})
        string_anchors = []
        for number, line in enumerate(lines, p["start_line"]):
            if (p["file"], number) in long_literals:
                anchor = long_literals[(p["file"], number)]
                string_anchors.append(f"{anchor['literal']} @ EXE+0x{int(anchor['exe_offset']):X}")
        flags = []
        for token, label in [(r"\bRnd\b", "Rnd"), (r"\bRandomize\b", "Randomize"),
                             (r"\b(?:CInt|CLng|CSng|CDbl|Int|Fix)\b", "VB_conversion"),
                             (r"\bLog\s*\(", "Log"), (r"\bOn Error\b", "error_handler"),
                             (r"\b(?:Timer|Interval|Enabled|M602F)\b", "timer_or_pause")]:
            if re.search(token, body, re.I):
                flags.append(label)
        status = "source_and_data_anchor" if string_anchors else "source_only_no_direct_data_anchor"
        report.append({
            "category": selected_row["category"], "file": p["file"], "procedure": p["name"],
            "source_start": p["start_line"], "source_end": p["end_line"],
            "generated_calls": ";".join(calls),
            "caller_count": len(reverse.get(p["name"], [])),
            "callers": ";".join(sorted(reverse.get(p["name"], []))),
            "long_string_data_anchors": ";".join(string_anchors),
            "semantic_markers": ";".join(flags), "mapping_status": status,
            "machine_code_address": "unresolved",
            "required_next_step": "Map DoDi routine to Reko entry via p-code control-flow and relocation-aware xrefs"
        })
    write_csv(OUT / "critical-procedure-provenance.csv", report)

    notes = [
        "# Critical-procedure provenance — R02",
        "",
        "This map deliberately distinguishes four kinds of evidence: source line identity, generated-symbol call graph, long-string data anchors, and executable code-address mapping. Only the first three are established here.",
        "",
        "The supplied DoDi names (`fn0DEE`, `sub155A`, and similar) are names in decompiler output. They are not symbols exported by `MORDOR.EXE`. The Reko project contains segmented disassembly and p-code, but does not preserve the DoDi procedure names. A string found in the executable proves that data exists in the binary; it does not prove which routine references that data.",
        "",
        "For each selected routine, `critical-procedure-provenance.csv` records its source line range, generated calls and callers, conversion/error/timer markers, and any long-string match. The `machine_code_address` field remains `unresolved` until a relocation-aware p-code/xref mapping is established.",
        "",
        "The highest-risk example is `Module4.fn0DEE`: its source body has no long string literal, so its current evidence is source identity plus callers (`Module4.fn0DCD`). The numerical expression is therefore not yet executable-address verified. The combat timer callback similarly has no direct string anchor; its static timing evidence comes from source and form bytes, not a mapped procedure address.",
        "",
        "The next R02 operation is to parse Reko's `MORDOR.h`/`.dis` function entry ranges and relocation records, then compare call-site and global-reference patterns against each selected source routine. A successful result must include a segment:offset, a byte range, and the evidence used; a failed or ambiguous match must remain explicitly unresolved.",
    ]
    (OUT / "critical-procedure-provenance.md").write_text("\n".join(notes) + "\n", encoding="utf-8")
    print(json.dumps({
        "selected_routines": len(report),
        "source_and_data_anchor": sum(x["mapping_status"] == "source_and_data_anchor" for x in report),
        "source_only_no_direct_data_anchor": sum(x["mapping_status"] == "source_only_no_direct_data_anchor" for x in report),
        "machine_code_addresses_resolved": 0,
        "status": "R02_PROVENANCE_MAP_BUILT_ADDRESS_MAPPING_PENDING"
    }, indent=2))


if __name__ == "__main__":
    import json
    main()
