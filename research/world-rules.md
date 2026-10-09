# World, combat, town, companions, persistence — research notes

**October 9 update:** the [original-file review](local-original-review.md) adds all fifteen floor layouts (13,500 cells), area/transition slots and static evidence for payment ordering, quest gates and fatal-condition identities. These findings supersede statements below that full map data is unavailable. Runtime timing, transitions and recovery behavior still need original-game verification.

Research date: 2026-10-08. Target: **Mordor: The Depths of Dejenol**, original commercial 1.1, associated with the 1995 release. These notes distinguish documented behavior from proposed implementation and unverified formulas.

## Evidence and version discipline

**P1 — primary, later maintained help:** [official Mordor page](https://www.decklinsdemise.com/mordor.htm) links [M1B040b.chm](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm) as the updated help set for M1 and the legacy game. Downloaded to `research/official-help-M1B040b.chm`, extracted without executing game code to `research/official-help/html/`. Its order-information topic explicitly identifies the basis as the original 1994/1995 1.1 game; the publication also contains modern M1/BETA wording. Therefore these are **officially documented legacy rules, pending baseline-executable confirmation**, not proof that every paragraph matches retail 1.1. The help is particularly useful because topics preserve numeric rules omitted from the printed introduction. Topic filenames below resolve inside that extracted directory. Do not distribute extracted copyrighted help as remaster content.

**P2 — original printed manual:** [A Newcomers Guide](https://www.mocagh.org/miscgame/dejenol-manual.pdf), 25 scan pages, printed pages 1–40. Includes setting, town, magic, hazards, death. It is introductory, sometimes internally inconsistent, and not a complete rule specification. Parent research reserves most of its summary budget.

**S1 — secondary cross-check:** [CRPG Book review](https://crpgbook.wordpress.com/review-index/1995-mordor-depths-of-dejenol/) establishes 15 floors, 30×30 cells each; describes semi-automatic real-time combat with pausing. This description is a cross-check, not a timing/formula authority.

**S2 — independent legacy player testimony:** [x182ways FAQ, 2001](https://gamefaqs.gamespot.com/pc/567090-mordor-the-depths-of-dejenol/faqs/14802) explicitly uses full Mordor 1.1 and describes an automap that ceases to help when lost. It corroborates the return-to-city loop.

**Excluded rules sources:** [Dungeons of Dej'remake](https://github.com/matteo-prosperi/DungeonsOfDejremake) explicitly changes party structure, death, aging, banking, stat drain and quests. [Grimrock workshop adaptation](https://steamcommunity.com/sharedfiles/filedetails/?id=102289368) explicitly retains mainly names/layouts. Neither establishes original rules. Do not import Demise/Mordor II taverns, networking, expanded content or progression without direct evidence for Mordor 1.1.

## Documented baseline: combat and party

P1 `1wxgb3.htm`, **Encounters: Combat**: default rounds recur every **2 seconds**, including when the player has not acted. Fight, Defend, cast, open container, stop and escape are distinct actions. Four monster-group selectors exist; physical fighting targets one group. Defend raises Defense by **50%** while selected. Hostile monsters continue attacking a character who does nothing. Experience can become pinned at one point short of the following level threshold, requiring guild advancement before further accumulation.

P1 `14i_7ja.htm`, **Parties**: maximum **four player characters**; Good and Evil cannot coexist in a party. Recruitment requires co-location and a living character, with a special resurrection-acceptance route. Each member has an independent default combat command: none, fight, defend or spell buffer. Commands can be replaced during a round. XP goes to the character responsible for hits/kills/actions and is reduced for larger parties. Matching monster quests can receive credit from another member's or companion's kill. Gold is divided among survivors. Death removes a member and passes leadership to the next character; chest teleportation removes its opener. Ordinary movement may be commanded by any member. Party restoration on loading the leader is conditional on saved membership, co-location and survival.

**Implementation requirements, proposed:** preserve original action cadence, targeting and action-cost semantics while decoupling simulation from rendering. An explicit visible pause control is a presentation improvement; verify the original pause rules before allowing commands to execute, queue, or replace each other while paused. Never infer that “real time with pause” means turn-based initiative or action-RPG combat. A detailed result log should expose original results without adding advance knowledge of hidden outcomes. Modern party switching must always label whose action, inventory and statistics are shown.

**Not yet verified:** tick phase on entering a room; first-attack timing; initiative/order within a round; movement cost and escape chance; timer behavior during modal dialogs; auto-fight default for the selected baseline; damage/hit/critical/backstab formulas; XP party divisor, damage-vs-kill allocation and companion XP; rounding the 50% defense bonus; multi-swing ordering; remaining effects on a character removed from the party.

## Documented baseline: dungeon and mapping

S1: preserve all **15 × 30 × 30 = 13,500 cell positions**, exact connectivity and room membership. Grid dimensions alone do not supply the map. No reviewed source has yet yielded an authoritative per-cell full-game manifest.

P1 `dki1c1.htm`, **The Dungeon**: room populations replenish over time. Fixed teleporters may cross floors; random teleporters remain on the same floor and split parties, without embedding victims in rock. Spell movement can embed characters in rock. Pits damage; chutes descend and cannot be climbed; levitation can fail over pits, and permits deliberate chute descent. Fog hides the view and impairs identification. Rotators randomize facing; other cells force a fixed facing. Water can drown heavily equipped nonlevitating characters. Quicksand damages and can lose items. Anti-Magic blocks casting but retains existing effects. Extinguish additionally removes existing spell effects. Stud cells usually produce stronger monsters. Cell properties may combine. Secret doors can be discovered by trying to move through the wall. Perception governs recognizing hazards.

P1 `ewtej8.htm`, **AutoMap**: discoveries are shared among characters in the same world. Perception affects map completeness; a weaker mapper cannot erase previously learned details. When lost, current location is not supplied. Returning to mapped territory or succeeding at perception can restore orientation. Only visited floors are accessible through the map UI.

P1 `3a4on6p.htm`, **Encounters: Monsters**: lairs can have exclusive inhabitants and unique drops. Lair encounters differ from ordinary wandering encounters. Retain those exact room associations and eligibility rules.

**Implementation requirements, proposed:** version every wall, door, secret door, solid-rock cell, floor flag, stair/chute/teleporter destination, room identity, encounter table and lair. Give every cell a stable `(level,x,y)` identity. Match original indexing and compass orientation in an imported map, including out-of-bounds behavior. An HD corridor renderer must be generated from these records, not remake layouts by eye. Support map zoom, notes and color-independent symbols, but do not reveal unvisited/undetected cells, true lost coordinates, secret doors, exact monster locations or route safety in faithful play. Retain the distinction between a discovered topology and a character's currently unknown position.

**Not yet verified:** exact full floor data; room boundaries; respawn schedules and offline-time behavior; encounter weighting; teleport destination distributions; perception probabilities; whether specific combinations override other hazards; drowning burden threshold; levitation-failure probability; quicksand loss eligibility; hazards on turn-in-place versus entering/staying; lair/stud randomization.

## Documented baseline: treasure and information

P1 `36mud0.htm`, **Encounters: Treasure**: chests and boxes differ in rewards. Trap-type certainty and disarm likelihood are separate estimates. Magically locked containers require Charm of Opening; unidentified ones cannot simply be opened. Combat opening takes rounds and increases exposure to attack. Trap intensity depends on the monster that set it. Documented trap types: Disease Spores, Poison Gas, Exploding Box, Fire Trap, Slime, Fate, Teleporter, Fear, Withering and Blackout. Withering adds **four weeks** to the opener's age. Teleporter relocates only the opener on the same floor and clears the trap. Fear removes the opener's companions. Blackout removes spell modifiers but preserves natural/equipment-derived abilities. Fire resistance does not eliminate all Fire Trap damage. Gold is shared by survivors; items may rarely appear outside containers.

P1 `zhdvci.htm`, **The Library**: world knowledge is shared and grows with identification; encountering something does not necessarily reveal its full record. Item records track discoveries and the last associated creature/time. Monster records can track last location/time. Full monster identification requires companion study or Holding & Confinement identification. Simulated other explorers can contribute knowledge and store inventory.

**Implementation requirements, proposed:** searchable modern records must filter unknown fields. Preserve uncertainty rather than displaying precise probabilities that legacy characters could not know. A separate spoiler-enabled reference viewer may be external to faithful play. Store ownership, discovery, full identification and item alignment knowledge as separate fields.

## Documented baseline: city, economy and guild flow

P1 `swkvkg.htm`, **The City**: return to town heals hits, restores spell points, cures poison/disease and heals companions; recovery advances age. This is not a free, time-neutral heal button.

P1 `swjne9.htm`, **The City: Bank**: stored gold/items are protected from dungeon loss but inaccessible there. City purchases can draw on carried and banked gold. Bank capacity is **40 items**. Three party operations distinguish pooling carried gold into one account, depositing each member's carried gold separately, and pooling all carried plus banked gold. Do not replace this with automatic banking.

P1 `irl356.htm`, **The City: Store**: retain buy, sell, identify, realign, combine and uncurse. Stock distinguishes unaligned/Good/Neutral/Evil variants and includes simulated explorer trade. Charge-bearing consumables can combine; selling may process charge chunks, with insufficient remnants not restocked. Rechargeable artifacts/weapons can be sold and repurchased refreshed; consumables cannot. Item-use eligibility depends on guild, level and stats. City service payment can fall back to the bank. No universal flat “half price” formula should be inferred for every transaction without checking original data.

P1 `6m9o_0i.htm`, **Holding & Confinement**: companion trade has alignment-specific stock and simulated explorer turnover. Bought creatures have bindings. Identify, realign and bind services are separate. Realignment may kill the creature. Voluntary companions cannot be rebound. Selling removes a bound/hostile companion without the risk of dismissing it into an attack.

P1 `1f6.qsp.htm`, **The City: Seer**: repeated paid attempts locate characters, monsters or items; deep targets are harder. A monster/item search requires its name and may supply an approximate region or carrier category rather than a precise cell. Preserve its economy and uncertain answer quality.

P1 `3.id7m5.htm`, **The City: Guilds**: only the current guild earns XP. Guild changes occur in town and are blocked by cursed/opposed equipment. Advancement requires XP, fees and outstanding quests. Monster quests clear on qualifying kills; item quests surrender an item at advancement. Quest forfeiture requires pinning and demotes levels with associated losses. Preserve guild logs and library access. Exact progression data belongs in the character/guild appendix.

**Implementation requirements, proposed:** model every operation as an atomic ledger transaction with original fee/rounding rules, stock effects and ownership changes. Confirm previewed fees before commitment where legacy already made a purchase choice; avoiding accidental UI clicks is acceptable, refunding adverse rolled outcomes is not. Retain the preparation-return-training loop, differing carried/banked resources, quest roadblocks and aging costs.

**Not yet verified:** all fee formulas, stock refresh algorithms, sale rounding/chunk sizes, charge caps, town healing-time formula, bank capacity in chosen executable, guild fee fallback order, quest item alignment/charge requirements, automatic-spawned explorer intervals and exact effect on discoveries/economy.

## Documented baseline: companions

P1 `1n4gm2b.htm`, **Companions**: each character can have **four**. They retain attacks and special abilities, can take treasure, and can accidentally attack other party members or their companions. Only the owner heals/resurrects them; direct character-to-character trading is unavailable. Binding depends on spell and character strength, weakens, and necessarily breaks at zero. Injury worsens stability. Voluntary joiners cannot be rebound and do not attack on leaving. Bound creatures may revolt, sometimes bringing other weakly bound companions; opposite alignment guarantees attack after escape according to this topic. Position ordering and names are editable. One spellcasting companion can cast each round, but the help does not explicitly disambiguate whether this limit is per owner or entire party.

**Implementation requirements, proposed:** preserve recruited monster identity and numeric record; never convert it into a generic pet class. Keep its current HP, alignment, voluntary/bound state, binding, ordering and identification. Give the player readable binding/injury warnings within legacy knowledge limits; do not add immunity to betrayal or friendly fire. Do not turn the help's suggested six-body total into a hard six-body party cap.

**Not yet verified:** charm/bind formulas and caps; tick-based bind decay; exact friendly-fire probability/target selection; treasure cut; companion healing/death costs; caster arbitration; breath/spell availability after charming; capacity overflow; spell failure effects; voluntary loyalty distribution; companion combat XP/level changes, if any.

## Documented baseline: death, recovery and age

P1 `1.hflff.htm`, **Dying**: recovery routes include another character's spell, transporting a body to the morgue, or rescue. Waiting for rescue ages the victim, potentially substantially in deep floors. Resurrection can fail or produce complications that reduce stats/life; relative racial age affects complication risk. Stoning differs from rock entombment. Rocked bodies require Retrieve Soul, then Resurrect; complications are inevitable according to the help. Old age can kill; age-reducing items exist. Exchanging possessions with a dead character requires co-location.

P1 `18q40y4.htm`, **The City: Morgue**: paid resurrection commonly costs constitution. It can restore companions and stoned characters but cannot extract a rocked character. Hired recovery depends on depth and supplied coordinates, and costs money even when unsuccessful.

P1 `24fcus.htm`, **Monster Attacks**: poison/disease periodically lose HP; constitution aids recovery from poison/paralysis. Paralysis prevents fighting and leaving and removes movement-related defense. The topic says stoning restoration always costs one constitution, while aging attacks can add up to five years. Theft affects carried, not equipped, items; destruction can affect either. Banked possessions remain safe. Drain may affect statistics or HP.

**Implementation requirements, proposed:** implement distinct living, dead, stoned, rocked, retrieved, carried and awaiting-raise states wherever supported by baseline traces. Do not replace corpse recovery with instant town respawn or waive permanent stat loss. Maintain available rescuer characters independently of the active party. Explain consequence and raise probability without converting uncertainty into guaranteed success. A casualty must survive save/load in its exact state, position and ownership relationships.

**Not yet verified:** death HP boundary; constitution loss chance; exact rise-success/complication algorithms; permissible spell for each death subtype; age rate and maximum-age hazard curve; age attack interval/range; resurrection age costs; fate outcomes; recovery wait distribution; body weight/slot effects; retirement/permanent-death possessions. Do not treat narrative statements as formulas.

## Documented baseline: shared world and persistence

P1 `zkj5q5.htm`, **Game Overview**: character interaction requires a shared room/town/party. A non-running character stays at its last location. Events persist through automatic saving; loading a pre-death save is not a normal game operation. Minimizing the main window pauses **all events**, including poison.

P1 `xp.y1d.htm`, **Game Options**: the legacy No AutoSave setting retains city/death saves; backup files serve recovery rather than normal undo. Audio/visual window settings are independent preferences.

P1 `controlpanel.htm`, **Control Panel**: a Hide option prevents other characters from carrying the character. Retain comparable roster privacy/control if supporting the original shared local roster.

**Implementation requirements, proposed:** retain a single persistent world with independent roster characters, shared mapping/library/merchant stock, and corpses. Autosave atomically with versioned schema, checksums and crash-recovery journals. Cloud synchronization, if added, must lock/merge an entire consistent world rather than independently merging inventory and gold. Accessibility pause and application suspend should stop the whole simulation. Do not add offline death, online multiplayer, arbitrary checkpoints or per-character private loot as incidental “modernization.” Engineering backups must not become a routine rewind feature in faithful mode.

## Endgame and scope

Preserve the original open-ended progression/exploration structure, full dungeon and final adversary rather than inventing a campaign ending, seasonal reset or postgame difficulty scaling. The original story identifies a Prince of Devils objective (P2 printed p.3); the exact final encounter, recognition/log entry/reward and repeatability remain subject to original-data and executable verification. Original guild levels can extend to 999 (P2 printed p.37); that is a progression cap, not proof of an intended required character level for the final encounter.

## Material conflicts and research blockers

1. **Printed spell flags contain errors:** printed Teleport says noncombat although its description includes combat use; official help `lseg3e.htm` explicitly supports both. Printed Domination labels a combat charm while surrounding text calls it rebinding; `606j74.htm` treats it as rebinding. Baseline behavior and data must decide.
2. **Rock recovery guild mismatch:** printed town prose attributes extraction only to a Mage; spell table includes Seeker too. Do not derive guild access from narrative description.
3. **Age attack discrepancy:** printed narrative suggests twenty-year aging encounters; official help says up to five years per attack. Multiple attacks may explain this, but that is an inference, not a resolved formula.
4. **Modern help contamination:** CHM title and selected paragraphs are updated to M1; Commands contains a BETA warning. Use original 1.1 executable/data and original HLP before certifying full equivalence.
5. **Community scope contamination:** some Fandom monster pages explicitly include Mordor 2 addenda. Copying complete wiki pages into data would contaminate the baseline.
6. No verified full commercial map or all formula/encounter/RNG records obtained in this research branch. “Every aspect” must mean a complete preservation contract plus explicit evidence backlog, not fabricated exact values.

## Proposed acceptance scenarios

These are new verification requirements, not claims about tests already run.

| Scenario | Evidence the remaster must match |
|---|---|
| Idle versus defend during identical combat | Tick times, action cost, target, defense multiplier/rounding, damage and hostile actions |
| Pause while poisoned and in combat | No HP, age, bind, spawn, stock or round-clock advancement; resume without catch-up attacks |
| Solo and two-/four-character combat | Contribution XP, party reduction, quest credit, survivor gold share, action defaults |
| Random floor teleporter and chest teleporter | Correct same-floor destinations, party separation, leadership and trap persistence |
| Known, unknown and lost map traversal | Shared reveal, perception details and suppressed location without knowledge leakage |
| Anti-Magic versus Extinguish versus Blackout | Correct cast eligibility and spell/natural/equipment modifier retention |
| Levitation over pit/chute/water/quicksand | Original failure chance, optional descent, damage, drowning and loss rules |
| Companion betrayal and mixed-owner combat | Binding threshold, escape/attack results, friendly fire, target legality and caster arbitration |
| Voluntary companion rebind/heal/transfer attempts | Exact legal/illegal operations, ownership checks and loyalty effects |
| Store consumable chunks and artifact recharge | Charges, stock, alignment, fees and cash/bank debits preserved exactly |
| Party pooling and 40-item storage | Same account ownership, capacities and over-capacity rejection without duplication |
| Normal death, stoning and rock entombment | Correct body/retrieval/spell transitions, aging, fees, constitution and complication outcomes |
| Save and crash after death/trade/charm/quest turn-in | Transaction commits once; no duplicate loot, revived corpse or lost ownership |
| Final encounter and continued exploration | Exact spawn, victory record/reward, repeatability and continued world behavior |

For stochastic cases compare seeded event traces if the original RNG can be instrumented; otherwise predefine sample sizes, confidence intervals and acceptable distribution tolerances. Presentation equality does not establish numerical fidelity. Any unresolved item is a release-blocking fidelity task, not permission to choose a convenient approximation.
