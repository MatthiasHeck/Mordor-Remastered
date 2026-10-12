"""Build the static persistence and legacy-import trace specification."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
EXPORT = ROOT / "original-export" / "code"


def main():
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    selected = [
        ("Module2.bas", "sub046B", "version_migration", "initializes fixed record files and migrates version-stamped character records"),
        ("Module2.bas", "fn04B9", "character_exists", "opens the character file and searches nonempty records by name"),
        ("Module2.bas", "fn04CD", "character_load", "loads a character record, expands active arrays and restores location metadata"),
        ("Module2.bas", "fn04ED", "character_save", "writes the character header/count and updates or appends a fixed record"),
        ("Module2.bas", "sub04DC", "character_unload", "saves then removes a character from the active party array"),
        ("Module2.bas", "sub0536", "automap_create", "creates and initializes the fixed-record automap file"),
        ("Module2.bas", "sub054E", "companion_store_create", "creates the companion stock file and its header/records"),
        ("Module2.bas", "sub05AA", "library_create", "creates the library file with date/randomized record fields"),
        ("Module2.bas", "sub04A3", "maze_create", "creates the maze reference file and zeroed maze records"),
        ("Module2.bas", "sub05C2", "item_store_create", "creates the item store file and initial stock records"),
        ("Module6.bas", "sub0A7C", "pending_state_save", "writes pending recovery fields into a character record"),
        ("Module6.bas", "fn10A3", "recovery_save_trigger", "saves the character after pending recovery acceptance/failure"),
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
        ("Module2.bas", 126, "sub046B", "fixed_file_init", "version/header files are opened and stamped before character data"),
        ("Module2.bas", 148, "sub046B", "version_migration_read", "old character records are read before migration mutations"),
        ("Module2.bas", 211, "sub046B", "version_migration_write", "migrated records are written back in place"),
        ("Module2.bas", 232, "fn04B9", "character_lookup", "character names are searched across nonempty fixed records"),
        ("Module2.bas", 279, "fn04CD", "character_load_entry", "load opens the fixed-record character file"),
        ("Module2.bas", 321, "fn04CD", "character_load_record", "matching record is copied into the active array"),
        ("Module2.bas", 351, "fn04ED", "character_save_entry", "save rejects blank names before opening the character file"),
        ("Module2.bas", 371, "fn04ED", "character_header_write", "save stamps the file and writes the current count"),
        ("Module2.bas", 390, "fn04ED", "character_record_update", "existing or appended record is written at its stored index"),
        ("Module2.bas", 414, "sub04DC", "character_remove", "unload saves then compacts active arrays"),
        ("Module2.bas", 503, "sub0536", "automap_write", "automap header and zero-filled records are written"),
        ("Module2.bas", 530, "sub054E", "companion_store_write", "companion store header, count and records are written"),
        ("Module2.bas", 632, "sub0595", "hall_write", "hall records include date and randomized fields"),
        ("Module2.bas", 735, "sub05AA", "library_write", "library header/count and records are written"),
        ("Module2.bas", 813, "sub04A3", "maze_write", "maze reference and generated records are written"),
        ("Module2.bas", 852, "sub05C2", "item_store_write", "item store header/count and stock records are written"),
        ("Module6.bas", 6044, "sub0A7C", "pending_record_write", "pending recovery fields are written to the character record"),
        ("Module6.bas", 5979, "fn10A3", "recovery_save", "recovery result is saved through the character serializer"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("CHARACTER-ROUNDTRIP", "fresh, mutated, pending and deleted character records", "all known fields, record indices, count and active-array state"),
        ("CHARACTER-APPEND", "save with empty file, hole, and append-at-end cases", "header/count/index allocation and name lookup"),
        ("CHARACTER-REMOVE", "unload middle, first and last active party member", "save-before-compact and active index repair"),
        ("VERSION-MIGRATION", "version stamp mismatch with equipped items, spells, companions and pending state", "migration mutations and lossless/intentional field changes"),
        ("AUTOMAP-ROUNDTRIP", "mutate explored cells and reload", "coordinate records, flags and zero/default fields"),
        ("STORE-ROUNDTRIP", "mutate item and companion stock then reopen", "stock counts, definitions, headers and caps"),
        ("WORLD-ROUNDTRIP", "mutate maze, area and world records then reload", "world positions, encounters, timers and unknown fields"),
        ("PENDING-ROUNDTRIP", "write pending recovery, save, reload and accept", "pending location/threshold/initiator/method preservation"),
        ("LEGACY-IMPORT", "older stamped file with holes and duplicate names", "conversion decision, slot mapping and error paths"),
        ("FAILURE-PATH", "unwritable/corrupt/header-mismatch copies in disposable lab", "error handling, partial writes and runtime messages"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_PERSISTENCE_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "character_record_length_candidate": 2900,
            "fixed_record_files": ["character", "automap", "companion_store", "hall", "library", "maze", "item_store"],
            "configuration_file": "MORDOR.INI",
            "source_status": "static random-file serializers and disposable lab preparation",
            "interpretation": "Record layouts and write paths are preserved candidates; complete field coverage, trigger timing, legacy conversion and unknown-byte behavior require round-trip observation.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable against disposable copied files only",
            "snapshot every file before and after each mutation and compare fixed records byte-for-byte",
            "exercise version mismatch, holes, duplicate names, pending recovery and write-failure paths",
        ],
    }
    (OUT / "persistence-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
