# Native Godot conversion

Open `project.godot` in **Godot 4.6** and run the project. Everything in the new runtime is GDScript; the cached Mono editor also works, without a C# build.

From the repository root on Windows:

```powershell
./Godot/Run.ps1
./Godot/Run.ps1 -Mode Editor
./Godot/Run.ps1 -Mode Workbench
./Godot/Run.ps1 -Mode Test
```

Pass `-GodotPath 'C:/path/to/godot.exe'` to use another Godot 4.6 installation. The launcher uses the existing cached engine when available. Logs go to the repository's `.tools` directory. `Test` imports assets and runs seven suites covering binary codecs/rules, the workbench, character saves/application flows, guilds, dungeon exploration, combat preview, and saved campaign battles; any failing suite exits nonzero.

## Application flow

The default scene is `ui/game.tscn`. Create a character, choose a race, sex and allowed alignment, allocate points, optionally set a password, and save. The roster reloads characters from disk. Enter town to deposit or withdraw gold, join or re-acquaint with guilds, read guild logs, and browse known spells. Successful bank and membership operations save immediately. Allocation follows the recovered race minima/maxima and refundable base points. New characters receive the original initial gold, HP, Nomad membership, age, coordinates, stat adjustments, next-experience threshold, and initial guild-log entry.

Guild membership preserves each guild's stored experience. The first additional membership is free; subsequent new memberships use the original ability/spell-category fee calculation and carried-gold/bank payment branches. Existing members can re-acquaint without repeating natural-stat requirements. Equipped cursed items block changes; incompatible uncursed equipment is automatically removed with its stat and effect changes. Titles use the original strict level thresholds. The guild screen distinguishes the current training requirement from the higher experience cap and displays quest status. Spell knowledge considers all joined guilds, independently of the active guild.

The Inventory screen equips and removes carried items in town, including the original reserved Hands slot. It applies guild/level/stat restrictions, free-hand and item-class limits, alignment penalties, curses, stat modifiers, attack/defense, equipment resistances, and ability flags. Labels respect identification levels instead of revealing unknown item names or properties. Empty new characters have Hands; the port does not invent starter items. Store purchases and dungeon loot remain unavailable.

The application is an **incomplete migration**. Solo encounter generation, combat and selected spell casting are active. Store transactions, actual guild training/forfeiture, companions, character recovery, and world-time changes remain unavailable. Town entry does not simulate the unported original healing/rest/world-time handlers. The native layout is new; it is not a pixel-identical port of the VB forms.

The Development tools button opens `ui/main.tscn`, with a return-to-game button. This workbench contains nine tabs: overview, raw records, full dungeon atlas, allocation fixture, damage replay, recovered procedure coverage, original assets, growth replay, and combat preview. The atlas reveals the complete dungeon for inspection; it is not a gameplay exploration map. Growth replay translates HP, attack/defense, critical ability, and spell-learning segments with explicit supplied random draws. It does not charge gold, generate quests, identify items, award guildmaster status, or save a level increase.

## Dungeon exploration

Choose **Enter dungeon** from town. Entry uses the original floor-one coordinate `(9,11)` facing north. Arrow keys or WASD move forward, turn left/right, or turn around; **T** takes stairs and **Esc** leaves for the roster. Buttons provide the same actions. Each successful action saves immediately. A character below town offers **Resume dungeon**, retaining coordinates and facing and checking its password. Taking any floor-one up staircase returns to town. Stairs preserve X/Y between floors; up has priority if both stair flags are present.

Movement reads the original east/north edge bits, using the neighboring record for west/south movement. Ordinary and secret doors use the forward action. Crossing a secret door records it on the automap. The player map reads only saved discoveries; the full atlas remains a development tool. Unknown secret edges appear as walls until crossed: random discovery and perception rolls are not yet implemented. The new perspective view uses native Godot drawing and the original geometry, rather than reproducing the VB rendering routine.

