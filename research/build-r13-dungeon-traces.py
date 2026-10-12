"""Build the static dungeon map, transition and hazard trace specification."""
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
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    cells = rows(DUNGEON / "all-cells.csv")
    special = rows(DUNGEON / "special-squares.csv")
    doors = rows(DUNGEON / "doors.csv")
    chutes = rows(DUNGEON / "chutes.csv")
    teleporters = rows(DUNGEON / "teleporters.csv")
    active_teleporters = [r for r in teleporters if r.get("active_slot") in {"1", "true", "True", "yes"}]
    transitions = json.loads((DUNGEON / "transition-checks.json").read_text(encoding="utf-8"))
    selected = [
        ("Module3.bas", "sub0835", "square_handler", "applies facing, extinguish, pit, stairs, teleporter, water, quicksand, rotator, anti-magic, fog and chute branches"),
        ("Module3.bas", "sub087C", "square_perception", "processes square-level perception and hazard visibility"),
        ("Module3.bas", "sub08F5", "chute_traversal", "moves a character through a matched chute and applies levitation/damage branches"),
        ("Module3.bas", "sub0A1D", "ahead_perception", "checks the square ahead for walls, doors, secret edges and hazards"),
        ("Module3.bas", "sub0A49", "combat_timer_setup", "sets the dungeon combat timer and its shared guard state"),
        ("Module4.bas", "sub0F01", "trap_and_chest", "resolves trap/chest outcomes and their item/gold effects"),
        ("Module4.bas", "sub0D1D", "area_transition", "updates area/encounter state around dungeon transitions"),
        ("Module6.bas", "fn14CB", "take_movement_dispatch", "dispatches Take/movement actions including stairs and chutes"),
        ("Module6.bas", "fn164C", "teleport_validation", "validates teleport destinations and rejects solid-rock results"),
    ]
    source_procedures = []
    for file_name, name, role, summary in selected:
        p = procedures[(file_name, name)]
        source_procedures.append({
            "file": file_name, "procedure": name, "role": role,
            "start_line": p["start_line"], "end_line": p["end_line"],
            "signature": p["signature"], "summary": summary,
            "evidence": f"original-export/code/source/{file_name}:{p['start_line']}",
        })
    event_specs = [
        ("Module3.bas", 1506, "sub0835", "square_entry", "special-square processing begins at the current coordinate"),
        ("Module3.bas", 1528, "sub0835", "facing_flags", "stored facing bits are applied in the displayed order"),
        ("Module3.bas", 1568, "sub0835", "stairs_branch", "stairs up is tested before stairs down and first-floor up returns to town"),
        ("Module3.bas", 1615, "sub0835", "teleporter_branch", "teleporter coordinates are matched against the allocated slot table"),
        ("Module3.bas", 1704, "sub0835", "water_quicksand", "timed water and quicksand branches apply HP/item effects"),
        ("Module3.bas", 1786, "sub0835", "anti_magic_fog", "anti-magic and fog terrain bits enter distinct effect/visibility paths"),
        ("Module3.bas", 93, "sub08F5", "chute_entry", "chute traversal searches the active depth entries"),
        ("Module3.bas", 130, "sub08F5", "chute_damage", "levitation state gates the fall damage branch"),
        ("Module3.bas", 445, "sub0A1D", "ahead_edge_check", "right/upper wall and door edges are checked before movement"),
        ("Module3.bas", 605, "sub087C", "square_perception_entry", "perception on the current square processes visibility/hazard bits"),
        ("Module3.bas", 732, "sub0A49", "combat_timer_interval", "dungeon combat timer setup uses the static interval candidate"),
        ("Module4.bas", 3430, "sub0F01", "trap_chest_entry", "trap/chest resolution enters before reward mutation"),
        ("Module4.bas", 3879, "sub0D1D", "area_transition_entry", "area state is updated around transition processing"),
        ("Module6.bas", 3301, "fn14CB", "take_dispatch_entry", "Take dispatches stairs, chutes and contextual actions"),
        ("Module6.bas", 5750, "fn164C", "teleport_validation_entry", "teleport target validation begins from coordinate strings"),
        ("Module6.bas", 5805, "fn164C", "teleport_random_target", "zero destination coordinates select random non-rock targets"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("TELEPORT-MATCH", "matched active teleporter at each source/destination type", "destination floor, coordinates, facing and chained triggers"),
        ("TELEPORT-UNMATCHED", "floor 8 cells (5,6) and (6,6) with teleporter flags but no table slot", "message, no-op, random destination or other transition"),
        ("TELEPORT-ROCK", "random and fixed teleporter results landing on rock", "rejection loop, death/failure state and RNG order"),
        ("STAIRS", "up/down stairs on floors 1, 2 and 15", "Take ordering, town return and boundary behavior"),
        ("CHUTE", "active chute with levitation on/off and destination floor bounds", "floor movement, damage, party follow and persistence"),
        ("DOORS", "ordinary and secret edges with eligible/ineligible opening state", "auto-open, discovery, facing and one-step input behavior"),
        ("COMBINED-HAZARD", "cells containing multiple special flags", "processing order and cumulative effects"),
        ("PIT-WATER", "pit and water with race/levitation/perception variants", "damage, status and timer cadence"),
        ("QUICKSAND", "quicksand with burden, retention and item candidates", "selected item loss, HP loss and repeated ticks"),
        ("ANTI-MAGIC-FOG", "anti-magic/fog cells with spell and perception states", "eligibility, messages, identification and visibility"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_DUNGEON_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "cell_count": len(cells),
            "special_square_count": len(special),
            "door_edge_count": len(doors),
            "active_chute_count": sum(1 for r in chutes if r.get("active_slot") in {"1", "true", "True", "yes"}),
            "active_teleporter_count": len(active_teleporters),
            "teleporter_transition_check": transitions["teleporters"],
            "chute_transition_check": transitions["chutes"],
            "unmatched_teleporter_cells": transitions["teleporters"]["flagged_cells_without_slot"],
            "source_status": "local fifteen-floor dungeon export and static decompiler paths",
            "interpretation": "Coordinate, flag and slot relationships are preserved; traversal order, screen orientation, effect timing and unmatched transition behavior remain unobserved.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with copied fifteen-floor dungeon data",
            "capture transition destinations, facing, party separation, hazard order and persistence",
            "capture unmatched floor-8 teleporter behavior and distinguish original behavior from any compatibility-layer artifact",
        ],
    }
    (OUT / "dungeon-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"cells": len(cells), "special_squares": len(special), "doors": len(doors), "active_chutes": result["data"]["active_chute_count"], "active_teleporters": len(active_teleporters), "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
