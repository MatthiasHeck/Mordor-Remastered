"""Build the static party and companion trace specification."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def main():
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    selected = [
        ("FRMCITYC.bas", "cmdBuy_Click", "companion_purchase", "checks four companion slots, pays, copies base fields and assigns initial binding"),
        ("FRMCITYC.bas", "cmdBind_Click", "binding_service", "raises binding by four with a cap at twelve and charges the service"),
        ("FRMCITYC.bas", "cmdSell_Click", "companion_release", "credits funds, returns eligible stock and clears the companion slot"),
        ("FRMCITYC.bas", "fn33B9", "binding_quote", "computes the discontinuous binding fee from current binding and monster fields"),
        ("FRMCITYC.bas", "fn33CC", "companion_buy_quote", "computes the companion purchase quote from stock and base value"),
        ("FRMCHAR3.bas", "cmdCompanion_Click", "companion_kick", "blocks invalid drops/city kicks and delegates bound-companion hostility handling"),
        ("FRMCHAR3.bas", "picCompanion_DblClick", "companion_cast_context", "prepares a companion spell context and clamps learned spell level"),
        ("FRMCHAR3.bas", "picCompanion_DragDrop", "companion_reorder", "swaps living companion slots and rejects dead-slot rearrangement"),
        ("FRMGROUP.bas", "cmdCommand_Click", "party_command", "dispatches group commands through the active party form"),
        ("FRMGROUP.bas", "sub2F40", "party_member_update", "removes dead members, repairs active indices and rebuilds party controls"),
        ("FRMGROUP.bas", "sub2F5A", "party_status_refresh", "renders HP, spells, ailments, commands and member states in party order"),
        ("Module4.bas", "fn0B6C", "companion_obedience", "uses alignment, binding and random checks to join, refuse or turn on the party"),
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
        ("FRMCITYC.bas", 96, "cmdBuy_Click", "companion_slot_scan", "the four companion slots are searched for the first empty record"),
        ("FRMCITYC.bas", 112, "cmdBuy_Click", "companion_payment_gate", "payment failure exits before a companion record is created"),
        ("FRMCITYC.bas", 125, "cmdBuy_Click", "companion_binding_seed", "initial binding is derived from the monster field and capped at ten"),
        ("FRMCITYC.bas", 50, "cmdBind_Click", "binding_cap_gate", "binding at or above twelve is rejected"),
        ("FRMCITYC.bas", 62, "cmdBind_Click", "binding_payment", "the service fee is paid before the binding mutation"),
        ("FRMCITYC.bas", 272, "cmdSell_Click", "companion_sell_credit", "sale proceeds are credited and stock may be restored"),
        ("FRMCITYC.bas", 602, "fn33B9", "binding_quote_formula", "absolute binding and the four-point increment feed the fee"),
        ("FRMCITYC.bas", 616, "fn33CC", "companion_quote_formula", "stock and logarithm terms feed the buy quote"),
        ("FRMCHAR3.bas", 252, "cmdCompanion_Click", "kick_guard", "dead carried companions and city kicks take separate paths"),
        ("FRMCHAR3.bas", 265, "cmdCompanion_Click", "bound_kick_warning", "positive binding warns that the companion may turn hostile"),
        ("FRMCHAR3.bas", 740, "picCompanion_DblClick", "companion_spell_context", "spell-level clamp and combat context are prepared for companion casting"),
        ("FRMCHAR3.bas", 759, "picCompanion_DragDrop", "companion_reorder_guard", "dead source or destination slots reject reordering"),
        ("FRMGROUP.bas", 212, "cmdCommand_Click", "combat_reorder_guard", "party rearrangement is rejected during combat"),
        ("FRMGROUP.bas", 239, "lblName_DragDrop", "party_leader_swap", "leader changes are reported after member records swap"),
        ("FRMGROUP.bas", 306, "sub2F40", "dead_member_removal", "dead records are removed and active indices repaired"),
        ("FRMGROUP.bas", 400, "sub2F5A", "party_status_order", "status and command labels are rendered in party order"),
        ("Module4.bas", 519, "fn0B6C", "obedience_entry", "binding and alignment conditions gate companion combat behavior"),
        ("Module4.bas", 528, "fn0B6C", "obedience_rng", "random obedience checks use separate Rnd draws"),
        ("Module4.bas", 543, "fn0B6C", "refusal_branch", "a companion can refuse to join the current monsters"),
        ("Module4.bas", 579, "fn0B6C", "turn_hostile_branch", "a companion can turn on the party and enter combat"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("PARTY-FORMATION", "one leader plus full/partial party with swaps", "formation order, leader index, controls and saved records"),
        ("COMPANION-BUY", "zero through four occupied companion slots", "capacity gate, initial fields, binding and stock"),
        ("BINDING-BOUNDARY", "binding levels −1, 0, 8, 9, 10, 11 and 12", "fee, cap, sign semantics and service result"),
        ("COMPANION-KICK", "dead carried, living unbound and living bound companions", "city/combat guards, hostility and slot clearing"),
        ("OBEDIENCE", "matching, adjacent and opposed alignment with binding boundaries", "refusal, join, turn-hostile and RNG draws"),
        ("COMPANION-CAST", "companion spell below, at and above learned level", "level clamp, target context, cost and effect"),
        ("PARTY-REWARD", "mixed human/companion party after combat", "reward sharing, death removal and active indices"),
        ("FRIENDLY-FIRE", "manual attack against good/neutral/evil companion", "alignment guard, combat entry and messages"),
        ("PARTY-REORDER", "living/living, living/dead and dead/dead drag swaps", "accepted swap and rejection messages"),
        ("COMPANION-RESCUE", "dead, carried and pending companion states entering town", "recovery, carrying reference and party order"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_PARTY_COMPANION_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "companion_slot_count": 4,
            "binding_cap_candidate": 12,
            "purchase_binding_cap_candidate": 10,
            "source_status": "static_decompiler_paths_and_preserved_companion_records",
            "interpretation": "Party and companion conditions, random obedience, reward sharing and casting limits remain candidate semantics until observed in the original runtime.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with controlled human and companion records",
            "capture formation, leader, death/removal, carrying, binding and hostility transitions",
            "capture companion casting arbitration, friendly-fire guards, reward sharing and RNG order",
        ],
    }
    (OUT / "party-companion-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