Compass squares apply their facing flags in original order. Extinguish squares clear temporary abilities and resistances. Fixed teleporters use original slots and can chain; unmatched floor-eight teleporter cells `(5,6)` and `(6,6)` leave the character on that square, following the recovered no-match loop. Teleporting to a square with zero automap flags sets the original lost flags. Lost characters cannot update the automap; a visited square restores their bearings. The map is hidden when the floor is unknown. Random recovery checks remain pending.

Pits, water, quicksand, rotators, chutes, and random teleport destinations reject the move with an explicit message. Invalid destinations, rock, and teleporter cycles also reject the entire action, keeping the last saved position and discoveries. These guards are migration behavior, not claims about original error handling. Anti-magic/extinguish terrain suppresses player and monster spells; stud-room generation changes remain pending. A destination reached through stairs or teleportation receives the same validation. Unsupported encounter-generation paths also reject the complete movement/save rather than record a harmless empty room.

## Saved dungeon combat

Entering a new area prepares its encounter from the original room/type/monster data. Up to four groups retain member counts, wounded-member HP, attack/defense, mood, identification, join offers, chest metadata and Currency gold in the original 28-byte `MDATA10.MDR` records. The first group's mood controls hostility. Peaceful monsters can turn hostile through the recovered charisma/alignment roll; Attack starts combat. Cleared rooms remain cleared across reloads. Respawning and companion join offers are not yet actionable.

Rounds advance once per second while the dungeon view is visible. Choose **Attack**, **Defend**, **Wait**, a group target, or an eligible spell. **Pause**, leaving for the roster, and opening development tools stop the timer; returning does not simulate missed rounds. Spells are queued once and then return to Defend. Weapons must be equipped in town (including Hands). The source's early Defend defense bonus is overwritten by its later assignment; this candidate preserves that ordering rather than inventing a defensive bonus. Defend still participates in the recovered theft-defense calculation.

The round follows the recovered solo ordering: player action, then each active monster group's attack. Weapon hits grant damage-based XP under the guild cap, update kill/quest counters, and replace slain members. Ordinary and killing-only damage spells apply SP quotes, guild/stat eligibility, resistance, spell immunity, monster-type restrictions, and group/member targeting. Selected self-target healing/cures and buffs work outside hostile combat; the original classification rejects non-combat spells while fighting. Charm, charged-item casting, teleportation, summons, raise spells and other unsupported effects are unavailable.

Monster actions include physical critical/backstab and size/invisibility effects, damaging spell selection, fire/cold breath, acid, electricity, age, drain, stone, poison, disease, paralysis, destruction and theft. Physical damage accumulates across up to five members before the HP debit. The unconditional poison/disease draws are preserved. Four-second poison/disease/paralysis actions retain the source disease roll's use of poison severity. Item destruction preserves inventory slots and invokes forced unequip arithmetic. The thief's next-member replacement uses the attacking group; the recovered source dispatches through a possibly different selected group, an unresolved behavior recorded in procedure coverage.

Victory marks the room cleared and decrements its remaining-room counter once. Loose gold is collected with the original Long conversion and half-share calculation; chest rewards await chest handling. Normal and stone deaths save HP, the death marker, Currency death count and guild log. Recovery/morgue services are not implemented, and the port does not revive a defeated character automatically.

The RNG uses a **static candidate recovered from supplied VBRUN300 bytes**, with the controlled initial seed `0x50000`. Character changes, room records, RNG state, active-time counters and recovered theft gold commit in one recoverable transaction. [Static evidence and limitations](../research/fidelity-foundations/vb3-rng-static.md) include exact instruction bytes and an independent halfword/BigInt check. Startup Randomize, ambient/music draw consumption, shared-stream coupling and original scheduling are unresolved. The original executable has not supplied an observed oracle.

Generation remains partial. A sweep using one controlled seed per original area generated 2,283 encounters and guarded 136 empty-secondary-pool cases. The decompiled retry labels, rare fallback/level-widening branches, stud terrain, special encounter transitions and original identification behavior need further migration/comparison. These counts describe candidate coverage, not proof of original behavior. Party and companion combat, chests/items, recovery and world-time systems also remain incomplete.

## Combat preview

