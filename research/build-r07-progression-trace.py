"""Build source/data linked creation and progression trace specifications."""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def rows(name):
    with (ROOT / name).open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def main():
    races = rows("race-statistics.csv")
    eligibility = rows("race-guild-eligibility.csv")
    guilds = rows("guild-statistics.csv")
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    data = {
        "race_count": len(races),
        "race_guild_eligibility_rows": len(eligibility),
        "guild_count": len(guilds),
        "race_names": [r["race"] for r in races],
        "guild_names": [r["guild"] for r in guilds],
        "source_status": "playguide_transcription_static_not_executable_verified",
        "interpretation": "Printed race/guild restrictions and growth parameters are preserved inputs; legal paths, hidden defaults and exact runtime conversions remain unverified.",
    }
    selected = [
        ("CHARCREA.bas", "cmbRace_Click", "race_selection", "loads race minima, maxima, points and resistance display"),
        ("CHARCREA.bas", "sub1EBA", "creation_matrix", "updates stat controls and guild eligibility after race/stat changes"),
        ("CHARCREA.bas", "cmdSave_Click", "creation_validation", "validates name, race, sex, alignment, duplicate names and remaining points"),
        ("CHARCREA.bas", "sub1F1F", "initial_state", "writes initial character fields, HP/SP, location, guild, flags and quest defaults"),
        ("Module6.bas", "fn124B", "xp_threshold", "computes experience needed for the next guild level"),
        ("Module6.bas", "fn125C", "training_cost", "computes gold required for the next guild level"),
        ("Module6.bas", "fn1397", "next_level_projection", "temporarily advances the active guild level to derive the next XP threshold"),
        ("Module6.bas", "fn14A0", "advance_gate", "requires both XP and available gold before advancement"),
        ("Module6.bas", "fn131D", "highest_guild_level", "returns the highest current guild level"),
        ("Module6.bas", "sub0EAE", "age_and_rest", "adds age/rest time and applies healing/resource effects"),
    ]
    source_procedures = []
    for file_name, name, role, summary in selected:
        p = procedures[(file_name, name)]
        source_procedures.append({"file": file_name, "procedure": name, "role": role, "start_line": p["start_line"], "end_line": p["end_line"], "signature": p["signature"], "summary": summary, "evidence": f"original-export/code/source/{file_name}:{p['start_line']}"})

    event_specs = [
        ("CHARCREA.bas", 54, "cmbRace_Click", "race_record_selected", "gv14C2(gv1A84).M5821 = cmbRace.ListIndex"),
        ("CHARCREA.bas", 69, "cmbRace_Click", "stat_bounds_loaded", "cmdSubtract(Index).Tag / cmdAdd(Index).Tag from race minima/maxima"),
        ("CHARCREA.bas", 74, "cmbRace_Click", "creation_points_loaded", "lblPoints.Caption = race creation pool"),
        ("CHARCREA.bas", 132, "cmdSave_Click", "required_fields_checked", "name/race/sex/alignment validation before save"),
        ("CHARCREA.bas", 149, "cmdSave_Click", "remaining_points_confirmation", "save confirmation when points remain"),
        ("CHARCREA.bas", 204, "sub1F1F", "initialization_entry", "new character defaults are written"),
        ("CHARCREA.bas", 226, "sub1F1F", "initial_hp_defaults", "M4EB4 = 15 and M4EAC = M4EB4"),
        ("CHARCREA.bas", 241, "sub1F1F", "initial_location", "M583F = 9, M5845 = 11, M5470 = 0"),
        ("CHARCREA.bas", 250, "sub1F1F", "initial_derived_stat", "M5830 = fn1338(m00C2)"),
        ("Module6.bas", 2132, "fn124B", "experience_formula", "currency intermediates and race/guild parameters determine threshold"),
        ("Module6.bas", 2154, "fn125C", "training_cost_formula", "level loop and guild multiplier determine cost"),
        ("Module6.bas", 2639, "fn131D", "highest_level_scan", "scans all guild levels"),
        ("Module6.bas", 2724, "fn1397", "projected_threshold", "temporarily increments active guild level"),
        ("Module6.bas", 3205, "fn14A0", "advance_gate", "checks XP then gold"),
        ("Module6.bas", 322, "sub0EAE", "rest_age_update", "adds days/weeks and restores or ages according to flags"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})

    fixtures = [
        ("CREATION-MATRIX", "all nine races across every listed guild and alignment", "legal guild, stat minimum and creation-point matrix"),
        ("CREATION-BOUNDARY", "each stat at race min, max and one beyond", "allocation clamping and save validation"),
        ("CREATION-DEFAULTS", "fresh character with zero remaining points", "initial fields, HP/SP, location, flags and quest state"),
        ("XP-THRESHOLD", "active guild at levels 1, 2, max and pin threshold", "fn124B currency/rounding output"),
        ("TRAINING-COST", "exact gold, one below and one above cost", "fn125C and carried/bank payment"),
        ("ADVANCE-GATE", "XP exact, XP below, gold exact and gold below", "fn14A0 decision and state mutation"),
        ("HP-GROWTH", "advancement across CON/stat and 999-cap boundaries", "Rnd order, maximum HP and current HP"),
        ("AGE-REST", "rest and elapsed time with full and damaged HP", "age accumulation, healing and resource changes"),
        ("QUEST-ASSIGN", "guild level 4/5/15/16 and QP boundary values", "quest gate and random draw ordering"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_PROGRESSION_TRACE_BUILT_RUNTIME_PENDING",
        "data": data,
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": ["run the exact original executable with controlled character files and seeded observations", "capture creation validation, field defaults, XP/cost values, HP growth, quest state and age/rest mutations", "separate source formulas from VB Currency/Integer/Single conversion behavior and Rnd draw order"],
    }
    (OUT / "progression-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"races": data["race_count"], "race_eligibility_rows": data["race_guild_eligibility_rows"], "guilds": data["guild_count"], "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
