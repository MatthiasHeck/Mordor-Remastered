# Recreation readiness and next steps

Reviewed October 10, 2026.

## Current verdict

The project is ready for original-runtime measurement, not for a claimed 1-to-1 recreation. All sixteen action items have static evidence, source-linked trace events and controlled runtime cases. All sixteen remain `runtime_pending`. The original executable has not been run, critical procedure addresses are unresolved, and no behavioral observation has certified the decompiler's formulas or control flow.

The removed Godot prototype must remain retired. A replacement should begin only after the reference observations below are captured and should keep measured behavior separate from candidate interpretations.

## Re-evaluated action items

| Gate | Items | Current state | Required before broad implementation |
| --- | --- | --- | --- |
| Reference and foundations | R01-R05 | Static or started; no original runtime observations | Freeze edition/configuration, run the original build, resolve critical procedure addresses, capture VB3 conversions/RNG, combat outcomes and timer ordering |
| Rules and state | R06-R12 | Static trace specifications complete; runtime pending | Capture spell, progression, encounter, item, economy, party and recovery transcripts, including boundaries and random draw order |
| World and persistence | R13-R14 | Static maps/serializers complete; runtime pending | Verify every traversal/hazard and byte-level save/load round trip, including legacy and pending-recovery records |
| Presentation | R15 | Assets/call sites complete; runtime pending | Record MIDI/WaveMix/device behavior, missing `FIGHT.WAV`, form layout and visual state transitions |
| Anomalies | R16 | Ten candidates catalogued; runtime pending | Classify each as legacy behavior, decompiler damage or unresolved before choosing implementation behavior |

## Next steps in order

1. **Establish the reference runtime.** Prove the executable's edition and configuration, provision a compatible Win16 environment, and launch the disposable `baseline-001` copy. Record OS/compatibility-layer, clock, display, MIDI and wave-device details. Do not substitute a later build or silently repair missing assets.

2. **Capture the P0 foundation cases.** Execute REF01, CODE01, NUM01, COMBAT01 and TIM01 from [action-item-runtime-cases.json](action-item-runtime-cases.json). Resolve R02's 37 critical routines to executable addresses and call boundaries, then store raw observations separately from the static trace specifications. This is the first implementation gate.

3. **Build a reference oracle.** Convert each observation into a versioned input/state/event/output record. Include RNG seed/state, typed intermediate values, messages, timers, audio requests, persistent file bytes and error paths. The oracle must replay the same case and expose the first divergence.

4. **Measure dependent rules in dependency order.** Run R06-R13 cases after the foundation traces: spells and progression; encounters and loot; items and economy; parties and recovery; then dungeon transitions and hazards. Preserve duplicate IDs, zero-valued fields, slot-zero behavior, unmatched teleporters and all observed defects exactly as measured.

5. **Verify persistence and presentation.** Run R14 round trips against copied files and compare bytes before/after. Run R15 with the unchanged audio archive and recorded device profile. Capture screenshots and cue/timing transcripts for each major form and state transition.

6. **Classify R16 anomalies.** Repeat the defect fixtures until each candidate has a stable classification. The Godot implementation must reproduce confirmed legacy quirks and must not repair unresolved branches.

7. **Implement Godot in layers.** First implement a deterministic, headless rules core with explicit VB3 numeric/RNG semantics, data-driven records and replayable events. Add binary-compatible persistence next. Add Godot forms, input, rendering and audio only as adapters over that core. Every subsystem must have a differential fixture against the reference oracle before the next subsystem is started.

8. **Run a parity gate.** A 1-to-1 claim requires all sixteen items to have observed evidence, deterministic replay agreement for the controlled cases, byte-level save agreement, matching visual states, and documented audio/timing behavior. Until then the result must be described as a measured partial recreation.

The authoritative status remains in [work-items.csv](work-items.csv), [action-item-coverage.csv](action-item-coverage.csv), [action-item-runtime-cases.json](action-item-runtime-cases.json) and [validation.json](validation.json). The latest validator reports `original_game_runtime_tests_executed: false`.
