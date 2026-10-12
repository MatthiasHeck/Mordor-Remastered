# Special dungeon square reference

The export reads the local fifteen-floor `MDATA11.MDR` directly. [all-cells.csv](all-cells.csv) has 13,500 records; [special-squares.csv](special-squares.csv) selects 3,965 cells having any special bit 6–22 except solid-rock bit 19. Walls and door edges remain in the full mask. Multiple flags on one square are retained together. [flag-counts.csv](flag-counts.csv) gives per-floor counts, including zeros; [flag-definitions.csv](flag-definitions.csv) records every bit and integer mask.

`x_candidate` and `y_candidate` are one-based decoded coordinates. Byte offsets are zero-based; `record_number` is one-based. Terrain is stored as VB Currency with scale 10,000. Raw Currency, decoded integer and hexadecimal forms are retained. Static coordinate support does not certify original screen orientation or every traversal destination.

| Bits | Labels from original initialization | Static behavior / remaining verification |
| --- | --- | --- |
| 0–1 | Right Wall; Upper Wall | Shared-edge geometry; render/traversal orientation needs original comparison |
| 2–3 | Right Door; Upper Door | Ordinary stored edges; remaster automatically opens an eligible door on attempted crossing |
| 4–5 | Right SDoor; Upper SDoor | Secret edges; automatic crossing must respect original discovery/opening eligibility |
| 6–9 | Face North; Face East; Face South; Face West | Square handler applies facing values 1–4 in this order; conflicting flags are retained |
| 10 | Extinguish | Square handler clears per-character effect state and calls recalculation/update helpers; exact effect coverage and order need verification |
| 11 | Pit | Per-character fall roll with levitation branch; floor/race-dependent damage and integer conversions |
| 12–13 | Stairs Up; Stairs Down | Contextual Take branch traverses up before down; first-floor up returns to town; remaster maps Take to T |
| 14 | Teleporter | Coordinates matched to a slot; either destination coordinate zero selects random X/Y per character, avoiding rock and teleporter flags; positive destination floor can change floor |
| 15 | Water | Timed drowning path loses floor-dependent HP; eligibility includes surrounding condition checks |
| 16 | Quicksand | Timed sinking path can destroy a selected eligible inventory item and lose HP; retention, burden and levitation conditions require full caller tracing |
| 17 | Rotator | Random facing 1–4 and perception/depth-related loss-of-direction check |
| 18 | Anti-Magic | Spell-access/eligibility routine returns an Anti-Magic message; item, companion and existing-effect interactions need tests |
| 19 | Rock | Solid cell; teleport validation has a distinct fatal rock path; not included in special-squares subset alone |
| 20 | Fog | Original flags and art retained; monster identification branches use a terrain-bit check; verify identity, visibility and perception effects |
| 21 | Chute | Square entry can make individuals fall; levitation checks and leader-follow choice; explicit Take can also use a chute |
| 22 | Stud | Stored label and occurrence data retained; documented stronger encounters still require complete generation-path/runtime verification |

Read [square processing](../code/dungeon/Module3--sub0835.bas), [chute traversal](../code/dungeon/Module3--sub08F5.bas), [perception ahead](../code/dungeon/Module3--sub0A1D.bas), [perception on square](../code/dungeon/Module3--sub087C.bas), [Take/movement dispatch](../code/dungeon/Module6--fn14CB.bas), [teleport validation](../code/dungeon/Module6--fn164C.bas), [spell eligibility](../code/dungeon/Module6--fn10E5.bas), and [timed ailments/hazards](../code/dungeon/FRMDUNM--timAilment_Timer.bas). These preserve generated field names rather than assigning every unknown a speculative label.

## Transitions and discrepancy

[teleporters.csv](teleporters.csv) retains all 240 allocated slots, including unused zero slots. There are 86 active coordinate entries and 88 teleporter-flagged cells. The two unmatched flags are **floor 8, (5,6) and (6,6)**; no table slot starts there. [transition-checks.json](transition-checks.json) records this directly. The displayed square handler searches for a coordinate match; behavior without a match needs original runtime observation. Do not fabricate a destination, assume an adjacent slot applies, or remove the flags.

`destination_floor_raw = 0` does not mean town: the shown branch changes floor only for a positive destination. The `effective_floor_candidate` column retains current floor otherwise. `destination_kind_candidate` records the displayed fixed/random coordinate branch. This interpretation does not certify rejection-loop order when floor changes, party separation, lost-state updates or chained triggers.

[chutes.csv](chutes.csv) contains 150 allocated slots and 17 active entries, matching all 17 chute-flagged cells. Chute depth is stored separately. The chute routine keeps X/Y and increases floor when a matching positive-depth entry is found; it subsequently updates location and applies a levitation-dependent damage branch. Floor bounds, party-follow behavior, damage rounding and destination processing require runtime checks.

[doors.csv](doors.csv) lists 2,328 stored ordinary/secret edge flags, not 2,328 unique freestanding objects. Each carries its bit, shared-edge side and secrecy. [areas.csv](areas.csv) retains all 3,015 allocated area records with raw spawn/lair fields; a nonzero raw lair reference is distinct from a terrain flag. [floors.csv](floors.csv) preserves counts and dimensions. No reachability claim follows from a non-rock cell or an active slot alone.

Door auto-opening changes input convenience, not geometry or discovery. Each **T** press takes at most one available stair transition. Holding T cannot chain through successive landings. The design document specifies timing, failed traversal and combined-hazard acceptance cases.