Open **Combat preview** from town, the dungeon, or development tools. Town/dungeon previews copy the active character; the workbench creates a Human/Nomad fixture. Select an original monster record, the members per group, and up to four groups, then reset the preview. Group HP starts at the definition's average; this setup is a fixture, not `fn0D4D` encounter generation. Record indices remain distinct from logical IDs. The portrait uses the original monster sprite sheet.

Enter whitespace- or comma-separated random results in `[0,1)` and choose **Load draws**. **Example draws** fills the field with explicitly synthetic `0.5` values, which still need loading. Each successful action advances the tape; an incomplete or invalid trace leaves both character/group state and consumed draws unchanged. Append more results and reload to continue. Consumed results cannot be rewritten without resetting the preview.

**Player attack** and **Monster attack** step their source paths separately. They do not invent a player-first round or replace the original timers/initiative. Player actions use equipped weapon indices, per-hand swings, the winning guild's attack ability, critical/backstab rolls, size/invisibility modifiers, weapon-level and immunity checks, damage XP, monster-quest completion, kills, replacement-member HP, and group retargeting. A miss or a surviving hit stops that weapon's swing loop; kills can continue. Monster actions accumulate attacks from up to five members before debiting HP and include physical critical/backstab, size/invisibility, and guild defense effects. Victory and defeat stop further actions. The log and **Action trace** show the candidate results and ordered draws.

The optional **Equip Hands in preview** applies the existing equipment rules to the copy. It does not add equipment to the campaign. Preview health, experience, kill/quest counters, and victory/defeat do not update any save file. This preview remains restricted to physical actions; monster special attacks and campaign scheduling are handled by the separate campaign battle implementation. Unsupported preview branches disable/reject that actor's action rather than silently skipping effects.

One recovered-source ambiguity is retained explicitly in both the preview and campaign: `Module4.sub1019` assigns monster defense to `l0118`, but passes the unassigned `l011C` to `fn0DEE`. This candidate treats the unassigned Variant as zero and exposes both fields in the trace. The source is damaged decompiler output, so this is not evidence that the original executable ignored defense. The recovered player paralysis guard is `> 0`; a negative VB True value does not enter that branch. Neither behavior has been runtime verified.

## Saves and recovery

- The Windows launcher writes `Godot/Saves/MDATA4.MDR`. Running from the editor uses Godot's `user://campaign/MDATA4.MDR`. The resolved path is shown in the roster. `-- --save-dir=<directory>` overrides it for testing.
- The original files are read-only inputs. A working character file starts from their bytes, preserving the `1.1` header, 2,900-byte record addressing, 2,887-byte character payload, record gaps, unknown fields, and unused array slots. It retains original Windows-1252 strings and signed 64-bit Currency values scaled by 10,000.
- The supplied character header has count zero even though the file contains a leftover `BONK` record. Like the recovered loader, this port uses the header's active count. Creating the first character replaces that inactive slot in the **working copy**.
- Creation and new guild memberships update `MDATA4.MDR` and the sequential `MDATA9.MDR` guild log together. Dungeon actions also update `MDATA8.MDR`, `MDATA10.MDR`, and `combat-state.json`, adding the guild log for a first-depth discovery or death. Combat rounds update character, encounter and combat state together, with a death log when needed. The automap and encounter files retain original record addressing, payload gaps and trailing bytes. Combat JSON stores controlled RNG/active-time/visited-area metadata; recovered theft Currency uses decimal integer strings, never JSON numbers. Writes validate candidates, verify temporary files, prepare a hashed base64 rollback journal, rotate `.bak` files, and install every participant before removing the journal. A failure rolls all files back; interrupted rollback blocks writes until reopening recovers `campaign.pending.json`. An encounter file without its paired combat-state file is rejected. Do not delete recovery journals.
- A failed write does not change displayed balances or membership. If a primary is missing but `.bak` exists and no journal is pending, reopening loads the backup. A corrupt existing primary or invalid recovery journal is reported instead of silently replaced. Keep its bytes for diagnosis; restore a known-good set of backups manually if necessary.
- Saves opened before another window changed the file cannot overwrite the newer version; reload the roster first. Use one writing application instance per save directory. The adapter does not provide a cross-process transaction lock or a power-loss durability guarantee.
- This is a character/automap/guild-log adapter, not a complete original save lifecycle. Settings, world stocks, guildmaster updates and original load-time recalculation remain. New characters leave legacy window positions at blank defaults. Do not treat these files as a verified replacement installation save set.

