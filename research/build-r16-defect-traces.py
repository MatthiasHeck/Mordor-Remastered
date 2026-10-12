"""Build the static suspected-defect and decompiler-damage trace specification."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def main():
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    selected = [
        ("FRMDUNM.bas", "timAilment_Timer", "ailment_and_age_anomalies", "contains separate poison/disease formulas, natural-death boundary math and timer guards"),
        ("Module3.bas", "sub0A49", "combat_timer_candidate", "sets the dungeon timer interval that conflicts with later help text"),
        ("Module6.bas", "fn13C0", "raise_rounding_anomaly", "returns a Long quote while a caller applies explicit Int conversion"),
        ("Module6.bas", "fn13D7", "raise_method_anomaly", "uses method-dependent threshold terms with Rock and clamp branches"),
        ("Module6.bas", "sub0A7C", "pending_recovery_anomaly", "stores a pending raise without immediate fatal-state clearing"),
        ("Module6.bas", "fn10A3", "raise_probability_anomaly", "compares Int(Rnd * 100) using a strict greater-than failure test"),
        ("Module6.bas", "fn11A1", "complication_anomaly", "can apply large age/stat/HP losses while returning a recoverable result"),
        ("Module6.bas", "sub0930", "subsidy_anomaly", "uses highest-guild selection and method-specific recovery branches"),
        ("Module6.bas", "sub0EAE", "age_rounding_anomaly", "uses Integer conversion of a 3.25 rest-day expression"),
        ("FRMCTYS.bas", "fn272C", "store_formula_anomaly", "contains an unresolved generated-variable reference in a candidate price formula"),
        ("FRMCITYC.bas", "fn33B9", "binding_price_anomaly", "changes the binding fee factor at the cap boundary"),
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
    anomalies = [
        {"id": "DEF-DISEASE-SEVERITY", "claim": "disease damage formula subtracts the poison severity field", "evidence": "FRMDUNM.bas:535", "classification": "possible legacy defect or decompiler damage", "runtime_discriminator": "set poison and disease severities independently and compare disease recovery/damage"},
        {"id": "DEF-AGE-98-LOG", "claim": "natural-death branch evaluates Log(relative_age_percent - 98) at the >=98 boundary", "evidence": "FRMDUNM.bas:590", "classification": "possible undefined-boundary defect or decompiler damage", "runtime_discriminator": "exercise exact 98, just above 98 and error-handler state"},
        {"id": "DEF-TIMER-HELP", "claim": "dungeon timer source candidate is 1000 ms while later help describes two seconds", "evidence": "Module3.bas:732; FRMDUNM.bas:612", "classification": "source/help discrepancy", "runtime_discriminator": "timestamp timer callbacks and effective attack cadence"},
        {"id": "DEF-RAISE-ROUND", "claim": "raise quote conversion differs between Long-returning function and explicit Int caller", "evidence": "Module6.bas:2736; Module6.bas:3032", "classification": "possible rounding defect or intentional caller policy", "runtime_discriminator": "choose HP values that produce fractional quotes and compare both paths"},
        {"id": "DEF-RAISE-GT", "claim": "raise failure uses strict greater-than against Int(Rnd * 100)", "evidence": "Module6.bas:5926", "classification": "boundary probability discrepancy", "runtime_discriminator": "capture draws 0, threshold, threshold+1 and 99"},
        {"id": "DEF-RECOVERY-CHAIN", "claim": "complication recovery can add 5475 days and reduce stats/HP before ordinary recovery continues", "evidence": "Module6.bas:1655", "classification": "possible legacy penalty or decompiler damage", "runtime_discriminator": "capture call order and cumulative state across failure/complication"},
        {"id": "DEF-SUBSIDY-GUILD", "claim": "novice subsidy depends on highest guild level rather than active guild", "evidence": "Module6.bas:2639; Module6.bas:3032", "classification": "non-obvious rule requiring verification", "runtime_discriminator": "switch active guild while preserving a higher inactive guild"},
        {"id": "DEF-STORE-UNINIT", "claim": "buy quote uses generated variable l0202 before an evident assignment", "evidence": "FRMCTYS.bas:583", "classification": "likely decompiler damage candidate", "runtime_discriminator": "trace native value and compare quote across stock/value states"},
        {"id": "DEF-BIND-CAP", "claim": "binding quote factor switches when abs(binding)+4 exceeds cap", "evidence": "FRMCITYC.bas:602", "classification": "discontinuous legacy formula candidate", "runtime_discriminator": "quote levels around 8/9/12 with identical companion fields"},
        {"id": "DEF-AGE-ROUND", "claim": "rest-day expression is assigned to Integer before age/world updates", "evidence": "Module6.bas:329", "classification": "rounding behavior requiring VB runtime comparison", "runtime_discriminator": "partial HP values around fractional day boundaries"},
    ]
    event_specs = [
        ("FRMDUNM.bas", 391, "timAilment_Timer", "ailment_guard", "reentrancy and minimize guards return before state mutation"),
        ("FRMDUNM.bas", 443, "timAilment_Timer", "identification_rng", "monster identification uses an independent Rnd branch"),
        ("FRMDUNM.bas", 535, "timAilment_Timer", "disease_formula", "disease branch subtracts the displayed poison-severity field"),
        ("FRMDUNM.bas", 590, "timAilment_Timer", "natural_age_boundary", "natural-death branch evaluates the age percentage/log expression"),
        ("Module3.bas", 732, "sub0A49", "timer_interval", "dungeon timer interval candidate is assigned"),
        ("Module6.bas", 2736, "fn13C0", "raise_quote_return", "raise quote is returned through a Variant/Long path"),
        ("Module6.bas", 2752, "fn13D7", "raise_threshold", "CON and method produce a clamped threshold"),
        ("Module6.bas", 3032, "sub0930", "raise_int_conversion", "self-service caller applies explicit Int conversion"),
        ("Module6.bas", 5926, "fn10A3", "raise_strict_gt", "failure branch uses strict greater-than comparison"),
        ("Module6.bas", 1655, "fn11A1", "complication_mutation", "complication branch mutates stats, HP and age"),
        ("Module6.bas", 2639, "fn131D", "highest_guild_selection", "highest guild level is selected for subsidy logic"),
        ("Module6.bas", 329, "sub0EAE", "age_integer_conversion", "derived rest days are assigned to Integer"),
        ("FRMCTYS.bas", 583, "fn272C", "store_uninitialized_reference", "candidate quote expression references generated local state"),
        ("FRMCTYS.bas", 602, "fn33B9", "binding_factor_switch", "cap boundary selects a different fee factor"),
        ("Module6.bas", 6044, "sub0A7C", "pending_without_revival", "pending fields are written without clearing fatal state"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("DISEASE-SEVERITY", "poison and disease severities varied independently", "formula field selection, HP loss, cure threshold and RNG order"),
        ("AGE-98", "relative age exactly 98, 98+epsilon and 99", "log handling, death roll and error state"),
        ("TIMER-HELP", "idle/active dungeon with timer and command actions", "callback interval versus effective attack cadence"),
        ("RAISE-ROUNDING", "fractional raise quotes at Long/Int boundaries", "displayed cost, debited cost and path difference"),
        ("RAISE-BOUNDARY", "draws 0, threshold, threshold+1 and 99", "strict comparison and acceptance result"),
        ("RECOVERY-COMPLICATION", "aged and Rock characters through failed recovery", "stat/HP/age mutation and follow-on recovery"),
        ("SUBSIDY-GUILD", "highest inactive guild above/below level five", "subsidy eligibility and payment"),
        ("STORE-UNINIT", "stock/value matrix for buy quote", "native local value and quote stability"),
        ("BIND-CAP", "binding levels around fee discontinuity", "price factor and cap semantics"),
        ("AGE-ROUNDING", "partial HP values around fractional rest days", "Integer conversion and world update days"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_DEFECT_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "anomaly_count": len(anomalies),
            "source_status": "static candidate anomalies retained without corrective implementation",
            "interpretation": "Each anomaly is an explicit comparison question. No suspected defect is promoted to a rule until original-runtime evidence separates legacy behavior from decompiler damage.",
        },
        "anomalies": anomalies,
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with controlled boundary records and seeded/randomized repetitions",
            "capture raw inputs, native outputs, error-handler state, messages and persistent mutations",
            "classify each result as legacy behavior, decompiler damage or unresolved after repeated comparison",
        ],
    }
    (OUT / "defect-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"anomalies": len(anomalies), "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
