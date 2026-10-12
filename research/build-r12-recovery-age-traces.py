"""Build the static recovery, rescue and age trace specification."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def main():
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    selected = [
        ("FRMMORG.bas", "cmdCommand_Click", "morgue_commands", "dispatches raise companion, raise character and paid rescue paths"),
        ("FRMMORG.bas", "sub2BDB", "companion_raise_quote", "computes companion raise fee and exposes the first dead companion"),
        ("FRMDUNM.bas", "cmdWait_Click", "wait_for_rescue", "runs the depth-dependent rescue loop and invokes recovery after success"),
        ("Module6.bas", "sub0EAE", "age_and_rest", "adds explicit or derived days, fills HP and invokes world updates"),
        ("Module6.bas", "fn13C0", "raise_quote", "rejects pending raises and computes the character raise quote"),
        ("Module6.bas", "fn13D7", "raise_threshold", "derives and clamps recovery chance from CON and method"),
        ("Module6.bas", "sub0A7C", "pending_raise_write", "writes location, threshold, initiator and method into pending state"),
        ("Module6.bas", "fn10A3", "pending_raise_acceptance", "accepts a pending raise, rolls failure and restores method-specific HP"),
        ("Module6.bas", "fn11A1", "recovery_complication", "applies age/Rock complications, stat losses, HP reduction and age"),
        ("Module6.bas", "fn131D", "highest_guild_gate", "selects the highest guild level used by recovery subsidy logic"),
        ("Module6.bas", "sub0930", "self_service_recovery", "performs Morgue/self-service recovery and its state transitions"),
        ("Module6.bas", "sub0894", "recovery_dispatch", "dispatches saved-character recovery and party/death processing"),
        ("Module6.bas", "sub1476", "post_recovery_world", "updates dungeon/world state after recovery processing"),
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
        ("FRMMORG.bas", 25, "cmdCommand_Click", "morgue_dispatch", "raise, companion raise and rescue are separate command cases"),
        ("FRMMORG.bas", 52, "cmdCommand_Click", "rock_guard", "Rock characters are rejected by the Morgue character-raise path"),
        ("FRMMORG.bas", 61, "cmdCommand_Click", "pending_raise_guard", "already-pending raises are rejected before payment"),
        ("FRMMORG.bas", 74, "cmdCommand_Click", "pending_raise_write", "payment precedes writing the pending recovery record"),
        ("FRMMORG.bas", 86, "cmdCommand_Click", "companion_raise_roll", "companion raise uses a capped threshold and Int(Rnd * 100) comparison"),
        ("FRMMORG.bas", 145, "cmdCommand_Click", "rescue_roll", "paid rescue proceeds only after the floor-dependent random gate"),
        ("FRMMORG.bas", 158, "cmdCommand_Click", "rescue_coordinate_gate", "floor and per-axis coordinate tolerances gate retrieval"),
        ("FRMMORG.bas", 173, "cmdCommand_Click", "rescue_state_branch", "living, Rock and other fatal states produce different transitions"),
        ("FRMMORG.bas", 254, "sub2BDB", "companion_raise_fee", "fee uses maximum HP, 1244.34 and monster first-level field"),
        ("FRMDUNM.bas", 140, "cmdWait_Click", "wait_entry", "wait initializes the simulated rescue-day loop"),
        ("FRMDUNM.bas", 153, "cmdWait_Click", "wait_denominator", "depth and area state select the random denominator"),
        ("FRMDUNM.bas", 171, "cmdWait_Click", "wait_success", "successful rescue moves the casualty to town and adds elapsed days"),
        ("Module6.bas", 322, "sub0EAE", "age_entry", "rest and explicit-day callers share the age update"),
        ("Module6.bas", 329, "sub0EAE", "derived_rest_days", "missing HP is converted to integer rest days by the 3.25 divisor"),
        ("Module6.bas", 350, "sub0EAE", "world_update_hooks", "party-zero rest invokes world update helpers"),
        ("Module6.bas", 2736, "fn13C0", "raise_quote_rounding", "raise quote uses a Long result and pending-state guard"),
        ("Module6.bas", 2752, "fn13D7", "threshold_formula", "CON and method terms are converted and clamped to 10–98"),
        ("Module6.bas", 6044, "sub0A7C", "pending_fields", "location, threshold, initiator and method are written without immediate revival"),
        ("Module6.bas", 5926, "fn10A3", "pending_roll", "failure compares Int(Rnd * 100) against stored threshold"),
        ("Module6.bas", 1655, "fn11A1", "complication_branch", "age/Rock complications can subtract stats, reduce HP and add 5,475 days"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("RAISE-QUOTE", "max HP and pending states around Long/Int conversion boundaries", "fee, pending rejection and rounding"),
        ("RAISE-THRESHOLD", "natural CON and methods −1, 20, 21, 22, 23 and Rock", "threshold, method gate and clamp"),
        ("PENDING-ROUNDTRIP", "paid raise followed by save, reload and acceptance", "pending fields and no immediate revival"),
        ("RAISE-OUTCOME", "0–99 draws around stored threshold", "failure, success, HP restoration and state clearing"),
        ("ROCK-RECOVERY", "Rock versus non-Rock in Morgue and pending paths", "special rejection and complication behavior"),
        ("COMPLICATION-AGE", "age percentage around trigger and exact boundaries", "stat losses, max HP reduction, age and equipment recheck"),
        ("HIGHEST-GUILD", "highest guild level 5/6 with carried+banked funds below fee", "subsidy eligibility"),
        ("PAID-RESCUE", "floor, coordinates, HP ratio and fatal state matrix", "payment, search roll, retrieval and message/state discrepancy"),
        ("WAIT-RESCUE", "floors 1, 8 and 15 with automap bit and area boundaries", "denominator, elapsed days, RNG and destination"),
        ("TOWN-RECOVERY", "party with living injured, full HP and dead companions", "healing, age, SP, ailments and carrying reference"),
        ("RECOVERY-ORDER", "complication plus ordinary recovery in one call chain", "call order and cumulative age/state changes"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_RECOVERY_AGE_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "source_status": "static_decompiler_paths_and_preserved_character_records",
            "threshold_clamp_candidate": [10, 98],
            "ordinary_recovery_days_candidate": 54,
            "stoning_recovery_days_candidate": 84,
            "complication_age_days_candidate": 5475,
            "interpretation": "Recovery fees, chance comparisons, pending fields, HP restoration, complications and elapsed age remain candidate semantics until original-runtime observation.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with copied living, dead, Rock and pending characters",
            "capture fee conversion, threshold comparisons, RNG draws, pending save fields and HP/state transitions",
            "capture paid rescue, wait rescue, town recovery and complication call order with timestamps and records",
        ],
    }
    (OUT / "recovery-age-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
