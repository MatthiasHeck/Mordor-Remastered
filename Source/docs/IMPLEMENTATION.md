# Implementation status and evidence

Baseline: [Mordor Remastered Design Document](../../Mordor%20Remastered%20Design%20Document.md), revision 1.3, October 9, 2026. Research stays in the repository root. Source executable fingerprint: `bd1332c37eb9d6a024d95ba1b70daf03c1a6c64c622964fb3d8bcc6297d06309`.

## Architecture

`Mordor.Core` targets .NET 8 without any Godot reference. It loads raw records through an injected reader; the client uses Godot FileAccess so the same boundary can read packed resources. Every CSV field remains a string in the raw catalogue. Typed integer access is explicit and fails for missing values. Record positions and embedded IDs stay separate.

The client issues core commands. It clones the complete state before applying a command, validates and commits an atomic snapshot, and restores the previous state on failure. Invalid commands consume no resources. Only the core changes expedition state. UI changes and cosmetic drawing do not consume simulation random numbers. No gameplay RNG, combat timer or offline simulation is implemented yet.

Saves contain a versioned, checksummed JSON payload. A same-directory temporary file is flushed, then atomically replaces the primary while retaining the previous primary as a recovery copy. A damaged primary is preserved before recovering from the backup. Unsupported versions or rulesets are rejected. The design's eventual complete world model will need further schema versions; the prototype is intentionally incompatible with a future certified campaign by default.

## Evidence and prototype decisions

| Feature | Source / status |
| --- | --- |
| Nine races; min/max stats; pools; race and guild masks | `research/local-original/races-local.csv`, `guilds-local.csv`; extracted facts |
| Initial min + 5; 1,500 gold; 15 HP; 5,840 days; Nomad 1; 9,11 town coordinates | Design 4.4 and `research/local-original-review.md`; static candidates |
| SP = 5 × (natural INT + natural WIS) | `Module6.fn1338` cited in local-original review; candidate |
| Duplicate/invalid-name protection; confirmation of unused points | Design 4.4; maximum 24 characters and ordinal case-insensitive uniqueness are prototype conventions |
| Four party members and alignment compatibility | Design 7 / reference help; whole-world order is persisted; runtime parity pending |
| Guild eligibility | Raw race/alignment masks and six stat requirements; display only. Effective-stat check requires runtime validation |
| Spell access preview | `guild-spell-access-local.csv`, effective stat requirements; no cost/effect inferred |
| Payment fallback | `Module6.fn114E` cited in local-original review; covered in headless tests, not used to invent service prices |
| Explicit bank transfers | Design 14.2; conserved personal balances, no fee or auto-deposit |
| All 13,500 cells and terrain bits | Dungeon CSVs and decompiled enum export. x east / y north is a candidate requiring original automap overlay |
| Shared right/upper wall and door ownership | Candidate interpretation of terrain bits 0–5. Reciprocal geometry is tested; historical semantics remain unverified |
| Entrance and stairs | Start at floor 1, 9,11 (up-stair flag present); paired stairs require opposite flag at same coordinates. Other transitions reject |
| Door lifetime | Open state persists in the prototype world; baseline reset/auto-close behavior unresolved |
| Visibility and mapping | Conservative visited-cell automap; corridor projects up to five unobstructed cells. Original range/perception needs comparison |
| Secret doors | Always opaque in exploration; search/reveal mechanics pending |
| Hazard handling | Reject entry before mutation when effect is unresolved, including water/fog/forced-facing/pits/teleporters/chutes. This is a prototype limit, not original gameplay behavior |
| Town healing | HP refill and round-to-even missing-HP age candidate from design 15.7, natural-stat SP refill. No global time, companions or ailments yet |
| Item knowledge | Unknown and partial instances show only stored generic appearance. This conservative view is not a complete three-stage identification implementation |
| UI pause/focus | Input is stopped explicitly or on focus loss. No active timed rules yet; not validation of the original timing matrix |
| New presentation | Code-native town silhouette, corridor geometry, SVG icon, dark panels. Original assets not copied |

## Implemented checks

The executable tests check source hashes, counts, duplicate embedded IDs, ID-zero item spell references, signed fields, all race/alignment creation combinations and bounds, party capacity/conflicts, bank ownership and overflow, payment fallback, every map coordinate and shared edge, opaque secret doors, real door traversal, unresolved-terrain rejection, visited-only discoveries, knowledge masking, exact JSON round trips, invalid snapshot rejection, and corrupt-save recovery.

The Godot smoke test creates a character through actual UI signals, deposits/withdraws through the bank UI, visits every screen, enters through the town button, checks keyboard turn/pause rejection, draws a four-member party at larger text size, opens the map/atlas, and verifies a test save/load. Graphical mode writes viewport screenshots; headless mode checks the same scene flow without rendering captures. It does not touch normal player saves.

Passing these checks establishes implementation consistency, not comparison with the original executable. Controller focus, screen-reader behavior, legacy numerical conversions, frame-rate timing, deep-dungeon hazards and all unresolved rules remain release gates.

Observed validation for this implementation:

- Godot 4.6 .NET / .NET 8 target: the full editor solution builds with zero warnings and zero errors using SDK 9.0.318.
- Eight core suites pass, with 68,239 assertions (most enumerate all cells and reciprocal edges).
- Graphical and headless Godot smoke tests pass. The graphical test uses OpenGL Compatibility rendering.
- Screens inspected at the default 1440×900 size and the requested 1100×720 minimum, including four party members and enlarged text. Side panels scroll when content exceeds available height.
- The launcher completes build, resource import and headless smoke execution. Screenshots are written under the ignored `Artifacts` folder.
- Original-executable comparisons, packaged Windows export, controller testing and screen-reader validation have not been performed.

## Production work remaining

Follow design sections 23–25 and the source-linked F/V cases. Freeze the registered baseline and asset permissions; validate navigation/orientation; implement and compare RNG and scheduling; recover combat, item eligibility and spell arbitration; implement encounters/loot, town economy, guild progression and quests; preserve companions, casualties and recovery; then implement complete save migrations, production art/audio and accessibility. No milestone is marked complete merely because its datasets or a partial UI exist.

The research source files and the supplied `Mordor` folder remain unchanged. `Tools/Import-Reference.ps1` copies only the selected research CSVs and records their SHA256 digests; it never edits original inputs.
