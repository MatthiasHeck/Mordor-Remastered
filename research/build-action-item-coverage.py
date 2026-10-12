"""Build a complete evidence matrix for every fidelity work item.

The matrix distinguishes static coverage from executable behavioral proof. It
does not mark an item complete merely because its source or data is present.
"""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"

ITEMS = [
    ("R01", "Reference build", "static-baseline", ["binary-baseline.json", "source-manifest.json", "runtime-dependencies.json"], "Edition, executable, runtime-library and data fingerprints are preserved.", "Original build behavior and configuration must be observed."),
    ("R02", "Decompiler accuracy", "static-segment-and-source-map", ["critical-procedure-provenance.csv", "critical-procedure-provenance.md", "reko-segment-relocation-map.csv", "reko-segment-relocation-summary.json"], "All 50 Reko segment dumps map to the NE image; 37 critical procedures have conservative source provenance.", "Function-level p-code and relocation-aware procedure addresses are missing."),
    ("R03", "Numerics and randomness", "static-traces-ready", ["numeric-conversion-sites.csv", "rng-call-sites.csv", "rng-schedule.json", "numeric-rng-trace-specs.json", "vb3-semantics-fixtures.json"], "327 conversion sites, 228 Rnd sites, startup Randomize, music coupling and 8 ordered trace routines are recorded.", "VB3 results and seeded runtime traces require execution."),
    ("R04", "Combat math", "static-traces-ready", ["combat-trace-spec.json", "critical-procedure-provenance.csv"], "Three fn0DEE callers, five arguments, four helper draws and eight boundary fixtures are recorded.", "Hit, damage, swing, special and XP outcomes require runtime comparison."),
    ("R05", "Timing", "static-cases-ready", ["form-timer-candidates.csv", "random-timer-combat-references.csv", "runtime-cases.json", "timing-trace-spec.json"], "Timer fields, source guards, twelve callback/setup events and TIM01-TIM03 cases are indexed.", "Effective callback cadence and pause ordering require timestamps from the original."),
    ("R06", "Spells", "static-trace-ready", ["spell-statistics-updated-help.csv", "spell-guild-levels-updated-help.csv", "spell-trace-spec.json", "original-export/code/source/Module3.bas", "original-export/code/source/Module6.bas"], "100 spell records, 205 guild-level assignments, nine source procedures, and twenty source events are indexed for cast arbitration and effect tracing.", "Every spell's executable arbitration, power, cost, target and failure behavior requires runtime checks."),
    ("R07", "Creation and progression", "static-trace-ready", ["race-statistics.csv", "race-guild-eligibility.csv", "guild-statistics.csv", "progression-trace-spec.json", "local-original-review.md", "original-followup-review.md"], "Nine races, twelve guilds, creation validation, initial defaults, XP/cost formulas and age/rest paths are indexed through ten source procedures and fifteen source events.", "Legal character matrices, advancement draws, quests and boundaries require runtime checks."),
    ("R08", "Encounters and loot", "static-trace-ready", ["bestiary-provenance.json", "monster-candidate-shareware.csv", "encounter-trace-spec.json", "original-export/dungeon/areas.csv", "original-export/dungeon/special-squares.csv"], "401 monster records, fifteen floors, 13,500 cells, 86 active teleporter slots and encounter/chest/trap source paths are indexed through nine procedures and sixteen events.", "Encounter generation, hostility, treasure, traps and drop order require runtime checks."),
    ("R09", "Items and equipment", "static-trace-ready", ["item-reference.md", "item-candidate-shareware.csv", "item-trace-spec.json", "original-followup-review.md", "original-export/code/source/FRMCTYS.bas"], "366 candidate item records, thirteen equipment/store procedures, seventeen source events and nine controlled fixtures are indexed.", "Eligibility, alignment, curse, charge, slot-zero and crest lifecycle behavior require runtime checks."),
    ("R10", "Economy and world time", "static-trace-ready", ["economy-time-trace-spec.json", "original-export/code/source/FRMCTYS.bas", "original-export/code/source/Module6.bas", "local-original-review.md", "original-followup-review.md"], "Store quote/payment/stock paths and rest/town world-time updates are indexed through eleven procedures, nineteen source events and ten controlled fixtures.", "Final quotes, stock updates and time propagation require runtime checks."),
    ("R11", "Parties and companions", "static-trace-ready", ["party-companion-trace-spec.json", "original-followup-review.md", "original-export/code/source/Module4.bas", "original-export/code/source/FRMCITYC.bas", "original-export/code/source/FRMCHAR3.bas", "original-export/code/source/FRMGROUP.bas"], "Party and companion purchase, binding, formation, obedience, casting and removal paths are indexed through twelve procedures, twenty source events and ten controlled fixtures.", "Formation, obedience, escape, friendly fire, casting limits and reward sharing require runtime checks."),
    ("R12", "Recovery and age", "static-trace-ready", ["recovery-age-trace-spec.json", "original-followup-review.md", "original-export/code/source/FRMDUNM.bas", "original-export/code/source/Module6.bas", "original-export/code/source/FRMMORG.bas"], "Recovery, paid/wait rescue, pending raises, age and complication branches are indexed through thirteen procedures, twenty source events and eleven controlled fixtures.", "Costs, chances, HP restoration, losses and age accumulation require runtime checks."),
    ("R13", "Dungeon", "static-trace-ready", ["dungeon-trace-spec.json", "original-export/dungeon/all-cells.csv", "original-export/dungeon/teleporters.csv", "original-export/dungeon/transition-checks.json", "original-export/dungeon/behavior-notes.md"], "13,500 cells, 3,965 special squares, 2,328 door edges, 17 active chutes and 86 active teleporters are linked to nine traversal/hazard procedures, sixteen source events and ten controlled fixtures.", "Unmatched teleporters, combined terrain, doors, perception and traversal order require runtime checks."),
    ("R14", "Persistence", "static-trace-ready", ["persistence-trace-spec.json", "lab-preparation.json", "original-export/code/source/Module2.bas", "original-export/code/source/Module6.bas", "source-manifest.json"], "Character, automap, store, world and pending-recovery serializers are indexed through twelve procedures, eighteen source events and ten controlled fixtures.", "Complete save-field coverage, triggers and lossless legacy import require runtime checks."),
    ("R15", "Presentation and audio", "static-trace-ready", ["presentation-audio-trace-spec.json", "audio-manifest.json", "audio-index-assignments.csv", "audio-call-sites.csv", "wave-archive-comparison.json"], "All 87 audio files, 88 index assignments, 119 call sites and the missing FIGHT.WAV entry are linked through ten multimedia procedures, fourteen source events and ten controlled fixtures.", "Device timing, MIDI behavior, missing-cue handling and visual equivalence require runtime checks."),
    ("R16", "Suspected defects", "static-trace-ready", ["defect-trace-spec.json", "runtime-cases.json", "original-followup-review.md", "original-export/code/source/FRMDUNM.bas", "original-export/code/source/FRMCTYS.bas", "original-export/code/source/FRMCITYC.bas", "original-export/code/source/Module3.bas", "original-export/code/source/Module6.bas"], "Ten suspected defects or decompiler-damage candidates are linked to eleven procedures, fifteen source events and ten controlled fixtures.", "Executable behavior must distinguish real legacy defects from decompiler damage."),
]


