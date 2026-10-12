# Fidelity foundations — October 10, 2026

The previous Godot implementation has been removed, including its client, rules, copied data, tests, launchers and generated output. No replacement game is being presented as faithful. The original research exports remain available, and the original source tree is unchanged.

This first pass advances provenance, timing/RNG analysis, original audio recovery and preparation of controlled experiments. **No original game, DLL, installer or decompiler was executed. No behavioral parity case has passed.**

## Findings

| Finding | Evidence | What it establishes / limitation |
| --- | --- | --- |
| All 685 long source-string occurrences appear in the local executable | [Literal offsets and source lines](source-literal-provenance.csv) | Strong content correspondence. Each occurrence is counted, including repeated strings. This does not link procedure boundaries or validate control flow. |
| 609,048 game dump bytes and 243,286 VB runtime dump bytes match their binaries | [Reko byte comparison](reko-byte-comparison.csv), [NE metadata](binary-baseline.json) | 48/50 game ASM files and 87/101 runtime ASM files have uniquely supported segment mappings. Loader-fixup storage is excluded. Sixteen files have insufficient distinctive dump data. Instruction mnemonics and inferred C are not certified. |
| No unexplained mismatch in mapped, file-backed dump bytes | Same comparison | Twenty-eight bytes displayed outside segment-file bounds are recorded separately, not compared to adjacent file contents or called missing code. |
| Four form timer values recovered | [Raw offsets and bytes](form-timer-candidates.csv) | Candidate interval fields: combat 1500, ailments 4000, music 10000, credits animation 2000. The property interpretation and actual timing still need verification. |
| Combat initialization explicitly assigns 1000 | [Module3.sub0A49](../original-export/code/source/Module3.bas:732) | The form candidate is not the active dungeon interval. Callback cadence, attack cadence and the help's two-second round remain distinct questions. |
| Music scheduling calls the same VB `Rnd` intrinsic seen in gameplay | [Module9.sub1A50](../original-export/code/source/Module9.bas:74), [startup Randomize](../original-export/code/source/Module6.bas:273) | Potential shared-stream coupling. Music uses one draw in its repeat decision and a further draw in its random-track branch. Runtime state sharing and observed consequences remain unverified. |
| All available original audio is preserved | [Audio manifest](audio-manifest.json), [byte-preserved files](audio) | 71 WAVs and 16 MIDIs. WAV format/duration and MIDI header/track boundaries checked; this does not establish playback or instrument rendering fidelity. |
| All 71 sound-archive members equal the installed sound files | [Archive comparison](wave-archive-comparison.json) | Installed audio is consistent with the supplied `WAVES.WIP`. |
| `FIGHT.WAV` is referenced but absent | [Index assignments](audio-index-assignments.csv) | 72 WAV assignments exist for 71 available WAVs. Index zero uses an implicit-default candidate. Its runtime reachability and missing-file behavior remain open; no substitute sound has been invented. |
| Audio callers now have an index | [119 call sites](audio-call-sites.csv) | Static arguments are resolved where explicit constants are available. Dynamic expressions remain unresolved. An index is not a fully verified event-to-cue map. |
| All nine selected runtime dependencies recovered locally | [Dependency manifest](runtime-dependencies.json), [library files](runtime-libraries) | Five VBX controls and WAVMIX16 are in MORDOR.WIP; VBCTL3D and SETUPKIT are compressed setup files; VBRUN300 has both loose and compressed copies. The decompressed runtime matches the loose runtime exactly. |
| A disposable original-game copy is prepared | [Preparation report](lab-preparation.json) | 115 copied files with initial hashes and a separate empty observations record. Includes supplied mutable world state; not certified new-game defaults. Not launched. |

The first R02 procedure map is now available in [critical-procedure-provenance.csv](critical-procedure-provenance.csv) with its interpretation in [critical-procedure-provenance.md](critical-procedure-provenance.md). It resolves source identity, generated-symbol callers, and long-string data anchors for all 37 selected routines. It intentionally resolves **zero** machine-code addresses; DoDi names are not executable symbols, and a data-string match cannot identify a routine. That unresolved count is recorded as progress toward R02 rather than hidden as a parity claim.

The segment-level Reko evidence is in [reko-segment-relocation-map.csv](reko-segment-relocation-map.csv) and [reko-segment-relocation-summary.json](reko-segment-relocation-summary.json). All 50 saved Reko segment dumps map to the NE image; 48 are byte-verified, two are unique allocation-size mappings, and only one segment has a saved function listing. This confirms the next blocker is function-level Reko analysis, not segment identity.

