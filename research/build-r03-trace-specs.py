"""Build ordered static trace specifications for high-risk VB3 routines.

The output describes the operations a compatible original runtime must expose;
it does not substitute Python or Godot arithmetic for VB3 behavior.
"""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export"

TARGETS = [
    ("combat", "Module4.bas", "fn0DEE"),
    ("combat", "Module4.bas", "sub1019"),
    ("combat", "Module4.bas", "sub0C8A"),
    ("combat", "Module4.bas", "sub0E85"),
    ("combat", "Module6.bas", "fn1173"),
    ("creation", "FRMCTYG.bas", "cmdMake_Click"),
    ("music", "Module9.bas", "sub1A50"),
    ("music", "FRMMAIN.bas", "timMusic_Timer"),
]


def code_part(line):
    return re.sub(r'"(?:[^"]|"")*"', '""', line).split("'", 1)[0]


def main():
    procedures = json.loads((EXPORT / "code/procedures.json").read_text(encoding="utf-8"))
    by_key = {(p["file"], p["name"]): p for p in procedures}
    specs = []
    for category, file_name, procedure_name in TARGETS:
        procedure = by_key[(file_name, procedure_name)]
        lines = (Path(json.loads((OUT / "source-manifest.json").read_text(encoding="utf-8"))["source_root"]) / "POOP" / file_name).read_text(encoding="cp1252").splitlines()
        events = []
        rnd_ordinal = 0
        for line_number in range(int(procedure["start_line"]), int(procedure["end_line"]) + 1):
            source_line = lines[line_number - 1]
            code = code_part(source_line)
            tokens = []
            for match in re.finditer(r"\b(Randomize|Rnd|CInt|CLng|CSng|CDbl|CByte|Fix|Int)\b", code, re.I):
                token = match.group(1)
                lower = token.lower()
                if lower == "rnd":
                    rnd_ordinal += 1
                    kind = "rnd"
                    ordinal = rnd_ordinal
                elif lower == "randomize":
                    kind = "randomize"
                    ordinal = None
                else:
                    kind = "numeric_conversion" if lower not in {"int", "fix"} else lower
                    ordinal = None
                tokens.append({"kind": kind, "token": token, "column": match.start() + 1, "ordinal": ordinal})
            if tokens:
                events.append({"line": line_number, "expression": source_line.strip(), "tokens": tokens})
        specs.append({
            "category": category,
            "file": file_name,
            "procedure": procedure_name,
            "source_start": int(procedure["start_line"]),
            "source_end": int(procedure["end_line"]),
            "events": events,
            "rnd_count": rnd_ordinal,
            "expected_trace": None,
            "status": "static_trace_spec_runtime_pending",
            "trace_requirements": [
                "capture each Rnd output in listed order",
                "capture VB conversion result or runtime error",
                "capture final state and branch decisions",
                "repeat with music enabled and disabled when category is music or combat",
            ],
        })
    result = {
        "status": "STATIC_TRACE_SPECS_BUILT_RUNTIME_PENDING",
        "routine_count": len(specs),
        "total_rnd_events": sum(s["rnd_count"] for s in specs),
        "specs": specs,
    }
    (OUT / "numeric-rng-trace-specs.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"routine_count": len(specs), "total_rnd_events": result["total_rnd_events"], "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
