"""Build source/data linked encounter, chest, trap and loot traces."""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"
DUNGEON = ROOT / "original-export" / "dungeon"


def rows(path):
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def main():
    monsters = rows(ROOT / "monster-candidate-shareware.csv")
    provenance = json.loads((ROOT / "bestiary-provenance.json").read_text(encoding="utf-8"))
    floors = rows(DUNGEON / "floors.csv")
    areas = rows(DUNGEON / "areas.csv")
    cells = rows(DUNGEON / "all-cells.csv")
    teleporters = rows(DUNGEON / "teleporters.csv")
    chutes = rows(DUNGEON / "chutes.csv")
    special = rows(DUNGEON / "special-squares.csv")
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    data = {
        "monster_record_count": len(monsters),
        "monster_duplicate_id_count": len(provenance["duplicate_monster_ids"]),
        "floor_count": len(floors),
        "area_count": len(areas),
        "cell_count": len(cells),
        "active_teleporter_slot_count": sum(1 for r in teleporters if r.get("active_slot", "").lower() in {"1", "true", "yes"}),
        "chute_count": sum(1 for r in chutes if r.get("active_slot", "").lower() in {"1", "true", "yes"}),
        "special_square_count": len(special),
        "source_status": "shareware_candidate_data_and_static_decompiler_paths",
        "interpretation": "Monster and map records are preserved candidates. Record identity, duplicate IDs, spawn flags and reward fields are not executable-verified semantics.",
    }
    selected = [
        ("Module4.bas", "sub0A91", "encounter_lifecycle", "reads current monsters, applies generation timing, displays groups and handles encounter refresh"),
        ("Module4.bas", "fn0D4D", "monster_generation", "selects a special/final or normal encounter and builds generated groups"),
        ("Module4.bas", "fn0DCD", "active_group_selection", "finds the current monster group"),
        ("Module4.bas", "fn0E38", "monster_record_read", "loads monster records for the current encounter"),
        ("Module4.bas", "sub0E85", "monster_attack_and_loot_effects", "resolves monster attacks, statuses, item destruction and consequences"),
        ("Module4.bas", "sub0F01", "trap_resolution", "disarms or applies trap effects and updates party state"),
        ("Module4.bas", "sub0C8A", "combat_resolution", "executes combat round outcomes and death/reward transitions"),
        ("Module4.bas", "fn0E4A", "special_hit_power", "computes special-hit magnitude with level and resistance inputs"),
        ("Module4.bas", "sub0D?", "chest_loot", "chest opening and item/gold selection path requires generated source anchor"),
    ]
    source_procedures = []
    for file_name, name, role, summary in selected:
        if name == "sub0D?":
            # The exported procedure covering the chest body is sub0F01; keep the
            # role explicit without inventing a missing symbol.
            p = procedures[("Module4.bas", "sub0F01")]
            procedure_name = "sub0F01"
        else:
            p = procedures[(file_name, name)]
            procedure_name = name
        source_procedures.append({"file": file_name, "procedure": procedure_name, "role": role, "start_line": p["start_line"], "end_line": p["end_line"], "signature": p["signature"], "summary": summary, "evidence": f"original-export/code/source/{file_name}:{p['start_line']}"})
    event_specs = [
        ("Module4.bas", 662, "sub0A91", "encounter_refresh_entry", "sub0A91 reads current-square monsters and controls generation timing"),
        ("Module4.bas", 683, "sub0A91", "monster_read_failure", "Error reading monsters"),
        ("Module4.bas", 707, "sub0A91", "monster_generation_failure", "Error generating monsters"),
        ("Module4.bas", 1356, "fn0D4D", "generation_entry", "encounter selection starts from current square data and depth"),
        ("Module4.bas", 1392, "fn0D4D", "special_encounter_roll", "special/final encounter branch uses Rnd"),
        ("Module4.bas", 1450, "fn0D4D", "monster_candidate_selection", "candidate monster records are filtered by square flags"),
        ("Module4.bas", 2185, "fn0DCD", "current_group_scan", "active group is found among generated records"),
        ("Module4.bas", 2362, "fn0E38", "record_load", "monster record fields are loaded into encounter state"),
        ("Module4.bas", 2588, "sub0E85", "monster_attack_entry", "monster attacks resolve against party members"),
        ("Module4.bas", 3430, "sub0F01", "trap_entry", "trap type is selected and trap state is consumed"),
        ("Module4.bas", 3498, "sub0F01", "trap_roll", "trap disarm and effect roll begins"),
        ("Module4.bas", 3657, "sub0F01", "chest_roll", "treasure/chest success roll begins"),
        ("Module4.bas", 3672, "sub0F01", "chest_item_selection", "item class and item record are selected"),
        ("Module4.bas", 3804, "sub0F01", "item_mutation", "curse/charge and recipient item state are mutated"),
        ("Module4.bas", 801, "sub0C8A", "combat_round_entry", "combat round resolves generated encounter state"),
        ("Module4.bas", 2386, "fn0E4A", "special_hit_entry", "special-hit power uses monster and target resistance"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("ENCOUNTER-GENERATION", "same floor/square with fixed RNG and depth", "candidate group, hostility, final/special branch and generated records"),
        ("ENCOUNTER-LAIR", "lair flag and ordinary square at same depth", "lair selection and persistence"),
        ("ENCOUNTER-GROUP", "one, multiple and full group slots", "group counts, active group and member order"),
        ("CHEST-REWARD", "empty, locked and opened chest states", "chest gate, gold, item class and item recipient"),
        ("TRAP-DISARM", "trap with low/high perception and resistance", "disarm roll, trap consumption and damage/status"),
        ("LOOT-ORDER", "multiple item candidates with full/partial party inventory", "RNG order, slot selection and no-room behavior"),
        ("DUPLICATE-MONSTER-ID", "record index versus duplicate ID 307", "record identity and lookup semantics"),
        ("FINAL-ENCOUNTER", "final/special encounter flags at boundary depths", "special branch, rewards and world persistence"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {"status": "STATIC_ENCOUNTER_TRACE_BUILT_RUNTIME_PENDING", "data": data, "source_procedures": source_procedures, "source_events": source_events, "source_event_count": len(source_events), "runtime_cases": runtime_cases, "runtime_case_count": len(runtime_cases), "runtime_requirements": ["run the exact original executable with copied map/monster data and controlled RNG observations", "capture group generation, hostility, trap/chest consumption, item/gold selection, duplicate-ID lookup and final encounter persistence", "separate candidate table fields from executable behavior and preserve every random draw in order"]}
    (OUT / "encounter-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"monster_records": data["monster_record_count"], "floors": data["floor_count"], "cells": data["cell_count"], "teleporter_slots": data["active_teleporter_slot_count"], "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
