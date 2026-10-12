"""Build source-linked combat helper and damage-path trace specifications."""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export"


def code_part(line):
    return re.sub(r'"(?:[^"]|"")*"', '""', line).split("'", 1)[0]


def main():
    manifest = json.loads((OUT / "source-manifest.json").read_text(encoding="utf-8"))
    source_root = Path(manifest["source_root"])
    procedures = json.loads((EXPORT / "code/procedures.json").read_text(encoding="utf-8"))
    module4 = (source_root / "POOP/Module4.bas").read_text(encoding="cp1252").splitlines()
    by_line = {line: p["name"] for p in procedures if p["file"] == "Module4.bas" for line in range(int(p["start_line"]), int(p["end_line"]) + 1)}

    callers = []
    for number, line in enumerate(module4, 1):
        code = code_part(line)
        if re.search(r"^\s*Function\s+fn0DEE\b", code, re.I):
            continue
        match = re.search(r"\bfn0DEE\s*\(([^)]*)\)", code, re.I)
        if not match:
            continue
        args = [part.strip() for part in match.group(1).split(",")]
        assert len(args) == 5, (number, args)
        window = "\n".join(module4[number:min(len(module4), number + 18)])
        markers = []
        for pattern, label in [(r"<\s*1", "miss_gate"), (r"-\s*l\d{4}", "damage_debit"), (r"l\d{4}\s*>\s*0", "hit_or_swing_gate"), (r"M4EAC", "hp_or_damage_state")]:
            if re.search(pattern, window, re.I):
                markers.append(label)
        callers.append({
            "file": "Module4.bas", "line": number, "procedure": by_line[number],
            "arguments": args, "argument_count": len(args),
            "post_call_markers": markers, "post_call_source_window": window,
            "expected_result": "unmeasured", "status": "static_caller_trace_runtime_pending",
        })
    assert len(callers) == 3

    helper_start, helper_end = 2212, 2258
    helper_lines = module4[helper_start - 1:helper_end]
    helper_events = []
    for number, line in enumerate(helper_lines, helper_start):
        code = code_part(line)
        if re.search(r"\b(?:Rnd|CInt|Int|Fix|Log)\b|l03C0\s*=|l03CE\s*=|l03CC\s*=|pv03B[CE]\s*=", code, re.I):
            helper_events.append({"line": number, "expression": line.strip()})
    fixtures = [
        {"id": "COMBAT-ZERO-EQUAL", "arguments": [0, 0, 0, 1, 1.0], "purpose": "Exercise equal-zero hit chance branch and minimum clamps."},
        {"id": "COMBAT-ATTACK-GREATER", "arguments": [100, 50, 1, 20, 1.0], "purpose": "Exercise attacker advantage branch."},
        {"id": "COMBAT-DEFENSE-GREATER", "arguments": [50, 100, 1, 20, 1.0], "purpose": "Exercise defender advantage branch."},
        {"id": "COMBAT-ZERO-DEFENSE", "arguments": [50, 0, 1, 20, 1.0], "purpose": "Exercise the zero-defense sub-branch."},
        {"id": "COMBAT-LOW-MULTIPLIER", "arguments": [50, 50, 1, 20, 0.0], "purpose": "Verify pv03BE <= 0 is replaced by .1# before damage."},
        {"id": "COMBAT-LOW-POWER", "arguments": [50, 50, 1, 0, 1.0], "purpose": "Verify pv03BC < 1 is replaced by 1 before CInt."},
        {"id": "COMBAT-HIT-CLAMP-LOW", "arguments": [-100, 100, 1, 20, 1.0], "purpose": "Verify the lower 2-percent hit-probability clamp."},
        {"id": "COMBAT-HIT-CLAMP-HIGH", "arguments": [100, -100, 1, 20, 1.0], "purpose": "Verify the upper 98-percent hit-probability clamp."},
    ]
    for fixture in fixtures:
        fixture.update(expected_result=None, status="planned_not_executed", random_draw_count=4)
    result = {
        "status": "STATIC_COMBAT_TRACE_BUILT_RUNTIME_PENDING",
        "helper": {"file": "Module4.bas", "procedure": "fn0DEE", "source_start": helper_start, "source_end": helper_end, "random_draw_count": 4, "events": helper_events},
        "fn0DEE_callers": callers,
        "fixtures": fixtures,
        "runtime_requirements": [
            "capture all five typed arguments at each caller",
            "capture the four Rnd outputs in fn0DEE order",
            "capture CInt and Int intermediates and any error path",
            "capture hit/miss, damage debit, swing and special-effect branches",
        ],
    }
    (OUT / "combat-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"fn0DEE_callers": len(callers), "helper_random_draws": 4, "fixtures": len(fixtures), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