## Evidence and coverage

`tools/import-original.mjs` copies the installation data, recovered VB source, C++ reference readers, extracted graphics, audio bytes, and independent test fixtures. It generates the UDT schemas, procedure index and SHA-256 manifest. Regenerate from the repository root with:

```powershell
node Godot/tools/import-original.mjs
node Godot/tools/verify-original.mjs
```

Both accept an optional path to the sibling `Mordor` source directory. The import reads `_Original Game Files/DATA`, not a generated CSV substitute. It also extracts the title tiers from `Module6.fn126E`. `ports.json` maps recovered procedures to their implementations. The current register has **32 candidate translations, 20 partial translations, and 639 unported procedures** out of 691. Updated counts appear in the workbench after regeneration.

| Area | Implemented | Fidelity limit |
| --- | --- | --- |
| VB UDT storage | All 55 declared types, nested arrays, CP1252, fixed/variable strings, exact raw Currency | Tested against supplied bytes; save lifecycle still partial |
| Original catalog | 9 races, 12 guilds, 401 monster records, 366 items, 105 spells, other state tables | Duplicate logical IDs remain separate records |
| Dungeon | 15 floors, 13,500 cells; solo movement/doors/stairs/fixed teleporters, compass/extinguish, automap, area encounters and depth logs | Random terrain/perception, respawning, parties and original renderer pending; unsupported transitions/generation fail atomically |
| Creation | Allocation, alignment/race restrictions, guild checks, character initialization, roster persistence, initial guild log | Original form metadata pending |
| Banking | Gold deposit/withdraw, all-gold shortcuts, decimal input, binary persistence | Party and item storage pending; parsing/error handling differs |
| Guilds | Join/re-acquaint, fees and payment, per-guild XP, titles, binary logs, eligibility and automatic unequipping | Original form/global presentation replaced; runtime comparison pending |
| Equipment | Town equip/unequip, restrictions, AD/stat effects, resistance/ability refresh, identification-aware labels | Dungeon callbacks and other item lifecycle actions pending; failed operations are atomic |
| Progression | XP requirement, pin cap, training preflight and quests, supplied-draw HP/AD/critical growth, spell knowledge/casting level | Growth replay only; original RNG, quest generation, awards and saved training action pending |
| Combat/economy | Four-draw damage replay; identification/selling/uncursing quotes | Quotes only for shops; no shop transaction loop |
| Combat | Saved solo rounds, weapon/damage-spell/group actions, critical/backstab, special attacks, XP/quests, ailments, loose gold, death, binary rooms and controlled VB RNG; separate supplied-draw preview | Companions, charm, charged items, remaining spells, chests/items, recovery, generation retry labels, global timing/shared RNG and executable comparison pending |
| Presentation | 34 original graphics; original PCM WAV playback | Native UI layout; MIDI bytes retained, sequencing/WaveMix not ported |

The original executable has **not** been used as a runtime oracle. Nearest-even VB conversions and Single/Currency assignment points are explicit candidates, with tests describing the candidate implementation rather than claiming measured parity. The XP routine rejects intermediate amounts that exceed exact double integer precision. Draw replay consumes supplied random values and does not substitute Godot's RNG for VB's original sequence.

The recovered bank withdrawal branch accepts negative amounts if the bank balance is nonnegative. That branch is preserved and covered by a test. The UI accepts signed decimal amounts with up to four decimal places, rather than attempting full locale-sensitive VB `CCur` parsing. Currency overflow rejects the whole operation atomically; this differs from original `On Error Resume Next` partial-error behavior. These differences are recorded in partial procedure coverage.

`Module6.fn114E` uses a Long parameter even though balances are Currency. When payment spills into the bank, its remaining amount is rounded to Long before debiting the bank. The candidate translation retains this quirk and returns the changed ByRef value explicitly. The training preflight also retains the item-quest search's reserved-slot-zero behavior. Neither behavior has been compared with the original executable yet.

