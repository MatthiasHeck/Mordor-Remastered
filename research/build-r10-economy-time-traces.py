"""Build the static economy and world-time trace specification."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def main():
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    selected = [
        ("FRMCTYS.bas", "Form_Load", "store_open", "initializes store controls and calls the stock-list refresh path"),
        ("FRMCTYS.bas", "Form_Unload", "store_persist", "writes the store file after mutations and saves the active character"),
        ("FRMCTYS.bas", "cmdBuy_Click", "buy_transaction", "checks free inventory and funds, creates an item instance and decrements stock"),
        ("FRMCTYS.bas", "cmdSell_Click", "sell_transaction", "quotes a sale, mutates funds, stock, charges and inventory"),
        ("FRMCTYS.bas", "sub260A", "stock_refresh", "enumerates nonempty store records and rebuilds the visible item list"),
        ("FRMCTYS.bas", "fn271B", "identify_quote", "computes the identification service quote from item price, stock and knowledge"),
        ("FRMCTYS.bas", "fn272C", "buy_quote", "computes candidate buy pricing with stock and item-value terms"),
        ("FRMCTYS.bas", "fn273B", "sell_quote", "computes candidate sell pricing with stock, identity, charges and curse state"),
        ("Module6.bas", "fn114E", "payment_split", "spends carried gold first and then banked gold, failing atomically when combined funds are insufficient"),
        ("Module6.bas", "sub0EAE", "world_time_update", "adds explicit or derived rest days, formats elapsed time and invokes world updates"),
        ("FRMCTYM.bas", "Form_Load", "town_entry_time", "applies age/healing and world-state updates for each party member on town entry"),
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
        ("FRMCTYS.bas", 37, "cmdBuy_Click", "buy_slot_scan", "the first empty inventory slot is selected before payment"),
        ("FRMCTYS.bas", 61, "cmdBuy_Click", "buy_payment_gate", "payment failure exits before item creation"),
        ("FRMCTYS.bas", 66, "cmdBuy_Click", "buy_instance_copy", "definition fields, alignment and charges are copied into the new instance"),
        ("FRMCTYS.bas", 73, "cmdBuy_Click", "buy_stock_debit", "stock is debited for the selected alignment/quality slot"),
        ("FRMCTYS.bas", 84, "cmdBuy_Click", "buy_stock_clear", "empty stock clears the store display identity"),
        ("FRMCTYS.bas", 236, "cmdSell_Click", "sell_funds_credit", "the sale quote is added to carried funds"),
        ("FRMCTYS.bas", 263, "cmdSell_Click", "sell_stock_return", "eligible stock receives a returned unit up to the display cap"),
        ("FRMCTYS.bas", 278, "cmdSell_Click", "sell_instance_clear", "the sold instance is removed when no charge remainder survives"),
        ("FRMCTYS.bas", 508, "sub260A", "stock_refresh_entry", "stock refresh rebuilds the visible list from nonempty records"),
        ("FRMCTYS.bas", 564, "fn271B", "identify_quote_formula", "identification price is derived from base value, stock and knowledge"),
        ("FRMCTYS.bas", 583, "fn272C", "buy_quote_formula", "buy quote applies stock/logarithm and level-value terms"),
        ("FRMCTYS.bas", 695, "fn273B", "sell_quote_formula", "sell quote applies identity, stock, charge and curse branches"),
        ("Module6.bas", 393, "fn114E", "payment_split_entry", "payment compares requested cost with carried plus banked gold"),
        ("Module6.bas", 399, "fn114E", "payment_bank_fallback", "banked gold covers the remainder after carried gold is exhausted"),
        ("Module6.bas", 405, "fn114E", "payment_carried_debit", "carried gold is debited when sufficient"),
        ("Module6.bas", 322, "sub0EAE", "age_days_entry", "rest and explicit-day calls enter the shared age update"),
        ("Module6.bas", 329, "sub0EAE", "derived_rest_days", "incomplete HP produces an integer day count from the 3.25 divisor"),
        ("Module6.bas", 350, "sub0EAE", "world_update_hooks", "party-zero rest invokes world update helpers"),
        ("FRMCTYM.bas", 66, "Form_Load", "town_party_iteration", "town entry loops over current party members and applies time/recovery"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("BUY-FUNDS", "carried-only, bank-only and combined funds around exact quote", "payment result and carried/banked balances"),
        ("BUY-STOCK", "zero, one, capped and depleted stock entries", "quote, display and stock mutation"),
        ("SELL-QUOTE", "identified/unidentified, charged and cursed item states", "sell quote and inventory/funds result"),
        ("SELL-RETURN", "returnable versus nonreturnable item classes at stock cap", "stock restoration and charge remainder"),
        ("STORE-SAVE", "open, buy, sell, combine and close store sequences", "lossless store/character persistence"),
        ("IDENTIFY-QUOTE", "knowledge levels and stock boundaries", "service price and knowledge decrement"),
        ("REST-DAYS", "full HP, partial HP and explicit day values", "integer day count, HP fill and age"),
        ("TOWN-ORDER", "party members with unequal HP, SP and conditions", "iteration order, world hooks and saved locations"),
        ("PAYMENT-ATOMIC", "insufficient combined carried plus banked gold", "no partial debit on failure"),
        ("WORLD-REFRESH", "time advance followed by town/store reopen", "world timestamps and refreshed store state"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_ECONOMY_TIME_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "source_status": "static_decompiler_paths_and_preserved_store_records",
            "store_price_functions": ["fn271B", "fn272C", "fn273B", "fn274F"],
            "payment_function": "fn114E",
            "world_time_function": "sub0EAE",
            "interpretation": "Quote formulas, balance ordering, stock caps and elapsed-world updates are candidate semantics until observed in the original runtime; no replacement behavior is certified.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with copied store, character and world records",
            "capture carried/banked payment order, quote rounding, stock mutation and save timing",
            "capture rest/town iteration order, world hooks, age changes and store refresh after elapsed time",
        ],
    }
    (OUT / "economy-time-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
