"""Build source/data linked spell-casting trace specifications.

This pass records the spell tables and the original source paths that arbitrate
access, cost, casting context, targeting, power and effect families.  It does
not infer missing values from the later help pages and does not claim runtime
equivalence until the original executable can be observed.
"""
from pathlib import Path
import csv
import json
from collections import Counter

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def rows(path):
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def procedure_index():
    return {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}


def main():
    stats = rows(ROOT / "spell-statistics-updated-help.csv")
    guild_levels = rows(ROOT / "spell-guild-levels-updated-help.csv")
    procedures = procedure_index()

    data = {
        "spell_record_count": len(stats),
        "distinct_spell_names": len({r["spell"] for r in stats}),
        "spell_class_counts": dict(sorted(Counter(r["spell_class"] for r in stats).items())),
        "guild_level_assignment_count": len(guild_levels),
        "distinct_assigned_spell_names": len({r["spell"] for r in guild_levels}),
        "guild_count": len({r["guild"] for r in guild_levels}),
        "missing_power_base_count": sum(r["power_base"] == "" for r in stats),
        "missing_power_level_modifier_count": sum(r["power_level_modifier"] == "" for r in stats),
        "source_status": "official_updated_help_not_executable_verified",
        "interpretation": "The help tables are preserved inputs. Empty power fields are unresolved, not zero; duplicate or renamed spell identities require runtime and binary correlation.",
    }

    selected = [
        ("Module6.bas", "fn1173", "cast_dispatch", "dispatches effect families, target prompts, item-vs-book casts, movement spells and party effects"),
        ("Module6.bas", "fn10E5", "cast_eligibility", "checks guild access, effective spell level, attributes, spell points, combat context and anti-magic"),
        ("Module6.bas", "fn1417", "effective_spell_level", "selects the highest eligible trained guild level for the spell"),
        ("Module6.bas", "fn142F", "spell_point_cost", "computes spell-point cost from spell level, guild training and spell scaling"),
        ("Module6.bas", "fn1448", "spell_context", "classifies combat, non-combat and movement spell context"),
        ("Module6.bas", "fn11D4", "guild_effective_level", "computes the highest guild-derived skill value used by dungeon effects"),
        ("Module6.bas", "fn16B8", "spell_name_resolution", "resolves exact and prefix spell names and reports not-found/ambiguous cases"),
        ("Module6.bas", "fn164C", "movement_spell_targeting", "parses displacement/teleport coordinates and validates destination"),
        ("Module3.bas", "sub0835", "dungeon_spell_effects", "uses effective guild level and Rnd for perception and dungeon spell effects"),
    ]
    source_anchors = []
    for file_name, name, role, summary in selected:
        p = procedures[(file_name, name)]
        source_anchors.append({
            "file": file_name,
            "procedure": name,
            "role": role,
            "start_line": p["start_line"],
            "end_line": p["end_line"],
            "signature": p["signature"],
            "summary": summary,
            "evidence": f"original-export/code/source/{file_name}:{p['start_line']}",
        })

    event_specs = [
        ("Module6.bas", 562, "fn1173", "combat_context_gate", "fn1448(pv00FC) and p0100 determine combat/non-combat spell path"),
        ("Module6.bas", 570, "fn1173", "item_charge_gate", "item-cast path checks gv1E66 and decrements/invalidates charges"),
        ("Module6.bas", 600, "fn1173", "effective_level_use", "fn1417 supplies trained spell level for bind/protection effects"),
        ("Module6.bas", 626, "fn1173", "target_prompt_heal", "SPELLHEAL prompt selects a character or companion target"),
        ("Module6.bas", 796, "fn1173", "raise_chance_setup", "fn13D7 computes a raise threshold before sub0A7C pending recovery"),
        ("Module6.bas", 831, "fn1173", "displacement_target", "fn164C parses displacement coordinates"),
        ("Module6.bas", 849, "fn1173", "teleport_target", "fn164C parses teleport coordinates"),
        ("Module6.bas", 1062, "fn1173", "spell_point_debit", "fn142F is subtracted from the caster's spell points"),
        ("Module6.bas", 1078, "fn1173", "combat_target_resolution", "fn1235 formats the selected combat target"),
        ("Module6.bas", 1298, "fn1173", "item_spell_point_debit", "item-spell path debits spell points after effect handling"),
        ("Module6.bas", 1390, "fn10E5", "guild_access_check", "guild training matrix must permit the spell"),
        ("Module6.bas", 1420, "fn10E5", "attribute_requirement_check", "spell attribute requirements are checked before casting"),
        ("Module6.bas", 1443, "fn10E5", "spell_point_check", "insufficient spell points reject the cast"),
        ("Module6.bas", 1452, "fn10E5", "noncombat_context_check", "non-combat spell rejection is context dependent"),
        ("Module6.bas", 1469, "fn10E5", "combat_context_check", "combat-only and movement spell context are gated"),
        ("Module6.bas", 1932, "fn11D4", "guild_effective_value", "effective guild skill value feeds dungeon effects"),
        ("Module6.bas", 2884, "fn142F", "cost_formula", "cost candidates use trained level, spell level, guild multiplier and 1.9 factor"),
        ("Module6.bas", 2924, "fn1448", "context_classification", "special cases classify healing and movement spell context"),
        ("Module6.bas", 6312, "fn16A0", "cast_input_dialog", "cast UI returns target/coordinate input tagged by effect family"),
        ("Module3.bas", 1543, "sub0835", "perception_rng_effect", "dungeon perception effect uses logarithmic guild level and Rnd"),
    ]
    source_events = []
    source_root = EXPORT / "source"
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({
            "file": file_name,
            "line": line,
            "procedure": procedure,
            "event": event,
            "expression": expression,
            "source_text": lines[line - 1].strip(),
        })

    fixtures = [
        ("SPELL-ACCESS", "known spell with eligible guild", "guild level, spell level and attribute gate", "cast succeeds or exact legacy rejection message", "verify against original"),
        ("SPELL-COST", "same spell across trained guild levels", "fn142F cost and integer rounding", "spell-point debit matches", "verify against original"),
        ("SPELL-POWER", "healing and damage spell at multiple effective levels", "fn1417/fn11D4 power inputs and Rnd draws", "power/effect magnitude matches", "verify against original"),
        ("SPELL-TARGET", "self, companion, party and monster target classes", "fn1173 target prompt and target-range branches", "target selection and affected set match", "verify against original"),
        ("SPELL-RESIST", "resistant target and matching resistance family", "effect-family resistance handling", "resist/no-effect branch matches", "verify against original"),
        ("SPELL-FAILURE", "unknown, ambiguous, too-low and insufficient-SP casts", "fn16B8/fn10E5 failure arbitration", "failure reason and state changes match", "verify against original"),
        ("SPELL-ITEM-VS-BOOK", "same spell from item and spellbook", "item charge path versus normal cast path", "charge, cost and context behavior match", "verify against original"),
        ("SPELL-DUPLICATE-ID", "duplicate or renamed help-table spell identity", "help rows correlated to binary spell records", "selection and guild assignments match", "verify against original"),
    ]
    runtime_cases = [
        {"id": case_id, "fixture": fixture, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed", "required_observation": observation}
        for case_id, fixture, focus, observation, _ in fixtures
    ]

    result = {
        "status": "STATIC_SPELL_TRACE_BUILT_RUNTIME_PENDING",
        "data": data,
        "source_procedures": source_anchors,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable under a compatible controlled environment",
            "record spell selection, target prompts, failure text, spell points, charges, status fields and RNG draws",
            "repeat for item casts, spellbook casts, combat/non-combat context, resistance and duplicate-name cases",
        ],
    }
    (OUT / "spell-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"spell_records": data["spell_record_count"], "guild_level_assignments": data["guild_level_assignment_count"], "source_procedures": len(source_anchors), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
