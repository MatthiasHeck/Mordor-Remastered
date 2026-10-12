"""Build the static presentation and audio trace specification."""
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
    procedures = {(p["file"], p["name"]): p for p in json.loads((EXPORT / "procedures.json").read_text(encoding="utf-8"))}
    audio = json.loads((OUT / "audio-manifest.json").read_text(encoding="utf-8"))
    assignments = rows(OUT / "audio-index-assignments.csv")
    call_sites = rows(OUT / "audio-call-sites.csv")
    waves = json.loads((OUT / "wave-archive-comparison.json").read_text(encoding="utf-8"))
    selected = [
        ("Module9.bas", "sub170B", "music_catalogue", "selects the shareware or retail MIDI filename table"),
        ("Module9.bas", "sub063F", "music_open_play", "resolves a MIDI index, checks file presence, opens and plays the device"),
        ("Module9.bas", "sub1A50", "music_timer", "advances music selection when playback completes or changes state"),
        ("Module9.bas", "sub09DE", "wave_play", "opens and plays a WaveMix sound effect when enabled"),
        ("Module9.bas", "sub086D", "wave_play_alt", "plays a sound effect through the alternate helper and RNG-selected index callers"),
        ("FRMMAIN.bas", "mciMusic_Done", "music_completion", "marks the active MIDI track complete for timer-driven selection"),
        ("FRMMAIN.bas", "timMusic_Timer", "music_timer_callback", "dispatches the music callback from the main form timer"),
        ("FRMOPTIO.bas", "chkCheck_Click", "audio_options", "enables/disables MIDI and wave output and refreshes selections"),
        ("FRMOPTIO.bas", "hsbVolume_Scroll", "wave_volume", "updates WaveMix volume and plays a confirmation cue"),
        ("Module13.bas", "fn1E6F", "wavemix_error", "maps WaveMix device errors to legacy messages"),
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
        ("Module1.bas", 304, "audio_index_initialization", "audio_catalogue_entry", "index zero is assigned FIGHT.WAV although the supplied archive lacks it"),
        ("Module9.bas", 396, "sub170B", "midi_catalogue_shareware", "shareware MIDI names are selected when the edition flag is set"),
        ("Module9.bas", 408, "sub170B", "midi_catalogue_retail", "retail MIDI names are selected otherwise"),
        ("Module9.bas", 131, "sub09DE", "wave_guard", "wave playback returns when sound effects are disabled"),
        ("Module9.bas", 142, "sub09DE", "wave_open", "WaveMix opens the indexed wave asset before playback"),
        ("Module9.bas", 195, "sub086D", "wave_alt_guard", "alternate wave helper preserves the same disabled guard"),
        ("Module9.bas", 428, "sub063F", "midi_guard", "MIDI playback returns for disabled/error states and duplicate active index"),
        ("Module9.bas", 450, "sub063F", "midi_open_play", "MCI opens and plays the selected MIDI path"),
        ("Module9.bas", 74, "sub1A50", "music_completion_dispatch", "timer callback selects the next track after completion"),
        ("FRMMAIN.bas", 118, "mciMusic_Done", "mci_completion", "completion notification marks the track done"),
        ("FRMMAIN.bas", 288, "timMusic_Timer", "music_timer_entry", "main-form timer invokes music progression"),
        ("FRMOPTIO.bas", 58, "chkCheck_Click", "option_toggle", "MIDI/wave option changes dispatch to initialization or stop paths"),
        ("FRMOPTIO.bas", 406, "hsbVolume_Scroll", "volume_confirmation", "volume changes use a confirmation cue"),
        ("Module13.bas", 16, "fn1E6F", "wavemix_error_map", "WaveMix error codes map to user-facing messages"),
    ]
    source_root = EXPORT / "source"
    source_events = []
    for file_name, line, procedure, event, expression in event_specs:
        lines = (source_root / file_name).read_text(encoding="cp1252").splitlines()
        if not (1 <= line <= len(lines)):
            raise AssertionError((file_name, line, len(lines)))
        source_events.append({"file": file_name, "line": line, "procedure": procedure, "event": event, "expression": expression, "source_text": lines[line - 1].strip()})
    fixtures = [
        ("AUDIO-MATRIX", "every indexed wave/MIDI entry with audio on/off", "requested index, filename, present/missing result and game state"),
        ("FIGHT-MISSING", "request index zero in supplied installation", "missing cue handling, logging, timing and gameplay continuation"),
        ("MIDI-EDITION", "shareware versus retail edition flags", "catalogue names, selected file and playback completion"),
        ("MIDI-COMPLETION", "short/long tracks and timer boundaries", "MCI notification, timer interval and next-track selection"),
        ("WAVE-OVERLAP", "rapid simultaneous wave calls", "channel allocation, mixing order and dropped cues"),
        ("AUDIO-TOGGLE", "enable/disable MIDI and wave output while active", "stop/close state and subsequent call behavior"),
        ("VOLUME", "minimum, maximum and intermediate wave volume", "device value and confirmation cue"),
        ("DEVICE-ERROR", "missing device, unsupported format and allocation failure", "legacy message, flags and simulation state"),
        ("RNG-AUDIO", "audio on/off around music-related random draws", "RNG sequence and gameplay trace coupling"),
        ("PRESENTATION", "combat, dungeon, town and menu visual/audio triggers", "rendered state, cue index and event ordering"),
    ]
    runtime_cases = [{"id": case_id, "setup": setup, "trace_focus": focus, "expected_result": None, "status": "planned_not_executed"} for case_id, setup, focus in fixtures]
    result = {
        "status": "STATIC_PRESENTATION_AUDIO_TRACE_BUILT_RUNTIME_PENDING",
        "data": {
            "audio_file_count": len(audio),
            "wave_file_count": sum(1 for r in audio if r["name"].upper().endswith(".WAV")),
            "midi_file_count": sum(1 for r in audio if r["name"].upper().endswith(".MID")),
            "audio_index_assignment_count": len(assignments),
            "audio_call_site_count": len(call_sites),
            "missing_indexed_assets": sorted({r["asset"] for r in assignments if r["present"] not in {"True", "true", "1"}}),
            "wave_archive_comparison_count": len(waves),
            "source_status": "exact copied audio assets, call-site index map and static multimedia paths",
            "interpretation": "Asset bytes and caller/index relationships are preserved; device timing, MIDI behavior, missing-cue handling and visual equivalence require original-runtime observation.",
        },
        "source_procedures": source_procedures,
        "source_events": source_events,
        "source_event_count": len(source_events),
        "runtime_cases": runtime_cases,
        "runtime_case_count": len(runtime_cases),
        "runtime_requirements": [
            "run the exact original executable with the supplied audio archive unchanged",
            "record device/profile, MCI/WaveMix callbacks, channel timing and missing-file behavior",
            "compare presentation state and RNG traces with audio enabled and disabled without assuming equivalence",
        ],
    }
    (OUT / "presentation-audio-trace-spec.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"audio_files": len(audio), "assignments": len(assignments), "call_sites": len(call_sites), "missing_assets": result["data"]["missing_indexed_assets"], "source_procedures": len(source_procedures), "source_events": len(source_events), "runtime_cases": len(runtime_cases), "status": result["status"]}, indent=2))


if __name__ == "__main__":
    main()
