"""Index VB3 numeric conversion and shared-RNG sites for R03.

This is a static evidence export. It does not emulate VB3 or claim expected
conversion results; every fixture keeps its expected value explicitly
unmeasured until a compatible original runtime can execute it.
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


def code_part(line):
    code = re.sub(r'"(?:[^"]|"")*"', '""', line)
    return code.split("'", 1)[0]


def enclosing(procedures, file_name, line_number):
    matches = [p for p in procedures if p["file"] == file_name and int(p["start_line"]) <= line_number <= int(p["end_line"])]
    return matches[0]["name"] if matches else "declarations"


def main():
    manifest = json.loads((OUT / "source-manifest.json").read_text(encoding="utf-8"))
    source_root = Path(manifest["source_root"])
    procedures = json.loads((EXPORT / "code/procedures.json").read_text(encoding="utf-8"))
    conversion_rows = []
    rng_rows = []
    randomize_rows = []
    per_procedure_rng = {}
    for path in sorted((source_root / "POOP").glob("*.bas")):
        lines = path.read_text(encoding="cp1252").splitlines()
        for line_number, line in enumerate(lines, 1):
            code = code_part(line)
            procedure = enclosing(procedures, path.name, line_number)
            for match in re.finditer(r"\b(CInt|CLng|CSng|CDbl|CByte|Fix|Int)\s*\(", code, re.I):
                kind = match.group(1)
                conversion_rows.append({
                    "file": path.name, "line": line_number, "procedure": procedure,
                    "conversion": kind, "expression": line.strip(),
                    "expected_value": "unmeasured",
                    "required_runtime_check": "VB3 conversion, rounding, overflow and error behavior",
                })
            if re.search(r"\bRandomize\b", code, re.I):
                randomize_rows.append({"file": path.name, "line": line_number, "procedure": procedure, "expression": line.strip()})
            for match in re.finditer(r"\bRnd\b", code, re.I):
                key = (path.name, procedure)
                ordinal = per_procedure_rng.get(key, 0) + 1
                per_procedure_rng[key] = ordinal
                rng_rows.append({
                    "file": path.name, "line": line_number, "procedure": procedure,
                    "ordinal_in_procedure": ordinal, "expression": line.strip(),
                    "expected_value": "unmeasured",
                })

    conversion_rows.sort(key=lambda row: (row["file"], int(row["line"]), row["conversion"]))
    rng_rows.sort(key=lambda row: (row["file"], int(row["line"]), int(row["ordinal_in_procedure"])))
    randomize_rows.sort(key=lambda row: (row["file"], int(row["line"])))
    OUT.mkdir(parents=True, exist_ok=True)
    for name, records in [("numeric-conversion-sites.csv", conversion_rows), ("rng-call-sites.csv", rng_rows), ("randomize-sites.csv", randomize_rows)]:
        with (OUT / name).open("w", encoding="utf-8", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=list(records[0]))
            writer.writeheader()
            writer.writerows(records)

    fixtures = [
        {"id": "NUM-CINT-TIES", "operation": "CInt", "inputs": [-2.5, -1.5, -0.5, 0.5, 1.5, 2.5], "expected": None, "status": "planned_not_executed", "purpose": "Determine VB3 tie rounding and sign behavior."},
        {"id": "NUM-INT-FIX-NEGATIVE", "operation": "Int/Fix", "inputs": [-2.75, -2.5, -2.0, -1.25, -0.5, 0.0, 0.5], "expected": None, "status": "planned_not_executed", "purpose": "Separate floor semantics from truncation for negative values."},
        {"id": "NUM-INTEGER-BOUNDARY", "operation": "CInt", "inputs": [32766.4, 32767.0, 32767.4, 32767.5, 32768.0, -32768.0, -32768.5], "expected": None, "status": "planned_not_executed", "purpose": "Record overflow boundary and error behavior."},
        {"id": "NUM-LONG-BOUNDARY", "operation": "CLng", "inputs": [2147483646.4, 2147483647.0, 2147483647.5, -2147483648.0], "expected": None, "status": "planned_not_executed", "purpose": "Record Long conversion boundary behavior."},
        {"id": "RNG-MUSIC-COUPLING", "operation": "Rnd sequence", "inputs": ["Randomize", "FRMMAIN.timMusic_Timer", "Module9.sub1A50"], "expected": None, "status": "planned_not_executed", "purpose": "Compare gameplay draws with music enabled and disabled while preserving call order."},
    ]
    schedule = {
        "randomize_sites": randomize_rows,
        "music_path": [
            {"file": "Module6.bas", "procedure": "Main", "role": "startup Randomize"},
            {"file": "FRMMAIN.bas", "procedure": "timMusic_Timer", "role": "music timer calls sub1A50 when M602F is false and playback is not active"},
            {"file": "Module9.bas", "procedure": "sub1A50", "role": "music selection consumes Rnd at source lines 82 and 88"},
        ],
        "music_rng_sites": [row for row in rng_rows if row["file"] == "Module9.bas" and row["procedure"] == "sub1A50"],
        "fixtures": fixtures,
        "status": "static_schedule_built_runtime_trace_pending",
    }
    (OUT / "vb3-semantics-fixtures.json").write_text(json.dumps({"conversion_site_count": len(conversion_rows), "rng_site_count": len(rng_rows), "randomize_site_count": len(randomize_rows), "fixtures": fixtures}, indent=2) + "\n", encoding="utf-8")
    (OUT / "rng-schedule.json").write_text(json.dumps(schedule, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"numeric_conversion_sites": len(conversion_rows), "rng_call_sites": len(rng_rows), "randomize_sites": len(randomize_rows), "music_rng_sites": len(schedule["music_rng_sites"]), "fixtures": len(fixtures), "status": schedule["status"]}, indent=2))


if __name__ == "__main__":
    main()