R03 now has static numeric and RNG fixtures: [numeric-conversion-sites.csv](numeric-conversion-sites.csv) indexes 327 `CInt`/`CLng`/`CSng`/`CDbl`/`Fix`/`Int` sites, [rng-call-sites.csv](rng-call-sites.csv) preserves all 228 `Rnd` call sites in source order, and [rng-schedule.json](rng-schedule.json) records the single startup `Randomize` plus the two music-selection draws reached through `FRMMAIN.timMusic_Timer`. [vb3-semantics-fixtures.json](vb3-semantics-fixtures.json) defines five runtime fixtures. Their expected values remain unmeasured until a compatible original runtime is available.

The ordered trace specification in [numeric-rng-trace-specs.json](numeric-rng-trace-specs.json) covers eight high-risk routines and 59 `Rnd` events, including combat damage, character creation, startup/music scheduling, and the shared combat helper. `RNG01` and `NUM01` reference this specification; their observations remain null.

R04 now has a dedicated [combat trace specification](combat-trace-spec.json). It identifies all three `fn0DEE` call sites, preserves each five-argument call, records the helper's four random draws and conversion/clamp events, and defines eight boundary fixtures. It is a static execution plan; no damage, hit, swing or special-effect result is certified yet.

The [action-item coverage matrix](action-item-coverage.csv) now covers all 16 register items with existing evidence paths and names the remaining behavioral blocker for each. Its status is intentionally `runtime_pending` for every item; static coverage does not certify parity.

[action-item-runtime-cases.json](action-item-runtime-cases.json) defines one controlled observation case for each R01–R16 item. All 16 are explicitly `planned_not_executed`; they are ready to run against the prepared original lab when a compatible runtime or debugger is available.

R05 now has a [timing trace specification](timing-trace-spec.json) tying four binary timer candidates to twelve source callback/setup/guard events and 36 timer/pause references. It records the 1500 ms form value, 1000 ms dungeon assignment and 2000 ms later-help discrepancy without selecting one as the effective cadence.

R06 now has a dedicated [spell trace specification](spell-trace-spec.json). It preserves 100 spell records and 205 guild-level assignments, links nine source procedures and twenty source events for access, cost, context, targeting and effect handling, and defines eight runtime fixtures. The help tables still contain unresolved power fields; empty values are retained as unknown rather than treated as zero. All spell observations remain pending original-runtime access.

R07 now has a dedicated [progression trace specification](progression-trace-spec.json). It indexes nine races, twelve guilds, creation validation and defaults, XP and training cost formulas, advancement gates, highest-guild selection, age/rest handling, fifteen source events and nine runtime fixtures. The printed race/guild tables remain static inputs; legal paths, VB conversions, HP growth and quest draw order still require original-runtime observations.

R08 now has a dedicated [encounter trace specification](encounter-trace-spec.json). It links 401 candidate monster records, fifteen floors, 13,500 cells and 86 active teleporter slots to nine encounter/loot procedures and sixteen source events covering generation, groups, traps, chests, item selection and final encounters. Duplicate IDs and candidate field meanings remain unresolved until the original runtime is observed.

R09 now has a dedicated [item trace specification](item-trace-spec.json). It links 366 candidate item records, slot-zero and spell/charge/curse fields to thirteen equipment, identification, item-use and store procedures, seventeen source events and nine controlled fixtures. Candidate field semantics and every ownership, consumption and transaction result remain pending original-runtime observation.

R10 now has a dedicated [economy and world-time trace specification](economy-time-trace-spec.json). It links store quote, payment, stock persistence, rest-day and town-entry paths to eleven procedures, nineteen source events and ten controlled fixtures. VB currency rounding, carried-versus-banked payment order, stock refresh timing and world-time propagation remain runtime questions.

R11 now has a dedicated [party and companion trace specification](party-companion-trace-spec.json). It links four companion slots, purchase and binding services, party formation/removal, companion casting and obedience/hostility branches to twelve procedures, twenty source events and ten controlled fixtures. Binding signs/caps, random obedience, friendly fire, reward sharing and carrying transitions remain unobserved.

R12 now has a dedicated [recovery and age trace specification](recovery-age-trace-spec.json). It links Morgue, paid rescue, wait rescue, pending raises, town recovery, age updates and complication branches to thirteen procedures, twenty source events and eleven controlled fixtures. Recovery chance, rounding, pending save fields, Rock handling, HP restoration and cumulative age remain runtime questions.