def main():
    records = []
    for item_id, area, status, evidence, static_scope, blocker in ITEMS:
        def evidence_path(path):
            return (OUT / path) if (OUT / path).exists() else (ROOT / path)
        missing = [path for path in evidence if not evidence_path(path).exists()]
        records.append({
            "id": item_id, "area": area, "static_status": status,
            "evidence": ";".join(evidence), "missing_evidence": ";".join(missing),
            "static_scope": static_scope, "remaining_runtime_blocker": blocker,
            "behavioral_status": "runtime_pending",
        })
    assert not any(row["missing_evidence"] for row in records), [row for row in records if row["missing_evidence"]]
    OUT.mkdir(parents=True, exist_ok=True)
    with (OUT / "action-item-coverage.csv").open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(records[0]))
        writer.writeheader()
        writer.writerows(records)
    result = {
        "status": "ALL_ACTION_ITEMS_STATICALLY_COVERED_RUNTIME_PENDING",
        "item_count": len(records),
        "items_with_missing_evidence": sum(bool(row["missing_evidence"]) for row in records),
        "items_runtime_pending": sum(row["behavioral_status"] == "runtime_pending" for row in records),
        "records": records,
    }
    (OUT / "action-item-coverage.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: result[k] for k in ("status", "item_count", "items_with_missing_evidence", "items_runtime_pending")}, indent=2))


if __name__ == "__main__":
    main()
