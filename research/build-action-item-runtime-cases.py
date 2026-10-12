"""Create one controlled runtime case for each R01-R16 action item."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"

CASES = [
    ("REF01", "R01", "Reference build launch and identity", "Prepared original lab copy", ["startup state", "executable/data/runtime hashes", "configuration", "version/help identity"]),
    ("CODE01", "R02", "Critical procedure address and call-stack capture", "Instrumented original executable or function-level debugger", ["segment:offset entry", "byte range", "callers", "argument types", "relocation evidence"]),
    ("NUM01", "R03", "VB3 conversion and RNG trace", "Minimal VB3 probe plus seeded game copy", ["typed intermediates", "conversion results/errors", "Rnd outputs", "music enabled/disabled state"]),
    ("COMBAT01", "R04", "Shared combat helper and caller outcomes", "Controlled hostile encounter with fixed five-argument captures", ["fn0DEE arguments", "four Rnd outputs", "hit/miss", "damage", "swing/special/XP state"]),
    ("TIM01", "R05", "Timer cadence and pause ordering", "Idle and active hostile rooms in prepared lab copy", ["timer intervals", "callback timestamps", "command timestamps", "pause guards", "actor order"]),
    ("SPELL01", "R06", "Spell arbitration and effects", "Character matrix covering guild access, item casts and target types", ["cost", "power", "target", "resistance", "failure and status effects"]),
    ("PROG01", "R07", "Creation, training and progression boundaries", "Fresh characters across race/guild/stat/CON boundary matrix", ["starting fields", "XP and training", "quest gates", "HP/SP changes", "Rnd order"]),
    ("ENCOUNTER01", "R08", "Encounter, lair, trap and loot generation", "Copied worlds at controlled floors and encounter states", ["group composition", "hostility", "chest/trap result", "drops", "gold", "world persistence"]),
    ("ITEM01", "R09", "Equipment, alignment, charges and slot-zero paths", "Owned item matrix with identified/unidentified and cursed states", ["eligibility", "equip result", "charge debit", "curse/uncurse", "slot index", "crest lifecycle"]),
    ("ECON01", "R10", "Shop quotes, stock and world-time updates", "Stores with controlled carried/bank funds and elapsed time", ["quote", "payment", "stock", "refresh", "world timestamps", "party state"]),
    ("PARTY01", "R11", "Party and companion transitions", "Four-slot companion and multi-character party matrix", ["formation", "separation", "obedience", "escape", "friendly fire", "casting", "reward sharing"]),
    ("RECOVERY01", "R12", "Recovery, age and pending-rescue behavior", "Copied dead/aged characters across recovery methods", ["fees", "acceptance chance", "HP restoration", "permanent losses", "pending state", "age accumulation"]),
    ("DUNGEON01", "R13", "Dungeon traversal, terrain and unmatched teleporters", "Floor and coordinate matrix including floor-8 candidates", ["destination", "facing", "terrain effects", "door behavior", "perception", "messages", "party separation"]),
    ("SAVE01", "R14", "Save triggers and lossless field round-trip", "Fresh and mutated worlds with every known record type", ["written fields", "trigger timing", "reload state", "legacy import", "unknown field preservation"]),
    ("AUDIO01", "R15", "Audio index, MIDI and missing-cue behavior", "Prepared install with supplied audio unchanged", ["requested index", "filename", "MIDI timing", "missing FIGHT.WAV path", "logging", "simulation state"]),
    ("DEFECT01", "R16", "Suspected legacy defects versus decompiler damage", "Boundary matrix for disease, age, raise and rescue branches", ["branch condition", "error path", "state mutation", "message", "repeatability", "source/runtime disagreement"]),
]


def main():
    cases = []
    for case_id, item_id, purpose, setup, capture in CASES:
        record = {
            "id": case_id, "action_item": item_id, "purpose": purpose,
            "setup": setup, "steps": ["Record original build, data, runtime, lab and clock metadata.", "Run the smallest controlled input sequence that reaches the target path.", "Repeat with the stated boundary or comparison condition.", "Store observations separately from static predictions."],
            "capture": capture, "observed": None, "status": "planned_not_executed",
            "runtime_requirement": "Compatible original runtime or instrumented executable required; no substitute implementation certifies the result.",
        }
        if item_id == "R06":
            record["trace_spec"] = "spell-trace-spec.json"
        if item_id == "R07":
            record["trace_spec"] = "progression-trace-spec.json"
        if item_id == "R08":
            record["trace_spec"] = "encounter-trace-spec.json"
        if item_id == "R09":
            record["trace_spec"] = "item-trace-spec.json"
        if item_id == "R10":
            record["trace_spec"] = "economy-time-trace-spec.json"
        if item_id == "R11":
            record["trace_spec"] = "party-companion-trace-spec.json"
        if item_id == "R12":
            record["trace_spec"] = "recovery-age-trace-spec.json"
        if item_id == "R13":
            record["trace_spec"] = "dungeon-trace-spec.json"
        if item_id == "R14":
            record["trace_spec"] = "persistence-trace-spec.json"
        if item_id == "R15":
            record["trace_spec"] = "presentation-audio-trace-spec.json"
        if item_id == "R16":
            record["trace_spec"] = "defect-trace-spec.json"
        cases.append(record)
    result = {"version": 1, "status": "ALL_ACTION_ITEMS_HAVE_CONTROLLED_RUNTIME_CASES_PENDING", "case_count": len(cases), "cases": cases}
    (OUT / "action-item-runtime-cases.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"case_count": len(cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