Equipment operations use a private character copy and commit only after validation. On a failed racial-minimum check, the original `sub0F74` can leave an intrinsic curse assigned before returning; this port rolls that failed operation back. This deliberate failure-handling difference is recorded as partial coverage. Stat-AD remove/apply runs synchronously instead of using the original process-global reentry flag. Town effect refresh is translated; encounter/room refresh calls for dungeon equipment changes remain unavailable.

Original WAVs are stored as `.WAV.bin` because Godot's ordinary WAV importer does not safely consume several supplied RIFF files. `core/original_audio.gd` extracts their original PCM data at runtime without resampling; malformed trailing metadata is ignored after the bounded PCM chunk. MIDI is not played yet.

## Validation

Reports are saved in `tests/results.json`, `tests/ui-results.json`, `tests/campaign-results.json`, `tests/guild-results.json`, `tests/dungeon-results.json`, `tests/combat-results.json`, `tests/battle-results.json`, `tests/encounter-generation-results.json`, and `tests/integrity-results.json`. The suites include independent research CSV comparisons, lossless round trips of 19,451 typed records, all 256 byte values, malformed input, numeric boundaries, original sample-byte checks, native control signals, character creation, passwords, banking, membership, equipment and alignment effects, title/quest/growth boundaries, supplied draw consumption, reloads, stale saves, backups, corruption, and 64-bit Currency persistence. Guild persistence tests inject a second-file failure and an interrupted rollback, then reopen and verify both the character and log are recovered together.

Dungeon checks sweep all 54,000 directional edges against independent CSV geometry, verify byte-exact automap writes and lost-state guards, test stairs/fixed teleporters/cycles/unsupported terrain, and inject a log-file failure after both character and map installation. Reopening must recover all three prior files. UI checks walk an actual fifteen-step floor-one route, descend to floor two, return upstairs, leave/resume through the roster, and use Godot's keyboard pipeline.

Combat checks cover guild ability selection/ties, literal damage arguments and swing stopping, two-hand misses, immunity, overkill versus actual damage XP, quest completion and Currency counters, member replacement and retargeting, final kills, monster group damage accumulation, defeat, critical/backstab order, pin caps, invalid/missing draws and atomic retry, unsupported attack guards, UI draw editing/targeting, and byte-level isolation from the campaign. Test vectors are candidate expectations, not observations from the original executable.

For visual checks, run `tests/test_campaign.gd` without `--headless` and pass `-- --capture-game`. It captures creation, roster, town, bank, and guild screens under ignored `tests/screenshots/`, using a fresh isolated test save. `tests/test_guilds.gd -- --capture-guilds` captures membership, guild-log, confirmation and inventory screens. `tests/test_dungeon.gd -- --capture-dungeon` captures entry, corridor, mapped route and floor-two screens. `tests/test_combat.gd -- --capture-combat` captures player/monster actions and the standalone workbench preview. The workbench accepts `-- --capture` and `--compact` when launched as `ui/main.tscn`.

Battle checks compare 10,000 RNG updates against the recovered runtime's halfword arithmetic, exercise ordered rounds, effect-zero damage spells, SP/resistance/killing-only gates, monster special flags, ailments, paralysis AD restoration, victory/death counters, loose gold, cleared-room reloads, and a sweep of every original area. Save tests fail RNG-file installation after character/encounter installation, interrupt rollback, then verify all prior bytes and RNG state recover together. Native UI tests cover Attack, Pause, hidden views, the roster and no catch-up. `tests/test_battle.gd -- --capture-battle` captures the saved-combat interface. `node tools/verify-vb-rng.mjs` from this directory verifies the runtime-byte evidence and 10,000 independent BigInt/halfword updates.

The next migration work includes companion/party combat, charm/charged-item casting and remaining spells, chests/items, recovery, ambiguous encounter retries and respawning, Randomize/shared-stream scheduling, training, dungeon perception/hazards, world time, and original-executable comparisons. See the repository's `research/fidelity-foundations` trace specifications for the unresolved dependencies and comparison plans.
