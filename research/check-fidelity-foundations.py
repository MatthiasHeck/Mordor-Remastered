"""Validate evidence exports and independently check SZDD with Windows expand.exe.

Does not run original game code. Writes only its validation report and temporary
decompression outputs under research/fidelity-foundations.
"""
from pathlib import Path
import csv
import hashlib
import json
import re
import shutil
import struct
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "fidelity-foundations"
load = lambda name: json.loads((OUT / name).read_text(encoding="utf-8"))
rows = lambda name: list(csv.DictReader((OUT / name).open(encoding="utf-8", newline="")))
sha = lambda data: hashlib.sha256(data).hexdigest()


def main():
    manifest = load("source-manifest.json")
    source = Path(manifest["source_root"])
    for relative, expected in manifest["files"].items():
        data = (source / relative).read_bytes()
        assert dict(size=len(data), sha256=sha(data)) == expected, relative
    audio = load("audio-manifest.json")
    for record in audio:
        data = (OUT / "audio" / record["name"]).read_bytes()
        assert data == (source / record["source"]).read_bytes()
        assert sha(data) == record["sha256"]
    assert len(audio) == 87
    assert len(load("wave-archive-comparison.json")) == 71
    for row in rows("form-timer-candidates.csv"):
        data = (source / "POOP" / row["file"]).read_bytes()
        assert struct.unpack_from("<I", data, int(row["value_offset"]))[0] == int(row["raw_u32"])
        assert bytes.fromhex(row["bytes"]) in data
    refs = rows("random-timer-combat-references.csv")
    for row in refs:
        line = (source / "POOP" / row["file"]).read_text(encoding="cp1252").splitlines()[int(row["line"]) - 1]
        assert line.strip() == row["expression"]
    binary = (source / "_Original Game Files/MORDOR.EXE").read_bytes()
    literals = rows("source-literal-provenance.csv")
    for row in literals:
        assert row["status"] == "literal_match_only"
        raw = row["literal"].encode("cp1252")
        offset = int(row["exe_offset"])
        assert binary[offset:offset + len(raw)] == raw
    deps = load("runtime-dependencies.json")["dependencies"]
    assert len(deps) == 9 and all(d["available"] for d in deps)
    for dep in deps:
        assert sha((OUT / "runtime-libraries" / dep["name"]).read_bytes()) == dep["staged_sha256"]
    expander = shutil.which("expand.exe")
    assert expander, "Independent decompression verification requires Windows expand.exe"
    independent = []
    with tempfile.TemporaryDirectory(prefix="expand-check-", dir=OUT) as temporary:
        assert Path(temporary).resolve().is_relative_to(OUT.resolve())
        for dep in deps:
            packed = dep["compressed_member"]
            if not packed:
                continue
            output = Path(temporary) / dep["name"]
            process = subprocess.run([expander, str(source / packed["source"]), str(output)],
                                     capture_output=True, check=True)
            assert output.read_bytes() == (OUT / "runtime-libraries" / dep["name"]).read_bytes(), dep["name"]
            independent.append(dep["name"])
    assert set(independent) == {"SETUPKIT.DLL", "VBCTL3D.VBX", "VBRUN300.DLL"}
    cases = load("runtime-cases.json")
    assert len(cases["cases"]) == len({c["id"] for c in cases["cases"]}) == 7
    assert all(c["observed"] is None for c in cases["cases"])
    assert all((OUT / c["trace_spec"]).is_file() for c in cases["cases"] if "trace_spec" in c)
    assert all((OUT / c["combat_trace_spec"]).is_file() for c in cases["cases"] if "combat_trace_spec" in c)
    trace_specs = load("numeric-rng-trace-specs.json")
    assert trace_specs["routine_count"] == 8 and trace_specs["total_rnd_events"] == 59
    assert all(s["status"] == "static_trace_spec_runtime_pending" and s["expected_trace"] is None for s in trace_specs["specs"])
    combat_trace = load("combat-trace-spec.json")
    assert len(combat_trace["fn0DEE_callers"]) == 3
    assert combat_trace["helper"]["random_draw_count"] == 4
    assert len(combat_trace["fixtures"]) == 8
    assert all(f["status"] == "planned_not_executed" and f["expected_result"] is None for f in combat_trace["fixtures"])
    timing_trace = load("timing-trace-spec.json")
    assert len(timing_trace["timer_controls"]) == 4
    assert len(timing_trace["source_events"]) == 12
    assert timing_trace["timer_pause_reference_count"] == 36
    assert len(timing_trace["runtime_cases"]) == 3
    assert timing_trace["status"] == "STATIC_TIMING_TRACE_BUILT_RUNTIME_PENDING"
    spell_trace = load("spell-trace-spec.json")
    assert spell_trace["status"] == "STATIC_SPELL_TRACE_BUILT_RUNTIME_PENDING"
    assert spell_trace["data"]["spell_record_count"] == 100
    assert spell_trace["data"]["guild_level_assignment_count"] == 205
    assert len(spell_trace["source_procedures"]) == 9
    assert spell_trace["source_event_count"] == 20
    assert spell_trace["runtime_case_count"] == 8
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in spell_trace["runtime_cases"])
    progression_trace = load("progression-trace-spec.json")
    assert progression_trace["status"] == "STATIC_PROGRESSION_TRACE_BUILT_RUNTIME_PENDING"
    assert progression_trace["data"]["race_count"] == 9
    assert progression_trace["data"]["race_guild_eligibility_rows"] == 9
    assert progression_trace["data"]["guild_count"] == 12
    assert len(progression_trace["source_procedures"]) == 10
    assert progression_trace["source_event_count"] == 15
    assert progression_trace["runtime_case_count"] == 9
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in progression_trace["runtime_cases"])
    encounter_trace = load("encounter-trace-spec.json")
    assert encounter_trace["status"] == "STATIC_ENCOUNTER_TRACE_BUILT_RUNTIME_PENDING"
    assert encounter_trace["data"]["monster_record_count"] == 401
    assert encounter_trace["data"]["floor_count"] == 15
    assert encounter_trace["data"]["cell_count"] == 13500
    assert encounter_trace["data"]["active_teleporter_slot_count"] == 86
    assert len(encounter_trace["source_procedures"]) == 9
    assert encounter_trace["source_event_count"] == 16
    assert encounter_trace["runtime_case_count"] == 8
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in encounter_trace["runtime_cases"])
    item_trace = load("item-trace-spec.json")
    assert item_trace["status"] == "STATIC_ITEM_TRACE_BUILT_RUNTIME_PENDING"
    assert item_trace["data"]["item_record_count"] == 366
    assert item_trace["data"]["distinct_item_ids"] == 366
    assert len(item_trace["source_procedures"]) == 13
    assert item_trace["source_event_count"] == 17
    assert item_trace["runtime_case_count"] == 9
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in item_trace["runtime_cases"])
    economy_trace = load("economy-time-trace-spec.json")
    assert economy_trace["status"] == "STATIC_ECONOMY_TIME_TRACE_BUILT_RUNTIME_PENDING"
    assert len(economy_trace["source_procedures"]) == 11
    assert economy_trace["source_event_count"] == 19
    assert economy_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in economy_trace["runtime_cases"])
    party_trace = load("party-companion-trace-spec.json")
    assert party_trace["status"] == "STATIC_PARTY_COMPANION_TRACE_BUILT_RUNTIME_PENDING"
    assert party_trace["data"]["companion_slot_count"] == 4
    assert len(party_trace["source_procedures"]) == 12
    assert party_trace["source_event_count"] == 20
    assert party_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in party_trace["runtime_cases"])
    recovery_trace = load("recovery-age-trace-spec.json")
    assert recovery_trace["status"] == "STATIC_RECOVERY_AGE_TRACE_BUILT_RUNTIME_PENDING"
    assert recovery_trace["data"]["threshold_clamp_candidate"] == [10, 98]
    assert len(recovery_trace["source_procedures"]) == 13
    assert recovery_trace["source_event_count"] == 20
    assert recovery_trace["runtime_case_count"] == 11
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in recovery_trace["runtime_cases"])
    dungeon_trace = load("dungeon-trace-spec.json")
    assert dungeon_trace["status"] == "STATIC_DUNGEON_TRACE_BUILT_RUNTIME_PENDING"
    assert dungeon_trace["data"]["cell_count"] == 13500
    assert dungeon_trace["data"]["special_square_count"] == 3965
    assert dungeon_trace["data"]["door_edge_count"] == 2328
    assert dungeon_trace["data"]["active_chute_count"] == 17
    assert dungeon_trace["data"]["active_teleporter_count"] == 86
    assert len(dungeon_trace["data"]["unmatched_teleporter_cells"]) == 2
    assert len(dungeon_trace["source_procedures"]) == 9
    assert dungeon_trace["source_event_count"] == 16
    assert dungeon_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in dungeon_trace["runtime_cases"])
    persistence_trace = load("persistence-trace-spec.json")
    assert persistence_trace["status"] == "STATIC_PERSISTENCE_TRACE_BUILT_RUNTIME_PENDING"
    assert persistence_trace["data"]["character_record_length_candidate"] == 2900
    assert len(persistence_trace["data"]["fixed_record_files"]) == 7
    assert len(persistence_trace["source_procedures"]) == 12
    assert persistence_trace["source_event_count"] == 18
    assert persistence_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in persistence_trace["runtime_cases"])
    presentation_trace = load("presentation-audio-trace-spec.json")
    assert presentation_trace["status"] == "STATIC_PRESENTATION_AUDIO_TRACE_BUILT_RUNTIME_PENDING"
    assert presentation_trace["data"]["audio_file_count"] == 87
    assert presentation_trace["data"]["audio_index_assignment_count"] == 88
    assert presentation_trace["data"]["audio_call_site_count"] == 119
    assert presentation_trace["data"]["missing_indexed_assets"] == ["FIGHT.WAV"]
    assert len(presentation_trace["source_procedures"]) == 10
    assert presentation_trace["source_event_count"] == 14
    assert presentation_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in presentation_trace["runtime_cases"])
    defect_trace = load("defect-trace-spec.json")
    assert defect_trace["status"] == "STATIC_DEFECT_TRACE_BUILT_RUNTIME_PENDING"
    assert defect_trace["data"]["anomaly_count"] == 10
    assert len(defect_trace["source_procedures"]) == 11
    assert defect_trace["source_event_count"] == 15
    assert defect_trace["runtime_case_count"] == 10
    assert all(c["status"] == "planned_not_executed" and c["expected_result"] is None for c in defect_trace["runtime_cases"])
    coverage = rows("action-item-coverage.csv")
    coverage_summary = load("action-item-coverage.json")
    assert len(coverage) == len({r["id"] for r in coverage}) == 16
    assert all(not r["missing_evidence"] and r["behavioral_status"] == "runtime_pending" for r in coverage)
    assert coverage_summary["item_count"] == 16 and coverage_summary["items_with_missing_evidence"] == 0
    action_cases = load("action-item-runtime-cases.json")
    assert action_cases["case_count"] == 16
    assert len(action_cases["cases"]) == len({c["action_item"] for c in action_cases["cases"]}) == 16
    assert all(c["observed"] is None and c["status"] == "planned_not_executed" for c in action_cases["cases"])
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R06")["trace_spec"] == "spell-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R07")["trace_spec"] == "progression-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R08")["trace_spec"] == "encounter-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R09")["trace_spec"] == "item-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R10")["trace_spec"] == "economy-time-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R11")["trace_spec"] == "party-companion-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R12")["trace_spec"] == "recovery-age-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R13")["trace_spec"] == "dungeon-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R14")["trace_spec"] == "persistence-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R15")["trace_spec"] == "presentation-audio-trace-spec.json"
    assert next(c for c in action_cases["cases"] if c["action_item"] == "R16")["trace_spec"] == "defect-trace-spec.json"
    work = rows("work-items.csv")
    assert len(work) == 16 and len({r["id"] for r in work}) == 16
    provenance = rows("critical-procedure-provenance.csv")
    assert len(provenance) == 37 and len({(r["file"], r["procedure"]) for r in provenance}) == 37
    assert sum(r["mapping_status"] == "source_and_data_anchor" for r in provenance) == 27
    assert sum(r["mapping_status"] == "source_only_no_direct_data_anchor" for r in provenance) == 10
    assert all(r["machine_code_address"] == "unresolved" for r in provenance)
    assert (OUT / "critical-procedure-provenance.md").is_file()
    segment_map = rows("reko-segment-relocation-map.csv")
    segment_summary = load("reko-segment-relocation-summary.json")
    assert len(segment_map) == 50 and len({r["reko_segment"] for r in segment_map}) == 50
    assert sum(r["mapping_status"].startswith("mapped_") for r in segment_map) == 50
    assert sum(r["mapping_status"] == "mapped_bytes_and_declared_size" for r in segment_map) == 48
    assert sum(r["mapping_status"] == "mapped_declared_size_only" for r in segment_map) == 2
    assert sum(r["function_listing"] == "yes" for r in segment_map) == 1
    assert segment_summary["selected_procedure_addresses_resolved"] == 0
    assert segment_summary["mapped_segments"] == 50
    numeric_sites = rows("numeric-conversion-sites.csv")
    rng_sites = rows("rng-call-sites.csv")
    randomize_sites = rows("randomize-sites.csv")
    numeric_fixtures = load("vb3-semantics-fixtures.json")
    rng_schedule = load("rng-schedule.json")
    assert len(numeric_sites) == 327
    assert len(rng_sites) == 228
    assert len(randomize_sites) == 1
    assert len(numeric_fixtures["fixtures"]) == 5
    assert all(f["status"] == "planned_not_executed" and f["expected"] is None for f in numeric_fixtures["fixtures"])
    assert rng_schedule["status"] == "static_schedule_built_runtime_trace_pending"
    assert len(rng_schedule["music_rng_sites"]) == 2
    prep = load("lab-preparation.json")
    experiment = Path(prep["experiment"])
    assert experiment.resolve().is_relative_to((ROOT.parent / ".tools/original-lab").resolve())
    initial = json.loads((experiment / "initial-manifest.json").read_text())
    for record in initial["files"]:
        assert sha((experiment / record["path"]).read_bytes()) == record["sha256"]
    assert initial["status"] == "prepared_not_executed"
    assert not (ROOT.parent / "Source").exists(), "Removed prototype was unexpectedly restored"
    for document in [ROOT.parent / "README.md", ROOT / "README.md", OUT / "README.md"]:
        from urllib.parse import unquote
        for target in re.findall(r"\]\(([^)]+)\)", document.read_text(encoding="utf-8")):
            target = target.strip("<>")
            if target.startswith(("https://", "http://", "#")):
                continue
            target = re.sub(r":\d+$", "", unquote(target.split("#")[0]))
            if (document.parent / target).resolve() == (OUT / "validation.json").resolve():
                continue  # This report is written after all checks succeed.
            assert (document.parent / target).exists(), (document, target)
    result = dict(status="PASSED", checks=dict(
        original_inputs_match=len(manifest["files"]), exact_audio_copies=len(audio),
        source_line_references=len(refs), executable_literal_matches=len(literals),
        independently_expanded_libraries=independent, fingerprinted_experiment_files=len(initial["files"]),
        original_tree_preservation=load("source-preservation-check.json")["passed"],
        removed_prototype_absent=True, work_items=16, planned_runtime_cases=7,
        selected_procedures=37, data_anchored_procedures=27, unresolved_code_addresses=37,
        reko_segments=50, byte_verified_reko_segments=48, function_listed_reko_segments=1,
        numeric_conversion_sites=327, rng_call_sites=228, randomize_sites=1, numeric_rng_fixtures=5,
        ordered_trace_spec_routines=8, ordered_trace_spec_rnd_events=59,
        combat_fn0DEE_callers=3, combat_helper_random_draws=4, combat_boundary_fixtures=8,
        timing_controls=4, timing_source_events=12, timing_pause_references=36,
        spell_records=100, spell_guild_level_assignments=205, spell_source_procedures=9,
        spell_source_events=20, spell_trace_fixtures=8,
        progression_races=9, progression_race_eligibility_rows=9, progression_guilds=12,
        progression_source_procedures=10, progression_source_events=15, progression_trace_fixtures=9,
        encounter_monster_records=401, encounter_floors=15, encounter_cells=13500,
        encounter_teleporter_slots=86, encounter_source_procedures=9,
        encounter_source_events=16, encounter_trace_fixtures=8,
        item_records=366, item_source_procedures=13, item_source_events=17,
        item_trace_fixtures=9,
        economy_source_procedures=11, economy_source_events=19,
        economy_time_trace_fixtures=10,
        party_source_procedures=12, party_source_events=20,
        party_companion_trace_fixtures=10,
        recovery_source_procedures=13, recovery_source_events=20,
        recovery_age_trace_fixtures=11,
        dungeon_cells=13500, dungeon_special_squares=3965, dungeon_door_edges=2328,
        dungeon_active_chutes=17, dungeon_active_teleporters=86,
        dungeon_source_procedures=9, dungeon_source_events=16,
        dungeon_trace_fixtures=10,
        persistence_source_procedures=12, persistence_source_events=18,
        persistence_trace_fixtures=10,
        presentation_audio_files=87, presentation_audio_assignments=88,
        presentation_audio_call_sites=119, presentation_source_procedures=10,
        presentation_source_events=14, presentation_audio_trace_fixtures=10,
        defect_anomalies=10, defect_source_procedures=11, defect_source_events=15,
        defect_trace_fixtures=10,
        action_items_covered=16, action_items_missing_evidence=0,
        action_item_runtime_cases=16,
        document_links=True), original_game_runtime_tests_executed=False)
    (OUT / "validation.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