R13 now has a dedicated [dungeon trace specification](dungeon-trace-spec.json). It links 13,500 cells, 3,965 special squares, 2,328 door edges, 17 active chutes, 86 active teleporters and the two unmatched floor-8 teleporter flags to nine traversal/hazard procedures, sixteen source events and ten controlled fixtures. Transition order, combined hazards, door/perception behavior and unmatched destinations remain unobserved.

R14 now has a dedicated [persistence trace specification](persistence-trace-spec.json). It links character, automap, companion/item store, hall/library/maze files and pending-recovery writes to twelve serializer procedures, eighteen source events and ten controlled fixtures. Complete field coverage, save triggers, legacy conversion and unknown-byte preservation remain runtime questions in the disposable lab.

R15 now has a dedicated [presentation and audio trace specification](presentation-audio-trace-spec.json). It links the exact 87-file audio archive, 88 index assignments, 119 call sites, ten multimedia procedures and fourteen source events, preserving the missing indexed `FIGHT.WAV` entry and ten controlled fixtures. Device timing, MIDI completion, WaveMix overlap, missing-cue handling and visual equivalence remain unobserved.

R16 now has a dedicated [defect trace specification](defect-trace-spec.json). It records ten suspected legacy defects or decompiler-damage candidates across disease severity, age 98 logarithms, timer/help discrepancies, recovery rounding/probability, complication penalties, subsidy selection, store locals and binding caps. Eleven procedures, fifteen source events and ten fixtures are linked; no candidate is treated as a rule until original-runtime evidence classifies it.

The music discovery changes a proposed architectural assumption: a new visual effect can use independent randomness, but original audio-related draws must first be accounted for. Simply deleting or moving the music draws could change an otherwise identical seeded gameplay trace. The main design now treats audio-on/off equivalence as a comparison question rather than an established property of the original.

## Comparison work next

The [work register](work-items.csv) covers all sixteen areas from the assessment and links them to the existing F-series issues. Every item now has static evidence, source-linked trace events and a controlled runtime case; every behavioral status remains `runtime_pending`. The next priority is to provision a compatible original runtime and execute the cases in dependency order, starting with R01–R05 foundations before comparing the dependent systems.

Seven detailed [runtime cases](runtime-cases.json) specify setup, input sequences and captures: idle combat versus actual actions, ailments/pause, manual commands near a round boundary, music/RNG coupling, numerical conversions, the missing sound entry, and the two unmatched floor-8 teleporters. Observations are null until measured. Other existing V01–V31 cases remain required.

The prepared experiment is under `.tools/original-lab/baseline-001`. It has `game/`, `initial-manifest.json` and `observations.json`. No Win16 runner was found on the inspected PATH. This is a narrow environment check, not a claim that no compatible software exists anywhere on the machine. The next runtime step is to provision and fingerprint a compatible environment, configure its writable locations to the disposable experiment, and verify startup before collecting results. MIDI device/profile and compatibility-layer behavior must be recorded along with the executable.

[WineVDM's own instructions](https://github.com/otya128/winevdm#how-to-run) document explicit execution through its runner without requiring global file-association installation. A compatibility layer is a candidate measurement environment; original Windows behavior must remain distinguishable from emulator artifacts. No runner has been downloaded or installed in this pass.

## Reproduction and validation

Run from the project root with Python 3.11+ (standard library only):

```powershell
python research/audit-fidelity-foundations.py
python research/prepare-original-lab.py --name baseline-002
python research/check-fidelity-foundations.py
```

Choose a fresh experiment name: preparation refuses to overwrite an existing experiment. Audit regeneration never resets the copied game or its observations. The validator compares the latest prepared copy with its initial manifest; a played experiment is expected to diverge and should be retained as evidence while a new copy is prepared for another case.

The [audit](../audit-fidelity-foundations.py) fingerprints every input it consumes and verifies all 1,273 original files against the prior immutable inventory. [Validation](validation.json) also checks the source offsets, all audio bytes, planned-case records, documentation links and absence of the removed prototype. The three SZDD decompressions are independently compared with Windows `expand.exe`; this system utility decompresses files and does not run their contents. The existing export/document validator remains applicable to revision 1.4.

NE parsing follows Microsoft's [Executable-File Header Format](https://github.com/qb40/exe-format/blob/master/README.txt) as preserved from the Windows 3.00 Developer's Notes. SZDD expansion uses the documented mode-A LZSS layout, cross-referenced against [libmspack's format definitions](https://github.com/kyz/libmspack/blob/master/libmspack/mspack/lzss.h) and [decoder](https://github.com/kyz/libmspack/blob/master/libmspack/mspack/lzssd.c). The project reader is independently checked against `expand.exe` and the supplied runtime bytes.
