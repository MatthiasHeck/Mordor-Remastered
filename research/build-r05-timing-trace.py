"""Build a source-linked timer, pause and callback trace specification."""
from pathlib import Path
import csv
import json
import re

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export"


def main():
    manifest = json.loads((OUT / "source-manifest.json").read_text(encoding="utf-8"))
    source_root = Path(manifest["source_root"])
    timer_candidates = list(csv.DictReader((OUT / "form-timer-candidates.csv").open(encoding="utf-8", newline="")))
    refs = list(csv.DictReader((OUT / "random-timer-combat-references.csv").open(encoding="utf-8", newline="")))
    source = {name: (source_root / "POOP" / name).read_text(encoding="cp1252").splitlines() for name in ["Module3.bas", "FRMDUNM.bas", "FRMMAIN.bas"]}

    controls = []
    for row in timer_candidates:
        controls.append({"form": row["file"], "control": row["control"], "stored_interval_ms": int(row["raw_u32"]), "bytes": row["bytes"], "evidence": "binary_form_candidate", "observed": None})
    source_events = [
        {"file": "Module3.bas", "line": 724, "procedure": "sub0A49", "event": "constant_declaration", "expression": "mc01B0 = 1000"},
        {"file": "Module3.bas", "line": 734, "procedure": "sub0A49", "event": "combat_interval_assignment", "expression": "frmDungeonMain!timCombat.Interval = mc01B0"},
        {"file": "FRMDUNM.bas", "line": 240, "procedure": "Form_Load", "event": "combat_interval_setup_call", "expression": "sub0A49"},
        {"file": "FRMDUNM.bas", "line": 612, "procedure": "timCombat_Timer", "event": "combat_callback_entry", "expression": "timCombat_Timer"},
        {"file": "FRMDUNM.bas", "line": 613, "procedure": "timCombat_Timer", "event": "pause_or_reentry_guard", "expression": "If m0024 = True Or gv1ACC.M602F = True Then Exit Sub"},
        {"file": "FRMDUNM.bas", "line": 622, "procedure": "timCombat_Timer", "event": "combat_round_dispatch", "expression": "sub155A gv14C2(m00A4).M59BB"},
        {"file": "FRMDUNM.bas", "line": 391, "procedure": "timAilment_Timer", "event": "ailment_callback_entry", "expression": "timAilment_Timer"},
        {"file": "FRMDUNM.bas", "line": 427, "procedure": "timAilment_Timer", "event": "pause_guard", "expression": "If m0026 = True Or gv1ACC.M602F = True Then Exit Sub"},
        {"file": "FRMMAIN.bas", "line": 288, "procedure": "timMusic_Timer", "event": "music_callback_entry", "expression": "timMusic_Timer"},
        {"file": "FRMMAIN.bas", "line": 292, "procedure": "timMusic_Timer", "event": "music_pause_guard", "expression": "If gv1ACC.M602F = False Then"},
        {"file": "FRMMAIN.bas", "line": 209, "procedure": "MDIForm_Activate", "event": "pause_set", "expression": "gv1ACC.M602F = True"},
        {"file": "FRMMAIN.bas", "line": 221, "procedure": "MDIForm_Activate", "event": "pause_clear", "expression": "gv1ACC.M602F = False"},
    ]
    cases = json.loads((OUT / "runtime-cases.json").read_text(encoding="utf-8"))["cases"]
    selected_cases = [case for case in cases if case["id"] in {"TIM01", "TIM02", "TIM03"}]
    assert len(timer_candidates) == 4 and len(selected_cases) == 3
    result = {
        "status": "STATIC_TIMING_TRACE_BUILT_RUNTIME_PENDING",
        "timer_controls": controls,
        "source_events": source_events,
        "timer_pause_reference_count": sum(1 for row in refs if "timer_or_pause" in row["category"]),
        "runtime_cases": selected_cases,
        "static_candidates": {"combat_form_ms": 1500, "combat_assignment_ms": 1000, "ailment_form_ms": 4000, "music_form_ms": 10000},
        "known_discrepancy": "The form stores 1500 ms for timCombat while dungeon setup assigns 1000 ms; later help claims 2000 ms. Effective cadence is unobserved.",
        "runtime_requirements": ["timestamp timer callbacks and actual actions", "capture re-entry and pause guards", "repeat with party sizes and focus/minimize/modal states", "separate stored interval from effective action cadence"],
    }
    (OUT / "timing-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"timer_controls": len(controls), "source_events": len(source_events), "timer_pause_references": result["timer_pause_reference_count"], "runtime_cases": len(selected_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
