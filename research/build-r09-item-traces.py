"""Build source/data linked item, equipment and store trace specifications."""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def rows(path):
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def main():
    items = rows(ROOT / "item-candidate-shareware.csv")
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    data = {
        "item_record_count": len(items),
        "distinct_item_ids": len({r["item_id"] for r in items}),
        "slot_zero_record_count": sum(r["record_index"] == "1" and r["item_id"] == "0" for r in items),
        "spell_linked_item_count": sum(int(r["spell_index"]) != 0 or int(r["spell_id"]) != 0 for r in items),
        "charged_item_count": sum(int(r["charges_candidate"]) > 0 for r in items),
        "cursed_definition_count": sum(r["cursed_raw"] not in {"", "0"} for r in items),
        "source_status": "shareware_candidate_data_and_static_decompiler_paths",
        "interpretation": "Item records preserve candidate fields. Charges, deleted values, slot numbering and field semantics require original-build/runtime correlation; zero is not treated as universally absent.",
    }
    selected = [
        ("Module6.bas", "fn110D", "item_eligibility", "checks hands, guild masks, guild levels and stat requirements"),
        ("Module6.bas", "fn1139", "equipment_recheck", "rechecks equipped items and unequips invalid items"),
        ("Module6.bas", "sub0F74", "equip_unequip", "applies or removes item bonuses, curse guards and alignment effects"),
        ("Module6.bas", "fn129A", "identification_level", "computes item identification from perception and guild skill"),
        ("Module6.bas", "fn12EF", "item_display", "formats item identity, charges, curse and identification state"),
        ("Module6.bas", "sub0730", "item_knowledge_update", "writes item knowledge and source metadata"),
        ("Module6.bas", "sub0EDA", "remove_item", "unequips when needed and clears an item instance"),
        ("Module6.bas", "sub1577", "item_use_dispatch", "checks and dispatches item use, including spell items and charges"),
        ("FRMCTYS.bas", "cmdBuy_Click", "store_buy", "creates a purchased instance and assigns base charges"),
        ("FRMCTYS.bas", "cmdSell_Click", "store_sell", "quotes, debits and mutates stock/charge state"),
        ("FRMCTYS.bas", "cmdUncurse_Click", "uncurse", "charges a service, identifies and separates/clears eligible curses"),
        ("FRMCTYS.bas", "fn273B", "sell_quote", "computes candidate sell quote from price, stock, identity and charges"),
        ("FRMCTYS.bas", "fn274F", "uncurse_fee", "computes candidate uncurse fee from base price"),
    ]
    source_procedures = []
    for file_name, name, role, summary in selected:
        p = procedures[(file_name, name)]
        source_procedures.append({"file": file_name, "procedure": name, "role": role, "start_line": p["start_line"], "end_line": p["end_line"], "signature": p["signature"], "summary": summary, "evidence": f"original-export/code/source/{file_name}:{p['start_line']}"})
    event_specs = [
        ("Module6.bas", 1512, "fn110D", "eligibility_entry", "item eligibility checks begin"),
        ("Module6.bas", 1530, "fn110D", "guild_and_level_gate", "guild mask and level paths are checked"),
        ("Module6.bas", 1578, "fn110D", "stat_gate", "all natural stat requirements are checked"),
        ("Module6.bas", 1721, "sub0F74", "equip_toggle_entry", "negative slot indicates forced unequip path"),
        ("Module6.bas", 1748, "sub0F74", "curse_unequip_guard", "cursed equipped item blocks normal unequip"),
        ("Module6.bas", 1830, "sub0F74", "equip_stat_failure", "modified-stat and natural-stat attach failures differ"),
        ("Module6.bas", 2494, "fn129A", "identification_entry", "identification level calculation begins"),
        ("Module6.bas", 2580, "fn12EF", "display_identity", "display preserves unidentified and cursed states"),
        ("Module6.bas", 4285, "sub0730", "knowledge_write", "item knowledge and discovery metadata are written"),
        ("Module6.bas", 4342, "sub0EDA", "remove_instance", "item definition, charges and instance flags are cleared"),
        ("Module6.bas", 6151, "sub1577", "item_use_entry", "item use checks charges/equipped state and dispatches effects"),
        ("FRMCTYS.bas", 37, "cmdBuy_Click", "buy_entry", "store purchase creates an inventory instance"),
        ("FRMCTYS.bas", 124, "cmdID_Click", "identify_service", "identification service charges gold and writes knowledge"),
        ("FRMCTYS.bas", 217, "cmdSell_Click", "sell_entry", "sale path selects quote and mutates inventory/stock"),
        ("FRMCTYS.bas", 284, "cmdUncurse_Click", "uncurse_entry", "uncurse path charges, separates and clears eligible curse"),
        ("FRMCTYS.bas", 695, "fn273B", "sell_quote_formula", "price, stock, identification and charges feed quote"),
        ("FRMCTYS.bas", 763, "fn274F", "uncurse_fee_formula", "base price feeds service fee"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("SLOT-ZERO", "record/index zero through every acquisition path", "reserved/usable index behavior and save round-trip"),
        ("ELIGIBILITY", "guild mask, level, hand and natural-stat boundaries", "equip/unequip result and messages"),
        ("ALIGNMENT", "same item under matching, opposed and unrestricted alignment", "eligibility, bonuses and transaction behavior"),
        ("CURSE", "inherent versus instance curse while equipped/unequipped", "unequip block, uncurse effect and persistence"),
        ("CHARGES", "zero, one, base and over-base charge values", "use, depletion, recharge, sale and combining"),
        ("IDENTIFICATION", "knowledge levels zero through complete", "display, service price and stat exposure"),
        ("ITEM-SPELL", "same spell from item and spellbook", "fixed/scaled cast level, charge debit and context"),
        ("STORE-QUOTE", "stock, price, identity and charge boundaries", "buy/sell quote conversion and stock update"),
        ("COMBINE", "matching and mismatched definitions/alignment", "accepted donor subset and slot mutation"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {"status": "STATIC_ITEM_TRACE_BUILT_RUNTIME_PENDING", "data": data, "source_procedures": source_procedures, "source_events": source_events, "source_event_count": len(source_events), "runtime_cases": runtime_cases, "runtime_case_count": len(runtime_cases), "runtime_requirements": ["run the exact original executable with copied item data and controlled character/store states", "capture slot indexing, eligibility, alignment, curses, identification, charge/combining transitions and item-spell dispatch", "retain raw item fields and distinguish candidate data from observed runtime semantics"]}
    (OUT / "item-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"item_records": data["item_record_count"], "distinct_ids": data["distinct_item_ids"], "spell_linked_items": data["spell_linked_item_count"], "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
