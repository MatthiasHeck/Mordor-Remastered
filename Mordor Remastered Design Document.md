# Mordor The Depths of Dejenol Remastered

## Game design and preservation specification

**Document version:** 1.3 · **Research date:** October 9, 2026 · **Scope:** a faithful remaster of David Allen’s 1995 game.

**Revision 1.3:** a further pass through the supplied original decompilation traces shop charge bundles, combining and uncurse behavior, companion services, hired and waiting rescue, pending raises, recovery penalties, town healing and timer guards. It adds source-linked algorithms and runtime fixtures, and records new discrepancies in inventory indexing, timing and suspicious recovery/ailment branches. These are static interpretations, not passed original-game tests. See the [follow-up review and source anchors](research/original-followup-review.md) and section 26.13. Original files and prior numerical exports remain unchanged.

**Revision 1.2:** the supplied original files add a fingerprinted local baseline, 105 spell records, complete fifteen-floor cell data, race creation pools, and static evidence for HP growth, healing, spell access, item use and payment rules. Original-file exports remain separate from earlier printed/help tables. See the [original-file review and source anchors](research/local-original-review.md) and section 26.12. The supplied `Mordor` folder is read-only; all new work is in `Mordor Remastered`.

**Revision 1.1:** a second internet research pass expands character growth, spell arbitration, item rules, shop transactions, and fidelity tests. The supplied DungeonsOfDejremake project is pinned to a specific revision and evaluated as a comparison source. Its intentional rules changes are excluded. See the [review and evidence record](research/second-pass-review.md).

The remaster should reproduce the original game’s character development, dungeon, enemies, equipment, spells, economy, discoveries, and consequences, while rebuilding its presentation and software for modern computers. A familiar strategy must work for the same reasons, an original danger must remain dangerous, and a numerical advantage must not appear merely because the renderer or interface changed.

This is a comprehensive design specification, accompanied by research notes and numerical reference tables. It is **not yet a certified, exhaustive dump of a particular retail executable’s data**. Printed documentation, later official help, and community references contain disagreements. Exact behavioral parity requires a fingerprinted original build and the validation work defined here. Unresolved values are explicitly marked; they are not permission to invent replacements.

### Reading the specification

- **Preserve** identifies a required property of the remaster. Where exact original behavior is unresolved, the requirement is to establish and reproduce it.
- **Documented** means supported by original documentation. It does not imply an executable comparison has been performed.
- **Extracted file fact** means read from a fingerprinted original data file. It establishes a stored value, not its complete runtime interpretation.
- **Static decompiler evidence** means inferred from the supplied decompilation attempts. Generated symbols and damaged statements remain; this is not certified authored source or executed behavior.
- **Community evidence** identifies a useful secondary reference that needs checking against the selected build.
- **Proposed** identifies a new presentation, tooling, or engineering decision, not a claim about the 1995 implementation.
- **Validation required** identifies an unresolved rule, number, source conflict, or implementation detail that blocks a claim of exact fidelity.

The numeric appendices and research files form part of this specification. Sample records illustrate the required fidelity; they must never be mistaken for the complete production database.

### Contents

1. Product identity and historical baseline
2. Fidelity contract and change policy
3. Player experience and game loop
4. Characters and statistics
5. Races and alignment
6. Guilds and progression
7. Parties and companions
8. Combat and simulation time
9. Magic and status effects
10. Dungeon and exploration
11. Monsters and encounters
12. Items and equipment
13. Treasure and economy
14. Town services and guild quests
15. Death recovery and aging
16. Discovery and information design
17. Interface and controls
18. Art direction and animation
19. Audio direction
20. Accessibility and onboarding
21. Saves and compatibility
22. Software and data architecture
23. Fidelity verification
24. Production scope and milestones
25. Release criteria and open decisions
26. Numerical reference appendices
27. Sources and supporting files

## 1 Product identity and historical baseline

**Working title:** Mordor The Depths of Dejenol Remastered. The original title is *Mordor*. The project folder is now **Mordor Remastered**; document and research links are relative so the package remains portable.

**Genre and audience:** a single-player, first-person, grid-based dungeon role-playing game built around repeat expeditions and long-term character development. Returning players should recognize their builds, routes, risks, and discoveries. New players should be able to understand those systems without fighting a Windows 3.x interface.

David Allen identifies the original as his 1995 release. The current official product page describes Mordor 1.1 and confirms nine character races, twelve guilds, real-time combat, and automapping. This remaster targets **the original Mordor 1 rules**, not Mordor II, Demise, or the rule changes of later fan remakes. [Creator’s history](https://requnix.com/development/mordor/), [official product page](https://www.decklinsdemise.com/mordor.htm).

**Proposed reference edition:** the full registered English Mordor 1.1 release, with its executable and data files hashed before implementation. “1995” identifies the game; it does not establish that every surviving 1.1 distribution is byte-identical to the first retail release. Preserve a version manifest and compare release notes before freezing the baseline. An original 1995 retail copy supplied later may supersede this proposed reference through an explicit documented decision.

**Local baseline candidate now available:** the supplied installed copies have identical executables, version-1.1 data headers and all fifteen map floors. Their executable, help and key static data also match members of the local installer archive. EXE SHA256 is `bd1332c37eb9d6a024d95ba1b70daf03c1a6c64c622964fb3d8bcc6297d06309`. The [local review](research/local-original-review.md) records all hashes and comparisons. This establishes consistent local inputs; registered-distribution identity, linkage of the supplied decompiler output to the executable, and runtime parity remain verification gates.

**World premise:** Marlith stands above the ancient mines of Dejenol. Adventurers descend into a dangerous underground world, accumulate knowledge and wealth, and confront the threat associated with the Prince of Devils. Keep that setting and its original names; present the story through concise town text, the library, and discoveries rather than a new cinematic campaign. [Original newcomer’s manual](https://www.mocagh.org/miscgame/dejenol-manual.pdf).

**Content envelope:** preserve the fifteen-level full dungeon. Public references report 400 monster types and 366 items, but those counts are reconciliation targets until the selected retail files establish usable records, reserved entries, and variants. The production inventory must also enumerate all spells, guild spell assignments, maps, rooms, quests, portraits, audio cues, and text. [MobyGames overview](https://www.mobygames.com/game/31910/mordor-the-depths-of-dejenol/).

**Proposed platform scope:** desktop Windows first, entirely playable offline. Keep the simulation portable for subsequent macOS and Linux builds. Keyboard and mouse are the primary controls; controller support is a second complete interaction path. Mobile, multiplayer, a browser edition, and a console port are separate projects, not assumptions that may reshape the base game.

## 2 Fidelity contract and change policy

### 2.1 What must remain identical

Preserve all original numerical inputs and their interpretation: race minima and maxima, starting resources, resistance scales, guild restrictions and growth, spell costs and effects, monster records, equipment restrictions, item powers, shop calculations, encounter distributions, map topology, and loss and recovery rules. Preserve integer rounding, bounds, overflow-sensitive behavior, and random draw ordering wherever they affect outcomes.

Preserve the relationships between systems. A character’s active guild cannot become interchangeable with its highest guild. An identified item cannot become equivalent to an unidentified one. A lost party cannot gain accurate coordinates through a redesigned minimap. A companion cannot become a permanent, perfectly obedient pet because that is easier to explain.

Fidelity includes effort and information. Faster window drawing is desirable; an automatic best-action system that removes a risky decision changes play. A higher-resolution corridor is desirable; lighting that reveals a secret door does not preserve the same dungeon.

### 2.2 What may change

**Proposed presentation changes:** high-resolution artwork, scalable text, clearer hierarchy, accessible input bindings, tooltips explaining already-available information, resizable panels, coherent sound mixing, better installation, and reliable saving. All feed the same underlying rule implementation.

Use one authoritative ruleset for the release. Optional original-style and remastered presentation profiles may share saves because they do not change simulation. A later rebalance or convenience mode must use a separate ruleset identifier and an explicit description of its differences; it is outside this design’s launch scope.

| Change | Launch decision | Reason |
| --- | --- | --- |
| Scale fonts and reorganize panels | Include | Makes existing information readable |
| Remap a single original action | Include | Improves access without combining decisions |
| Replace artwork and record new audio | Include subject to asset rights | Presentation can change while content identity remains |
| Reduce grind or increase drop rates | Exclude | Changes progression and scarcity |
| Remove aging or permanent losses | Exclude | Changes expedition and recovery decisions |
| Automatically bank gold | Exclude | Changes carried wealth and theft exposure |
| Reveal full maps or hidden monster statistics | Exclude from normal play | Changes discovery and risk |
| Add fast travel or guaranteed safe teleportation | Exclude | Changes dungeon traversal |
| Add automatic party tactics | Exclude unless original behavior supports the exact action | Changes player control and resource use |
| Fix a crash without changing the resulting valid game state | Include | Improves reliability |
| Fix a balance-affecting legacy defect | Decision record required | A correction may break a known original strategy |

### 2.3 Resolving disagreements

Use a controlled evidence order: behavior in the fingerprinted reference build; that build’s data files; documentation shipped with that build; other original printed material; later official help; independently corroborated community analysis; other remakes. The first two answer different questions: a stored value establishes a parameter, while executable observation establishes how it is used. Record both when they disagree.

Every disputed rule gets an issue with the competing values, source editions, an original-game reproduction procedure, the result, and a decision. Do not silently select a wiki’s convenient number or normalize an apparently inconsistent table. The research already identifies conflicting alignment permissions and quest probabilities; these are explicit validation tasks in section 25.

### 2.4 Using another remake as research

The user-supplied [DungeonsOfDejremake project](https://github.com/matteo-prosperi/DungeonsOfDejremake/tree/c932f12ec163693e120a4dc236610619f6af96ab) was reviewed at commit `c932f12ec163693e120a4dc236610619f6af96ab`. Its public repository supplies documentation and distribution material; its README states that the game implementation source is unpublished. This document therefore makes no claim to have audited that engine's equations or tests.

Treat technical details as leads with three possible outcomes: corroborated documentation, an unresolved hypothesis, or a known departure. Do not port a rule merely because a remake describes itself as faithful. This review specifically excludes deterministic HP reconstruction, universal best-guild healing, automated buff maintenance, Tank stance, guaranteed revival, and a Seer-linked encounter escalation. The source comparisons and qualifications are in the [second-pass review](research/second-pass-review.md).

## 3 Player experience and game loop

### 3.1 Core loop

Create and develop a roster; assemble a party; choose equipment, guilds, spells, companions, and carried resources in town; enter the dungeon; navigate and fight; identify opportunities and hazards; acquire treasure and knowledge; decide when to return; use town services; advance; prepare a deeper or more specialized expedition.

The repeated question is whether one more room is worth the exposure. Preserve the tension between potential rewards and depleted resources, uncertain encounters, inventory pressure, curses, status effects, and the prospect of recovering a fallen party.

### 3.2 Short and long objectives

A short session might map a passage, complete a guild requirement, earn training money, replace lost equipment, or rescue a character. Longer goals include building complementary guild histories, learning safe routes, improving the shared knowledge base, collecting rare equipment, and reaching the deepest encounters. Do not impose a new main-quest checklist that makes these player-selected goals subordinate to a scripted campaign.

**Proposed opening experience:** show the roster and character creation, then the town. Offer a skippable explanation of guilds, buying equipment, selecting the party, and entering the dungeon. The first real expedition uses the original starting state, encounter tables, and map. Any practice tutorial runs in a separate disposable scenario and transfers no rewards or information into the campaign.

### 3.3 Experience targets

The remaster should feel deliberate, tense, readable, and worth mastering. It must allow inefficient builds and ambitious expeditions. Present consequences clearly when the original makes them knowable, but avoid recommending an objectively optimal party or disclosing probabilities that were hidden. A guide can explain a mechanic without solving the game for the player.

## 4 Characters and statistics

### 4.1 Character record

Persist identity, name, race, original sex field and any validated mechanical effect, alignment, age, status, location and facing, current and maximum hit points, current and maximum spell points, carried gold, bank holdings, inventory, equipment, companions, all guild memberships, active guild, per-guild level and experience, quests, and relevant discoveries. Preserve any additional original fields discovered during format analysis; do not drop fields simply because the new interface does not display them.

The six core statistics are **Strength, Intelligence, Wisdom, Constitution, Charisma, and Dexterity**. Keep separate natural values, equipment or temporary modifiers, and effective values. The character sheet should expose those distinctions with the original units. Requirements must read the correct value layer for each action. [Original reference card](https://www.mocagh.org/miscgame/dejenol-refcard.pdf), [community guild reference](https://dejenol.fandom.com/wiki/Guild).

### 4.2 Statistic behavior

**Preserve:** every dependency of the six statistics, including equipment eligibility, guild entry, spell use, attack and defense contributions, identification, companion control, hit-point growth, and resource limits wherever the selected build applies them. These relationships must be recovered individually; do not replace them with a modern RPG’s conventional attribute meanings.

**Proposed UI:** each statistic has a short explanatory tooltip listing verified effects. The tooltip may explain that a statistic contributes to a calculation without publishing a hidden equation. A requirements comparison highlights which currently known conditions fail. A player may inspect a natural value and an effective value without having to infer the difference from color.

Stat increases and decreases are explicit transactions. Store their cause, before/after value, cap behavior, and any follow-on recalculation. Test permanent gains, temporary gains, cursed or opposed-alignment effects, draining, resurrection-related loss, and removal of the equipment that supplied a requirement. No town visit automatically restores permanent losses.

### 4.3 Derived values

Attack and defense are calculated outputs, not replacement character attributes. Preserve all component calculations and the way they combine. Track maximum HP separately from current HP; likewise spell-point capacity versus remaining points. Regeneration, healing, maximum-resource changes, and leveling must not share a generic “restore all” helper unless their original behavior is identical.

The stat sheet may show verified component breakdowns to the extent the original exposed them. Keep internal debug formulas in development tools. The public interface must not infer or display a monster’s hidden counterpart values from the player’s combat log.

### 4.4 Character creation and roster

Preserve race and alignment choices, starting age, initial stat procedure and allocation constraints, starting money and equipment, starting guild membership, and naming restrictions that affect saved data. **Static decompiler evidence:** each stat initializes at racial minimum + 5, with an additional race-specific pool; subtracting down to the minimum refunds points. The pools are in section 26.12. Creation sets age to 5,840 days, carried gold to 1,500, bank balance to zero, current/maximum HP to 15, Nomad level to 1 and active guild to Nomad. It stores town floor 0 and coordinates 9,11; raw A/D starts at 10 each before stat adjustment. Names reject duplicates and `|`; unused allocation points require confirmation. These are source-derived targets for original-build comparison. Starter equipment, roster limits and any sex-dependent behavior still require tracing. [Creation evidence](research/local-original-review.md).

**Proposed presentation:** a single creation screen with identity on the left, six statistics in the center, and eligible guilds on the right. Invalid combinations explain the failed requirement. Confirmation shows the complete proposed record before creation. Roster selection displays living, dead, stoned, and otherwise unavailable characters distinctly, without moving them or restoring them.

### 4.5 Derived statistics supported by static code

The supplied decompiled `Module6.fn1338` supports maximum SP of `5 × (natural INT + natural WIS)`. `sub047C` supports STR/DEX contributions to both attack and defense outside an inclusive neutral band of 8–12 at two points per stat point, and INT/WIS contributions outside 8–14 at one point per stat point. Below the band the contribution is negative; above it positive. This adjustment uses natural plus modified stats and has no CON/CHA contribution. It removes the old contribution before adding the new one. These rules now have **static decompiler support**, rather than only the comparison remake's account; the complete A/D total still includes other routines. [Original-file evidence and function anchors](research/local-original-review.md).

For SP, measure natural INT/WIS changes separately from equipment bonuses, temporary effects, and permanent drain. For A/D, test each statistic independently at 7, 8, 12, 13, 14, and 15 where legally reachable, then vary guild and equipment contributions. Record attack and defense separately. For creation, capture the initial allocation, remaining pool, adjustment bounds, starting HP/SP, age, gold, and inventory for every race. A match at one ordinary character does not establish either formula or boundary behavior.

Store extracted inputs, static interpretations, observations and approved rules separately. The earlier printed race/guild tables remain source transcriptions; the new local tables record binary values independently. Do not import the comparison remake's starter equipment or assume sex is cosmetic without original evidence.

## 5 Races and alignment

Preserve all nine races: Human, Elf, Giant, Gnome, Dwarf, Ogre, Morloch, Osiri, and Troll. Keep the original race names rather than replacing unfamiliar names with generic fantasy equivalents. The numerical race appendix records the printed minima, natural maxima, age parameters, experience parameters, and resistance entries with provenance.

Race influences allowed development and endurance; it is not merely a portrait choice. Do not equalize total stat budgets, progression speed, longevity, or resistance profiles. The differences and the constraints they impose are part of party planning.

Keep Good, Neutral, and Evil as rule-bearing alignments. Preserve their effects on creation, guild access, item use and alignment, companions, and any party restrictions established by the build. Do not turn alignment into a dialogue reputation meter. **Validation required:** whether and how an existing character can change alignment, and all consequences of such a change.

The printed and community tables disagree on some allowed alignments. The appendix therefore records what each source says rather than presenting one merged table as executable truth. Selection widgets must be generated from the approved rules dataset only after those conflicts are resolved.

**Acceptance:** enumerate every race, alignment, and guild combination; compare acceptance and rejection against the original. Repeat with statistics just below and at each requirement and with a temporary modifier crossing that requirement. Test racial caps through ordinary gains, special items, and removals of equipment.

## 6 Guilds and progression

### 6.1 Complete guild set

Preserve Nomad, Warrior, Paladin, Ninja, Villain, Seeker, Thief, Scavenger, Mage, Sorcerer, Wizard, and Healer. None becomes a cosmetic subclass, and no new class replaces the need to combine guild histories. Their numeric entry requirements and documented growth parameters appear in the appendices.

**Community evidence:** guilds maintain separate progression; only the active guild earns experience, while learned capabilities can carry across memberships. Guild entry begins at level 1; the documented community cap is 999. Advancement can be blocked by a guild quest, and experience can become pinned before earning another full level. Treat these as explicit executable comparison cases. [Guild reference](https://dejenol.fandom.com/wiki/Guild).

### 6.2 Guild identity

Use the following as production emphasis, not as permission to alter numeric balance. Warriors emphasize physical combat; Ninjas combine weapon and unarmed options with specialized restrictions; Thieves specialize in treasure access; Scavengers combine fighting and thieving; Seekers provide exploration capabilities; Mages center companion control; Sorcerers emphasize destructive magic; Healers center recovery; Wizards provide a broad magical toolkit; Paladins and Villains have distinct restricted hybrid paths; Nomad supplies the starting path. The exact abilities and their growth remain data-driven. Individual guild references are listed in section 27.

### 6.3 Growth and cross-guild interactions

Store one membership record per guild: current level, experience, training state, quest state, and all original membership-specific fields. Resolve inherited capabilities per ability; do not sum every guild’s attack, defense, or skill rating. Keep spell access, spell power, equipment permissions, and HP growth as separate decisions.

**Community evidence:** HP gains depend on whether the new guild level exceeds the character’s other guild levels, with guild-specific breakpoints. [Nomad](https://dejenol.fandom.com/wiki/Nomad), [Warrior](https://dejenol.fandom.com/wiki/Warrior), [Wizard](https://dejenol.fandom.com/wiki/Wizard). **Static code now narrows this:** AH is not a guaranteed fixed total gain. The supplied advancement routine includes a random AH increment and a strict CON boundary, detailed in section 6.6. Implementing a fixed five-point Nomad gain before level 30 would omit that increment.

**Preserve:** XP calculation, party sharing, race and guild modifiers, training costs, experience pinning, quest assignment and completion, titles, maximum levels, HP breakpoints, Constitution bonus distributions, and the treatment of drained levels if supported. Keep raw parameters separate from percentages shown to players; a source’s “experience factor” is not necessarily a literal multiplier.

**Proposed guild screen:** show membership, level, XP progress, training eligibility, active quest, known abilities, and the consequences of making that guild active. Switching must apply the original equipment and eligibility rules atomically. A progress bar must distinguish “needs experience,” “needs quest,” and “ready to train” rather than implying XP is the only requirement.

### 6.4 Acceptance

Compare the original and remaster at every HP-growth breakpoint, at tied guild levels, at one level above the previous highest guild, at the XP pin threshold, and at the maximum level. Test free versus paid membership, quest-blocked training, equipment invalidated by a guild switch, and the same spell learned through multiple guilds. Verify that a heavily developed character changing to a new guild neither loses inherited abilities nor receives them twice.

### 6.5 Preserve earned HP and advancement history

The comparison remake explicitly replaces progression history with a deterministic HP total computed from current guild levels and CON. That changes development strategy and is excluded. [Comparison Guild Hall documentation](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/guild-hall.md).

**Later official help documents:** HP advancement is gated by the new level exceeding other guild levels, with AH/ML/MH parameters and a CON bonus above 16 before the applicable breakpoint. Its Healer/Thief example withholds HP until Healer overtakes Thief. It does not fully specify distributions or every boundary. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `d7eivm.htm` and `81ywhd.htm`.

**Proposed persistence:** retain accumulated maximum HP and the original-supported effects that changed it. Development traces record guild, old/new level, CON used, random draws where observable, awarded HP, and resulting maximum. Do not recompute historical HP when loading, switching guilds, changing CON, forfeiting a quest, or importing a character unless that particular operation is proven to do so in the reference build. The trace is a verification aid, not a new gameplay statistic or a requirement that legacy saves contain history.

Compare two legal advancement sequences reaching the same final guild levels, plus early versus late permanent CON increases. Separately test equipment CON, ties, overtaking, demotion and regaining a level. Preserve differences the original produces; do not equalize the characters as a migration convenience.

### 6.6 Source-derived HP advancement algorithm

The supplied `FRMCTYG.cmdMake_Click` supports the following sequence. Treat each random draw as distinct and retain the original numerical conversions. Let N be the new guild level; AH, ML and MH are the exported guild parameters.

1. Award maximum-HP growth only when N strictly exceeds every other guild level.
2. When N > ML, add MH.
3. Otherwise add AH, and draw `floor(U × 3) + 1`. Results 1 or 2 add `floor(U × AH / 5) + 1` with a further draw; result 3 adds no random increment.
4. In that latter branch, natural CON above 16 adds `floor(U × (CON − 16)) + 1` only if **N < ML**. The random AH increment still applies at N = ML; the CON increment does not.
5. Cap maximum HP at **999** and set current HP to maximum after training, including advancement without maximum-HP growth.

This is a static interpretation awaiting executable checks, not a statistical test result. Verify ties, overtaking, ML−1/ML/ML+1, CON 16/17, equipment-only CON and HP 998/999. Preserve the random draw count and historical gains. [Code locations and interpretation](research/local-original-review.md).

## 7 Parties and companions

### 7.1 Player characters

Preserve parties of up to four controlled adventurers, together with each character’s independent identity and progression. A party is not one hero plus three AI followers. Preserve formation, leader selection, joining and leaving, regrouping, separated characters, transfers, target selection, and the distinction between a party location and each persistent character’s state. The original manual’s party guidance and the later remake’s explicit departure from the four-slot model corroborate this structure. [Original manual](https://www.mocagh.org/miscgame/dejenol-manual.pdf), [comparison project describing its changes](https://github.com/matteo-prosperi/DungeonsOfDejremake).

**Later official help documents:** Good and Evil characters cannot join the same party; members have individual default commands, including fighting, defending, and a spell buffer. Contributions affect XP, larger parties reduce it, and surviving members share gold. Preserve those action defaults instead of replacing them with a new tactics AI. **Validation required:** exact formation effects, XP division, initiative, and targeting. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `14i_7ja.htm`, Parties.

### 7.2 Monster companions

Keep monster companions as a separate system from player-character slots. Import their original capacity, ownership, stacking or group behavior, binding values, obedience checks, combat participation, healing, transfer rules, dismissal, death, escape, and sale eligibility. A charmed monster must remain the original monster, including the ways its companion behavior differs from its hostile behavior.

**Later official help documents:** four companions per character, binding that can expire, betrayal and accidental attacks on other party members, owner-only healing, and no direct companion trading. Voluntary joiners differ from bound creatures. It also describes one spellcasting companion casting per round; whether that limit is per owner or party needs testing. Preserve these constraints and the town’s companion economy. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `1n4gm2b.htm`, Companions.

**Proposed display:** a compact companion panel under its owner, showing information that character legitimately knows. Show binding or loyalty using the original numeric scale where exposed. Make warnings persistent and readable without introducing advance knowledge of the next obedience roll.

### 7.3 Acceptance

Test solo, two-, three-, and four-character parties; every party slot as leader; an incapacitated leader; mixed living and dead members; full companion capacity; a charm attempt at capacity; companion escape mid-encounter; ownership transfers; and party dissolution after a total defeat. Verify how XP and treasure are allocated in each case.

### 7.4 Companion purchase, binding and revival

**Static decompiler evidence:** Holding and Confinement purchases scan four slots, reject a full roster before payment, start the creature at its base HP and full identification, and set binding to `min(10, 5 + monster first-level field)`. Paid binding raises the current value by four to a maximum of twelve. Negative binding identifies a voluntary companion that the UI refuses to bind; retain the sign in storage. These purchase/service rules do not define obedience or the binding produced by spells.

Companion raising is a separate Morgue transaction. Its source-derived fee is `max HP × 1244.34 × monster first-level field`, assigned to a VB Long. After payment, failure occurs when `Int(Rnd × 100) > min(98, 75 + monster CON)`: failure removes the companion identity, success restores maximum HP. Preserve the strict comparison and loss outcome; a threshold of 98 accepts 99 of the 100 possible integer roll values, so it must not be simplified to a nominal 98% roll. Verify conversion and RNG behavior before certification. [Companion source paths and binding-price caveat](research/original-followup-review.md).

## 8 Combat and simulation time

### 8.1 Combat model

Preserve the original real-time combat model. Do not redesign it into turn-based initiative, action combat, or a timer that advances only on player input. The official product description explicitly calls out real-time action and combat. [Official product page](https://www.decklinsdemise.com/mordor.htm).

**Later official help documents:** a default combat round every two seconds, continued hostile action while the player is idle, and a Defend command that adds 50% to defense. Use these as documented comparison targets, with rounding and event order still unverified. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `1wxgb3.htm`, Encounters Combat.

The complete clock model remains a **validation requirement**: movement cadence, automatic attacks, manual commands, spell execution, enemy actions, status ticking, resource recovery, pause commands, modal windows, focus loss, and speed options must be measured. The original may mix action-triggered and timer-triggered work; do not force every subsystem into one assumed cadence.

**Proposed engineering:** use a simulation scheduler independent of display frame rate. Higher refresh rates, skipped animation, a resized window, or faster storage must not grant additional attacks. Rendering consumes state and events; it never decides damage or rolls for an encounter.

### 8.2 Encounter behavior

Preserve enemy groups, group sizes and placement, initial hostility, attack initiation, evasion, pursuit or disengagement rules, target selection, and the interaction of friendly encounters with alignment and companions. Preserve automatic physical attacks and manual actions exactly where the original supports them. An input buffer must not queue extra actions beyond the original’s accepted behavior.

### 8.3 Resolution requirements

The implementation must recover and test hit chance, physical damage, equipment penetration requirements, critical hits, backstabbing, multiple swings, resistances, special attacks, spell resistance, instant-kill handling, XP awards, and loot triggers. Do not substitute a generic dice model or approximate DPS curve. Two enemies with the same displayed attack and defense may differ through flags, spells, level, group behavior, or resistances.

Resolve effects in the original order. A thief stealing and fleeing, a monster destroying an item, a character dying before a scheduled spell, or an enemy being charmed rather than killed can produce different subsequent state. Keep per-event logs in the test harness so a matching final HP total cannot conceal an incorrect event sequence.

### 8.4 Player feedback

**Proposed:** legible enemy group cards, clear active character and selected target, accessible HP/SP indicators, restrained hit flashes, and a scrollable combat log. New animation length is cosmetic. A shortened or disabled animation must produce the same commands and simulation events.

The log should report original-observable outcomes in plain language: misses, damage, status changes, failed spells, theft, destruction, companion actions, and deaths. It must not print hidden rolls, undiscovered monster resistances, or an enemy’s exact remaining health when the original would conceal them.

### 8.5 Timing and pause acceptance

Build a timing matrix for exploration, combat, inventory, spellbook, town, dialogs, minimization, focus loss, and suspend/resume. Record which clocks advance in the original. Match those results in the faithful profile. Accessibility features that require additional decision time must be labeled as separate assistance settings if they cannot reproduce an existing pause behavior. Do not claim they are mechanically identical.

### 8.6 Physical swing chaining and opening attacks

**Later official help documents:** an additional weapon or guild swing requires the preceding swing to kill its target. In its three-swing example, killing the first creature and only wounding the second prevents a third swing. A multiple-swing field must therefore not become a fixed number of attacks against a surviving enemy. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `5hmud3.htm` and `d7eivm.htm`.

Compare miss, nonlethal hit, lethal hit, immunity, critical kill, last target in a group, and last hostile group. Determine whether excess swings can cross groups and how guild and weapon contributions combine. The candidate item's `extra_swings` column is a parser label; validate whether the stored quantity is a total, an increment, or another parameter before adding it to anything.

The comparison project's approximately one-second combat interval and fixed player-first description cannot establish original behavior. Its own changelog describes a hostile opening-strike exception. Measure original surprise, peaceful-to-hostile transitions, and withdrawal independently. Section 8.7 now supplies independent original-source timer evidence to compare with the later-help two-second target. No new Tank action or aggro redirection enters the faithful rules. [Comparison dungeon guide](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/dungeon.md), [changelog](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/changelog.md).

### 8.7 Source timer initialization and minimized-window guards

**Static decompiler evidence:** dungeon initialization calls a routine assigning **1,000 ms** to the combat timer; its callback invokes the combat-round dispatcher. This creates a concrete discrepancy with the later-help two-second default, but does not alone establish the interval between successful attacks. Recover cooldowns, other dispatcher callers, state guards and original UI timer behavior before freezing the scheduler. F09 remains open.

Combat and ailment callbacks are separate and both skip work while a shared flag is set. The main-window resize handler sets that flag when minimized and clears it in the maximized branch. Treat minimize, restore-to-normal, restore-to-maximized, focus loss and modal dialogs as separate experiments. Do not infer universal focus-loss pause or the ailment cadence from the combat interval. [Timer call chain and source anchors](research/original-followup-review.md).

## 9 Magic and status effects

### 9.1 Spell model

Preserve each original spell’s identity, category, guild access, required spell level, stat requirements, SP cost calculation, power, targets, effect limits, resistances, duration, failure behavior, and experience or side effects. Preserve whether it acts on a character, companion, enemy, group, multiple groups, the party, a location, or an item.

Use a full spell-by-guild association table. The same named spell may be available at different levels or efficiencies through different guilds. A character’s spellbook is a view of learned access; the chosen casting capability must follow the original arbitration rule. Keep spell level distinct from guild level.

### 9.2 Spell families

Inventory every original category, including damage-producing magic, instant-kill effects, charm and binding, healing and condition cures, movement, banishment, dispelling, resistance and protection, visual effects, location, and magical utilities. Preserve original naming even where it would be counterintuitive in another RPG. Verify effects rather than inferring them from names such as Sleep or Poison. Community spell tables, for example, describe some apparently familiar status spells as kill effects. [Mage spellbook reference](https://dejenol.fandom.com/wiki/Mage), [Villain spellbook reference](https://dejenol.fandom.com/wiki/Villain).

### 9.3 Movement magic

Movement spells must respect original coordinate systems, facing, depth limits, destination constraints, random displacement, sanctuary state, and unsafe outcomes. Never clamp an invalid destination to a safe floor tile. If the original permits materializing in rock, retain the event and its recovery system. Preview only information the character could know; do not reveal hidden geometry through destination highlighting.

### 9.4 Conditions

Represent poison, disease, paralysis, stoning, aging, draining, invisibility, levitation, resistances, death, and other discovered states distinctly. Their stacks, potency, duration, cures, persistence, and interactions are independent rule definitions. An ordinary heal must not clear unrelated conditions. A revived character must not automatically receive a full cleanse or restored equipment.

For every condition specify entry triggers, eligibility and resistance checks, mutation, periodic work, expiry, removal actions, save representation, and display. Record whether a status is a counter, accumulated severity, absolute expiry, boolean, or a combination. Rendering an icon must not simplify a multi-valued condition to a boolean.

### 9.5 Spellbook and acceptance

**Proposed spellbook:** filter by category, known spell, target type, and current castability; retain the original ten spell/item buffers and per-character shortcuts. Show why a spell cannot be cast using known requirements. Preserve original default-command repetition, including supported spell-buffer behavior; add no intelligent fallback, extra automatic recasting, or resource-saving tactics.

Test minimum requirements and one below them, SP exactly equal to cost, zero eligible targets, empty groups, partial resistance, immunity, multiple-guild access, spell cancellation, overlapping buffs, saving during a timed effect, and casts immediately before death or movement. Verify costs on failures as well as successes.

### 9.6 Spell power, cost, and healing exceptions

Resolve spell eligibility, power, cost, context, target and resource consumption as separate decisions. The later official help describes the highest applicable learned **spell level** for power, the lowest available guild cost independently, and a separate rule for item casts. Raw guild level and spell level are not interchangeable. Fixed-level items must retain their fixed level; character-scaled item casts follow the verified item rule. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `14n5mvy.htm`.

**F16 now has static-code support:** the positive-power healing/cure branch in the supplied `Module6.fn1173` uses `floor(active guild level / 2 + 0.5)` when the explicit cast-level argument is non-positive; a positive argument overrides it. The spellbook supplies zero and direct item use supplies the item's level. This supports active-guild healing with a fixed-level item override, while leaving other effect families distinct. The [original-file review](research/local-original-review.md) records the branch, callers and healing equation. Runtime comparison is still required; the comparison remake's universal best-guild policy remains excluded.

Prepare one character with different levels in two healing-capable guilds. Keep stats, target injury, item, location and conditions fixed; change only the active guild. Compare SP cost and healing distributions separately, ensuring the recipient has enough missing HP to avoid clipping the result. Repeat with a fixed-level healing item and a character-scaled item. A full heal on a lightly injured target cannot distinguish competing power formulas.

Buff maintenance remains player-directed except for established original default commands. Automatic casting on dungeon entry or after Extinguish/Blackout would spend resources and remove decisions; it is excluded. Preserve Anti-Magic, Extinguish, and Blackout as distinct checks and mutations, including whether equipment-derived effects survive.

### 9.7 Healing and recovery effect contracts

Later publisher help distinguishes ordinary healing, ailment removal, and resurrection. These are separate effect types, not aliases of a universal restore command. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `60.eu..htm`.

| Spell family or named spell | Documented effect to preserve | Verification focus |
| --- | --- | --- |
| Minor Heal, Heal, Restoration | Recover HP without automatically curing other conditions | Power, missing-HP cap, active-guild conflict |
| Cure Poison / Cure Disease | Remove the named ailment | Severity handling, cost, other conditions unchanged |
| Cure Paralysis | Remove paralysis; listed as COMBAT | Context legality and allowed recipient |
| Cure | Heal and remove poison and disease | Effect order and precise condition scope |
| Mass Heal | Heal party members | Eligible members, separation, companion treatment |
| Raise Dead | Attempt revival without full healing | Success, resulting HP, complications |
| Restore Flesh | Recover a stoned character | Constitution loss and eligibility |
| Resurrect | Revive and restore HP | Failure, complications, rock exclusion |

The help lists the other spells in this table as NON-COMBAT. Its spell rules permit non-combat casts with peaced monsters present; a UI must not infer hostility from a nonempty monster panel. Confirm each spell's restriction in the baseline. Revival does not imply curing every ailment, recovering a missing body, repairing gear, or reversing previous permanent losses.

### 9.8 Original spell records and access matrix

**Extracted file facts:** MDATA2 contains **105 physical spell records and 103 distinct embedded IDs**, compared with the earlier later-help transcription's 100 category entries. ID 93 is shared by Mass Sight Veil and Mass Protection; ID 94 by Fate and She'tal. Preserve physical identity and names rather than deduplicating by ID. All 132 positive item-to-spell references match the embedded ID at their one-based target record. ID 0 is Charm of Opening and must not become a universal null value.

The local guild/category matrix derives 205 guild/spell relations across 101 physical spells. Fate, She'tal, Life Domination and Shock Lance have base level 50 and no ordinary access in that matrix; retain them without inventing unlocks. Access involves category permission/cap, base level times category multiplier, spell level `floor(guild level / 2 + 0.5)`, and effective stat requirements. The resulting guild-level thresholds remain source-derived candidates until verified.

Local base levels and requirements disagree with later help in nine compared fields, including Firebolt level 1 rather than 2 and Blue Flame 3 rather than 4. Preserve edition-specific values and explicit aliases. Stored cost parameters are not final SP prices; the detail display adds one to the stored power modifier, whereas runtime equations can use the raw coefficient. [Complete original spell table](research/local-original/spell-reference.md), [guild access](research/local-original/guild-spell-access-local.csv), [help comparison](research/local-original/spell-help-comparison.json).

### 9.9 Source ailment-tick candidates

**Static decompiler evidence:** the ailment callback rolls separately for poison and disease. Poison computes `Int(Rnd × 200) + 2 × (effective CON − 10) − 2 × poison severity`; a result above 185 clears it, otherwise it removes two HP. Disease uses a threshold above 195 and otherwise removes one HP, but the displayed disease expression also reads **poison severity**. Preserve this as a suspected source/decompiler defect (F23); do not silently substitute disease severity. Test poison alone, disease alone, both, and stat modifiers, including RNG ordering with identification and environmental work in the same callback. Tick duration remains unresolved. [Ailment evidence](research/original-followup-review.md).

## 10 Dungeon and exploration

### 10.1 Geometry

Preserve fifteen floors with their original layouts. A historical retrospective describes each floor as 30 by 30 cells, giving 13,500 coordinate positions across the full dungeon; that includes solid rock and is not a count of walkable spaces. [CRPG Book retrospective](https://crpgbook.wordpress.com/review-index/1995-mordor-depths-of-dejenol/). The supplied original MDATA11 now provides those complete cell records; section 10.5 defines the remaining behavioral checks.

Every cell must retain coordinates, room membership, walls, doors, secret doors, traversability, hazards, lair associations, and transitions. Keep facing and the original coordinate convention. Draw the remastered corridor from those records. Hand-building a similar-looking maze is insufficient because even one moved wall can change a route, teleport, rescue, or lair strategy.

Use discrete movement and facing. Smooth transitions may interpolate between accepted positions but cannot let the party stop between cells, peek around corners, or avoid a hazard through animation timing. No free-look camera may reveal information beyond the original view.

### 10.2 Environmental systems

**Later official help documents:** fixed and random teleporters, pits, chutes, fog, water, quicksand, rotators, forced-facing cells, secret doors, Anti-Magic, Extinguish, and stronger-encounter “Stud” cells. Random teleporters can split parties. Levitation does not simply neutralize every terrain danger. Anti-Magic blocks new casting, while Extinguish also removes existing spell effects. Multiple cell properties may coexist. These details need retail-build confirmation. [Official help archive](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), topic `dki1c1.htm`, The Dungeon.

**Preserve:** all trigger conditions and precedence, including entering, remaining in, or turning on a cell; forced movement chains; levitation failure; burden-related drowning; item loss; party separation; and destination selection. A path must be simulated one original action at a time. Do not introduce safe auto-walking or pathfinding into normal play.

### 10.3 Mapping and orientation

**Later official help documents:** shared automapping, perception-dependent details, no erasure of a better map by a less perceptive character, access limited to visited floors, and suppression of current location when lost. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `ewtej8.htm`, AutoMap.

**Proposed map:** zoomable, high-contrast symbols with a legend and player-written notes. The view is generated from world knowledge, not the raw dungeon. While lost, omit the live position marker and any breadcrumb that would reconstruct the hidden position. Notes represent what the player entered, even if mistaken. A full-map inspector belongs in developer tools or a separately opened spoiler reference.

### 10.4 Encounters and time

Preserve room populations, repopulation timing, lairs, special-room modifiers, spawn eligibility, encounter composition, and persistence after leaving. Do not replace the fixed dungeon with procedural layouts or scale inhabitants to the current party. Deeper risk comes from original content and distributions.

**Acceptance:** compare all cell fields and all directed connections; walk every stair, chute, and fixed teleporter; test random transitions statistically; cover every combined hazard flag; traverse the same route with different perception and levitation states; and save a separated, lost party before reloading it.

### 10.5 Full original cell manifest

The supplied MDATA11 contains fifteen 30×30 floors: **13,500 cells**, with raw terrain masks, area references, 201 allocated area records per floor and the transition slots. Preserve all entries, including unused/zero slots. The area-count header is not the physical number of area records to skip. Floors 1–9 allocate twenty teleporter slots; floors 10–15 ten; every floor allocates ten chute slots. Slot counts do not equal active hazards, and non-rock cells are not automatically reachable. Coordinates have static support for one-based indexing; orientation and transitions require original automap checks. [Cell manifest and floor summary](research/local-original/extraction-summary.json), [cell export](research/local-original/dungeon-cells-local.csv), [format evidence](research/local-original-review.md).

## 11 Monsters and encounters

### 11.1 Complete record preservation

Every monster must retain its original record identity and behavior. Preserve at least name, class and subtype, picture reference, attack, defense, HP parameter and distribution, guild or combat level, six statistics where present, size, alignment, group parameters, depth and encounter eligibility, resistance values, property flags, special attacks, spell capabilities, companion associations, treasure probabilities, traps, item-drop references, and gold parameters. Preserve unused and unknown fields until their semantics are established.

The community file-format library identifies a broad original monster structure and a CSV exporter. It is a useful parser reference, not proof of combat formulas. [libDejenol](https://github.com/JKaniarz/libDejenol).

**Do not collapse** monster classes, replace elemental immunities with one defense stat, scale enemy HP, equalize loot, or make rare encounters common. Preserve monsters that share a picture as distinct records. A graphical variant must not imply a mechanical variant that did not exist.

### 11.2 Content verification

The supporting bestiary files retain all parsed candidate records and their provenance. Their status is stated in the appendix. A row count alone cannot certify completeness: disabled entries, duplicate IDs, inaccessible depth values, and unused records must be reconciled. Preserve record position independently from embedded ID until reference semantics are known.

The production data importer must reject unexpected changes and produce a field-level comparison report. Each monster receives a verification status: extracted, structurally checked, library-checked, behavior-checked, and approved. Validate ordinary melee enemies, casters, thieves, breath users, draining enemies, item destroyers, charmable creatures, lair inhabitants, and the final encounter separately.

**Local original comparison:** the supplied data retains 401 physical monster records, 400 distinct IDs, GOBLIE, duplicate ID 307 and first-level values above 15. Every parsed field matches the public candidate except Dark Shape's first item field: physical record 266 stores `item_1 = 33` locally versus `34` in the public archive. Keep both source versions and use the selected baseline's value; do not silently merge them or infer a drop probability from this difference. [Local monster fields](research/local-original/monsters-local.csv), [comparison](research/local-original/public-local-field-differences.json).

### 11.3 Specials and behavior

**Later official help documents:** damaging breath, poison, disease, paralysis, stoning, aging, draining, theft, item destruction, critical hits, backstabs, and spellcasting. Carried items and equipped items have different exposure to theft and destruction. No generic “negative status” routine can stand in for these effects. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `24fcus.htm`, Monster Attacks.

Preserve hostility and peaced encounters. A remastered enemy animation must not declare hostility before the original decision. Retain monster knowledge and identification rules; a nameplate, portrait, tooltip, sound cue, or accessibility label must not disclose an unidentified creature’s true type.

### 11.4 Endgame

Preserve the original deepest encounters, their appearance conditions, rewards, records, and repeatability. Do not add phases, invulnerability windows, cinematic quick-time actions, or a mandatory ending that clears the world. Exact final-adversary identity, record mapping, and recognition must be checked in the registered build. The story’s Prince of Devils reference does not independently establish its complete enemy stat block.

## 12 Items and equipment

### 12.1 Item definitions and instances

Separate an item definition from an owned instance. Definitions hold original identity, category, price, attack and defense, damage modifiers, hands or equipment slot requirements, guild masks, stat requirements, level requirements, resistance or ability flags, spell associations, use behavior, and all original parameters. Instances hold ownership, alignment, charges, curse state, identification, and any other mutable properties supported by the original.

Preserve all item categories: weapons and unarmed representations, armor and accessories, magical casting items, potions, tomes, and special or quest-related objects. The final category and slot inventories must be generated from the approved data. Do not assume a modern equipment arrangement, stack size, or weight system.

### 12.2 Eligibility and effects

Use natural statistics where the original requires them and effective statistics where it allows them. Preserve guild restrictions, active-guild restrictions, level gates, alignment conflicts, curses, two-handed interactions, equip and unequip legality, and the recalculation order of derived stats. An item that is unusable today still has inventory and economic significance.

**Later official help documents:** character item eligibility uses natural statistics, while spell stat requirements may use modified statistics. This distinction must survive the redesigned character sheet. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `81ywhd.htm`, Character Information, and `14n5mvy.htm`, Spells.

Retain charges and depletion behavior. An item-cast spell must use its original power-selection rule; it is not automatically equivalent to casting that spell from the character’s own spellbook. Preserve destruction, draining, consumption, charge combination, special stat effects, and opposed-alignment outcomes.

### 12.3 Inventory presentation

**Proposed:** inventory and equipment appear together, with known requirements and effects in a detail panel. Sort and filter are visual operations unless the original inventory order affects a rule; if order matters, preserve canonical slot order and treat visual sorting as a view only. Display unidentified instances using their current known description. Never reveal identity through icon choice, sort order, hidden search terms, or comparison totals.

A protected-from-accidental-sale UI marker may require confirmation before a player sells an item, but it must not prevent theft, destruction, curse effects, or compulsory quest turn-in. Do not add stack merging, mass selling, auto-equipping, salvage, crafting, durability, loot rarity colors, or vendor buyback unless the baseline supports the mechanic.

### 12.4 Acceptance

Exercise every item definition’s eligibility and effect. Test known versus unknown items, last charge, full inventory, full bank, two-hand conflicts, guild changes while cursed, opposed alignments, stat modifications at caps, death ownership, and theft/destruction target eligibility. Compare the same character before equipping, after equipping, and after removing an item to catch persistent stat drift.

### 12.5 Capacity, equipment classes, and action distinctions

**Later official help documents:** forty character item slots, plus the separately documented forty bank slots. Equipment is constrained by item class: only one equipped member of a class, including rings or stones, rather than a modern assumption of two ring slots. Subclasses such as swords and daggers belong to broader equipment classes. Some consumables and casting objects can be Used without being Equipped. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `5hmud3.htm`.

Implement `Equip`, `Unequip`, `Use`, `Give`, `Drop`, and town services as separate commands with their own eligibility and consequences. A split equipment/pack view must still use the original occupancy accounting. Verify whether equipped items consume the forty slots, how charges occupy slots, and where a failed transfer leaves the item. Do not infer extra carrying space from a redesigned screen. The source's category examples do not establish a complete slot enumeration; derive that from the approved item-class data.

**New static boundary evidence:** Store purchase searches indexes **1 through 39**, excluding index zero. This does not establish a universal 39-item limit. F22 requires comparing purchase, loot, transfer, equipment and index-zero occupancy before settling capacity and display numbering. [Purchase handler](research/original-followup-review.md).

### 12.6 Class restriction and alignment decision table

The later help supplies the following behavioral targets. Exact thresholds, affected bonuses, rounding, and exceptions remain original-build checks. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `5hmud3.htm` and `9dns9..htm`.

| Condition | Documented decision or consequence |
| --- | --- |
| Class-restricted equipment | Active guild must permit the item and meet its required level |
| Non-class-restricted equipment | An eligible sufficiently leveled membership can qualify even if inactive |
| Natural stat below requirement, equipment bonus above it | Modified value does not satisfy item eligibility |
| Unaligned item | No alignment mismatch penalty |
| Neutral character equips Good item | Half benefit in the help's example; determine each affected field and rounding |
| Good character equips Evil item, or reverse | Attachment and curse consequences |
| Direct Use of differently aligned item | Later help says a charge is consumed; static code has a spell-item early exit before debit and a different general-item path. Resolve by effect path (F21), not a universal rule |

The source contrasts a level-30 Nomad/level-1 Mage using an Iron Dagger with trying Padded Leather Armor while Mage is active. Use that as a concrete comparison setup, checking race, natural stats and both guild permissions. In the candidate data, the dagger's class-restricted field is `0` and the armor's is `-1`; this supports the distinction without independently proving eligibility formulas. [Candidate item data](research/item-candidate-shareware.csv).

Keep **Unaligned** distinct from **Neutral**. Test every character/item alignment pair for both Equip and Use. Never use an interface compatibility warning to preempt an originally legal action that has adverse consequences; expose the consequence only to the extent legitimately known, then execute the original rule.

### 12.7 Identification and information boundaries

An item's identification level controls which fields are visible. The help ties spell identity, fixed-versus-character casting level, and special abilities to complete identification. Its store service advances knowledge and its uncurse service identifies before removal. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `9dns9..htm` and `irl356.htm`.

Maintain separate predicates for information visibility, equip eligibility, and use eligibility. Do not invent a universal rule that only completely identified items can be equipped. Establish each original restriction and cursed-item exception experimentally. Unknown items must not disclose spell names through buffer labels, glyphs, screen readers, or disabled-button explanations. Store the original instance identity even when the player knows only a generic description.

### 12.8 Crests, special items, and involuntary attachment

Enumerate guild crests independently of ordinary purchasable equipment. Recover award conditions, quantity limits, guild restrictions, starting charges, charging triggers, destruction/replacement behavior, and whether an effect requires equipping. Candidate crest rows include zero price, nonzero spell charges, and negative spell-level values; none should be normalized to an ordinary shop item or a zero-level cast. The latest comparison changelog identifies crest charge handling as a recent fix; use it as a test lead, not original proof. [Candidate data](research/item-candidate-shareware.csv), [comparison changelog](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/changelog.md).

Likewise test cursed acquisition separately from voluntary equipping. Ball and Chain is a concrete candidate for involuntary attachment, identified in that changelog; verify when the original attaches it, slot conflicts, movement consequences, and removal. A generic inventory confirmation or “never equip cursed gear” option must not suppress an automatic original consequence.

### 12.9 Local item structure and spell references

The supplied MDATA3 matches the public item bytes exactly, corroborating all 366 candidate records for this local input. MDATA1 adds 35 item subtypes and 24 classes, including a special −1 equippable value for Miscellaneous Object; preserve raw values until their predicates are traced. The decompiled item structure separates charges and the next field into 16-bit values, but the latter's purpose is not established by a third-party label.

The Crest of Thief's spell index 1 / spell ID 0 resolves to Charm of Opening in MDATA2. Preserve both one-based record references and embedded IDs. The charged spell-item branch of `sub1577` rejects mismatched alignment before charge debit; a later general-item path debits first. Test both with charged and depleted instances rather than implementing the help summary indiscriminately. [Local item records](research/local-original/items-local.csv), [item spell links](research/local-original/item-spell-links-local.csv), [source interpretation](research/local-original-review.md).

### 12.10 Uncurse as separation and identification

**Static decompiler evidence:** the Store rejects uncurse for an uncursed or unequipped instance. After payment it forces separation, fully identifies the instance and updates knowledge; it clears the instance curse only if the item definition is not intrinsically cursed. Thus removal can leave an inherently cursed object dangerous to equip again. The fee routine returns `(.8 × base price) / .5` through a VB Long. Keep separation, identification and curse removal as distinct state changes, with numeric conversion and re-equipping checked in the original. [Uncurse handlers and fee](research/original-followup-review.md).

## 13 Treasure and economy

### 13.1 Containers and traps

**Later official help documents:** boxes and chests have distinct rewards; recognizing a trap and disarming it are different checks; magically locked containers require appropriate magic; opening during combat consumes rounds. Listed traps include Disease Spores, Poison Gas, Exploding Box, Fire Trap, Slime, Fate, Teleporter, Fear, Withering, and Blackout. Withering adds four weeks of age; a Teleporter trap moves the opener rather than the entire party. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `36mud0.htm`, Encounters Treasure.

Preserve each trap’s trigger, targets, magnitude, resistance interactions, persistence after activation, and effect on companions and buffs. Do not replace trap handling with one percentage roll. The displayed confidence that a chest has a trap is not necessarily the probability of successfully opening it.

### 13.2 Loot generation

Use original creature and room data to generate gold, items, containers, locks, and traps. Record whether a roll occurs when an encounter spawns, a monster dies, a container appears, or a container opens. Saving or changing UI panels cannot reroll unopened treasure. Preserve whether and how companions participate in treasure distribution.

No pity timer, guaranteed quest drop, universal boss chest, smart loot, level-scaled equipment, or daily bonus enters the faithful game. These would change scarcity and expedition planning even if enemy numbers remained the same.

### 13.3 Money and stock

Preserve carried gold, banked gold, personal ownership, party sharing and pooling, fees, training costs, prices, identification costs, resurrection costs, and the inventory consequences of each transaction. Use sufficiently wide internal numeric types while explicitly reproducing any externally visible original bounds and rounding. Do not introduce floating-point currency rounding.

**Later official help documents:** store stock changes through player and simulated explorer activity; alignment variants matter; combining charges, uncurse, identification, and realignment are separate services. Selling and repurchasing can recharge some items, with different treatment for consumables. All exact formulas remain validation tasks. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `irl356.htm`, The City Store.

**Proposed transaction behavior:** show a quote based on current legitimate knowledge; commit the original action atomically; show its actual outcome. A player cannot undo a failed risky service. Preventing a duplicate click is appropriate; refunding an unfavorable result is a rules change.

### 13.4 Charge transactions and shop stock

Use category-specific charge rules. Later official help distinguishes rechargeable spell-casting equipment from consumables: depleted swords/artifacts can reappear charged after sale, whereas an insufficient remainder of a potion need not generate a stock unit. It also documents selling charge chunks and combining compatible items into the first selected instance. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `irl356.htm`.

The comparison store guide's broad statement that original partially charged goods disappeared is therefore not safe to apply across all item types. **F17 now has subtype-specific static evidence in section 13.5, but remains open for runtime verification** in the selected original build. Neither discard all partial-charge objects nor recharge all consumables. [Comparison store guide](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/general-store.md).

For each supported service define a transaction record containing source instances, type and alignment, knowledge, charges before/after, quote, payment accounts, stock change and surviving instance. Test charges at zero, one, one below a stock unit, exactly a unit, and above a unit. Check charge overflow and restrictions on combining alignment variants; do not assume equal names are sufficient. Cancellation leaves all fields unchanged; a completed original action applies all its consequences together.

Town payment fallback is distinct from automatic banking. **Static decompiler evidence:** `Module6.fn114E` spends carried gold first; if that is insufficient but combined funds cover the charge, it zeros carried gold and deducts only the remainder from the bank. Insufficient combined funds reject payment. Validate callers and numeric boundaries per service. Do not deposit carried funds as an implementation shortcut. [Original payment routine](research/local-original-review.md).

### 13.5 Original Store charge and stock transitions

**Static decompiler evidence:** the bundle/combining set is exactly subtype codes **23–28, 30 and 31**: Potion, Scroll, Tome, Dust, Crystal, Rod, Sphere and Cube. Stone, Artifact and Guild Crest are outside this list. Do not confuse these subtypes with equipment classes.

For a bundle subtype with positive base charges B, selling C<B removes the instance without creating stock; C=B removes it and permits one stock unit; C>B retains C−B charges and permits one stock unit. Other subtypes, or definitions without positive base charges, remove the instance and permit stock. Additional guards can suppress stocking: the first-level-zero/default-alignment case, an inherently cursed definition, or a selected-alignment stock bucket already at nine. Purchased instances receive base charges. A completed sale and increased stock are therefore separate outcomes.

Combining requires full identification (raw field zero), at least two selections, an allowed subtype, the same item definition and matching alignment. The first selection receives accepted donors' charges; donor identities are cleared. Mismatched donors are handled within the loop after the initial identification precheck, so preserve partial acceptance if runtime behavior confirms it. Transaction atomicity must prevent interrupted writes without changing which donors the original accepts. Overflow and duplicate selections remain tests, not permission to add a new cap.

Sell quotes depend on alignment stock, identification, definition curse and charge differences. The [follow-up review](research/original-followup-review.md) records the candidate equation and intermediate VB types. The purchase-price function contains an unassigned local index in a charge adjustment; its intended behavior is unresolved. Preserve this blocker in F12 rather than replacing prices with a fixed fraction of base value. [Subtype export](research/local-original/item-subtypes-local.csv).

## 14 Town services and guild quests

### 14.1 Town structure

Use an illustrated, menu-accessible town hub with direct access to Store, Bank, Guilds, Library, Morgue, Seer, and Holding and Confinement. It should be quicker to read, but it must not add a travel-time simulation between shops or a free-healing inn with new rules. Retain the original service boundaries and shared world state.

**Later official help documents:** returning to town restores HP and SP, treats poison and disease, and heals companions, while recovery advances age. Town is therefore a recovery location with a time consequence. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `swkvkg.htm`, The City.

**Static decompiler evidence refines this:** town loading processes party members individually, refills SP from the natural-stat capacity routine, clears poison, disease and paralysis, and heals only companions whose current HP is positive. Dead companions require revival. HP recovery adds age according to missing-HP percentage; section 15.7 records the candidate calculation and world-time caveat. Town entry also updates and releases a carried character's saved location. [Town source path](research/original-followup-review.md).

### 14.2 Bank

**Later official help documents:** forty stored items, protected banked possessions, access limited to town, and distinct party operations for pooling or depositing carried and banked gold. Preserve account ownership and exactly which funds each service may draw from. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `swjne9.htm`, The City Bank.

**Proposed UI:** label source and destination accounts explicitly. A preview explains which balances will change before a pooling command executes. A full bank must reject an extra item without deleting or duplicating it. Carried gold stays carried until the player performs an original-equivalent deposit.

### 14.3 Guilds and quests

Preserve assignment probabilities, allowed targets, target depth eligibility, progress tracking, active-guild conditions, training gates, quest completion rewards or recognition, item surrender, and forfeiture consequences. Guild quests remain development constraints, not a new global quest board.

**Later official help documents:** town-only guild changes, cursed or opposed equipment blocking changes, quest requirements for advancement, item surrender at advancement, and a pinned-experience condition for quest forfeiture with demotion. Preserve the original treatment of party and companion kills toward monster quests. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `3.id7m5.htm`, The City Guilds, and `14i_7ja.htm`, Parties.

### 14.4 Seer

Keep paid inquiries and uncertain results. The Seer must not become a guaranteed waypoint service. Preserve required target names, repeated attempts, depth-dependent difficulty, answer precision, and the distinction between locating a character and seeking a monster or an item. Show the actual answer with a transcript so the player need not memorize a disappearing dialog. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `1f6.qsp.htm`, The City Seer.

### 14.5 Holding and Confinement

Keep creature purchase, sale, identification, binding, and realignment as separate actions. Preserve alignment-specific stock, original binding on purchase, failed realignment outcomes, and restrictions on rebinding voluntary companions. Selling a dangerous companion must retain its original distinction from dismissing one in the dungeon. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `6m9o_0i.htm`, Holding and Confinement.

Section 7.4 adds original-source purchase and binding limits. The binding-price function uses a different factor near its cap than below it; verify binding levels 7–12 and voluntary-companion rejection before adopting a uniform price per point. [Binding source evidence](research/original-followup-review.md).

### 14.6 Service acceptance

For every service compare eligibility, quote, payment source, success or failure, age change, inventory change, stock mutation, knowledge gained, and saved result. Test insufficient carried gold with sufficient bank funds, insufficient combined funds, a full container, a dead character, changed prices between selection and commitment, and crash recovery immediately after payment.

### 14.7 Quest parameters and assignment gates

The local Mage quest parameter is **15**, matching the printed number rather than the community value of 20. It is not a complete final percentage. Decompiled guild advancement forces a rejecting roll below level five, compares an integer-converted `Rnd × 100` against the guild parameter, and then performs another random exemption check. Item-quest selection also requires level above 15 and another selection condition. Preserve VB implicit conversion, comparison boundaries and draw order rather than replacing this with one `random < QP / 100` test. Verify levels 4/5 and 15/16, quest reset, completion and forfeiture separately. [Guild data](research/local-original/guilds-local.csv), [assignment code interpretation](research/local-original-review.md).

## 15 Death recovery and aging

### 15.1 Consequence model

Death must remain a persistent event in the world. Keep the casualty’s location, inventory, money, companion outcomes, party changes, and recovery eligibility. Preserve other roster characters so the player can organize an actual rescue. A defeat screen may explain options; it cannot teleport the body to town or restore losses.

**Later official help documents:** spell resurrection, carrying a body to the Morgue, hired recovery, rescue delays that advance age, resurrection complications, and separate handling of stoning and rock entombment. Rock extraction precedes resurrection. The Morgue cannot itself extract a character from rock. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `1.hflff.htm`, Dying, and `18q40y4.htm`, The City Morgue.

### 15.2 State transitions

**Proposed implementation model:** represent each original-supported casualty condition explicitly. Normal death, stoning, and entombment in rock have distinct transition guards. A rescue transaction moves or carries a body only if its original rules allow it; a resurrection transaction applies success, complications, HP, statistics, age, and fees together. Preserve the distinction between body retrieval and restoring life.

Do not classify approximate racial lifespan as a guaranteed death birthday. Recover the actual age checks and rounding. Age-reduction items, town healing time, rescue waiting time, monster aging attacks, and resurrection consequences must all share the correct unit conversions. The Withering trap’s weeks must not accidentally become years.

The decompiled label table distinguishes **Dead, Stoned, Destroyed, Immolated, Frozen, Annihalated, Melted and Rock** (source spelling). Keep these as distinct condition identities while tracing each recovery branch; do not flatten them into a generic dead flag. [Extracted labels](research/local-original/enum-labels-decompiled.csv).

### 15.3 Recovery interface

Display who is dead or otherwise incapacitated, what is known about their location, which recovery methods are currently available, and known prices or requirements. A lost casualty’s exact coordinates must not appear merely because the save file contains them. Warn clearly when the character lacks a required recovery option without inventing a free substitute.

Keep permanent stat loss and failed revival outcomes. Preserve body access restrictions, including the original Hide option if supported by the chosen baseline. Store any local character password as a modern protected credential rather than reproducing insecure historical storage; passwords do not become an online-account requirement.

### 15.4 Acceptance

Test ordinary death, party wipe, stoning, rock entombment, absent rescuers, failed rescue, successful rescue, failed raise, repeated raises, low Constitution, advanced relative racial age, inventory retrieval, and loading during every intermediate state. Verify that a body cannot be carried twice, duplicated by load, or raised while a stale copy remains in the dungeon.

### 15.5 Hired rescue versus waiting

**Static decompiler evidence:** hiring rescuers quotes `372567.52 × ln(F + 1) × F`, assigned to a VB Long, using the **supplied** floor F. Payment precedes the outcome. Search proceeds only if `Rnd × 100 > 4F`, then requires the correct floor and differences strictly below eight on **both** X and Y. The tolerance is per-axis, not a radius. Keep failed expedition and inaccurate-location outcomes separate; the shown handler refunds neither.

A living target at ≤20% maximum HP is moved to town; a healthier target is left in place. Rock is reported without retrieval; other fatal states are moved to the Morgue. The injured-target message claims healing, but this handler visibly changes location rather than HP. Verify when healing actually occurs before implementing it at search completion.

Waiting for rescue uses a separate simulated-day loop. Its draw denominator changes from 10,000 to 1,000 after a depth-dependent counter threshold; floor 1/area≤18 and a raw automap flag supply other branches. It increments elapsed days before the success draw, moves the casualty to town on success, adds those days to age and invokes recovery processing. Preserve this algorithm separately from paid search; the [review](research/original-followup-review.md) gives the expressions, branch order and unresolved flag meaning. Neither service grants free resurrection.

### 15.6 Pending raises, fees and failure consequences

**Static decompiler evidence:** raising another character writes a pending threshold, initiator name, method and location to the target's saved record. The target later accepts the offer and rolls for recovery. Preserve the pending state across saves; do not clear death or grant HP at payment time. Successful recovery processing restores 1 HP for source methods 20/21 and maximum HP for 22/23. Rock retains additional restrictions and special handling requiring validation.

The source quotes a character raise from `2912.32 × (max HP / 1.5)`. Saved-target quotation uses Long conversion while the immediate self-service path explicitly uses `Int`; verify the difference. Threshold calculation uses natural CON and method, clamped to 10–98, but saved-target Morgue and self-service paths supply different method inputs. Both use a strict `Int(Rnd × 100) > threshold` failure check. Do not replace these paths with one percentage formula. A subsidy applies only when the highest guild level is ≤5 and combined carried/banked funds cannot cover the fee.

A failed raise can enter a **complications recovery** branch: lose five from each natural stat with racial-minimum floors, age 5,475 days, reduce maximum HP to `Int(max HP / 1.2)`, and recheck equipment eligibility. Its age/racial-lifespan roll and Rock override are in the [source review](research/original-followup-review.md). Returning true lets the caller continue recovery; failure is not invariably a terminal rejection. The alternate failure branch adds 54 days and clears pending fields.

Ordinary recovery in these callers adds 54 days; stoning selects 84 and loses one CON. Morgue recovery has an additional `Rnd × 100 < 50 − 2 × CON` loss check. Some branches apply complications and normal recovery time cumulatively; the immediate and pending paths also differ in visible CON-floor handling. Preserve call order and record discrepancies in F10/F23 until original tests establish the result.

### 15.7 Recovery age and natural-death boundaries

**Static decompiler evidence:** the town rest helper assigns `(100 − current HP / maximum HP × 100) / 3.25` to an Integer day count, fills HP and adds that count to age. Explicit-day callers instead add their supplied duration. Party-index-zero rest invokes world-update helpers, which does not establish sum-of-party or maximum-party recovery time. Test unequal injuries, party order, rounding, and full HP with depleted SP.

The ailment callback starts an age check at relative racial age ≥98%, with `Int(Rnd × 100) < 5 + ln(relative age percent − 98)`. The displayed expression is undefined exactly at 98%; do not invent an epsilon or guaranteed birthday death. F23 requires checking the original error/control flow and adjacent ages. [Age helper, town caller and ailment callback](research/original-followup-review.md).

## 16 Discovery and information design

Knowledge is part of progression. The remaster must maintain separate facts for encountered, partially identified, fully identified, currently observed, and remembered information. Map discovery, item knowledge, monster knowledge, and last-known locations must follow their original sharing scope.

**Later official help documents:** a shared library that grows through identification, historical location and discovery information, and fuller monster identification through companion study or services. Simulated other explorers can affect knowledge and stock. Preserve those systems rather than replacing them with a complete encyclopedia at first launch. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `zhdvci.htm`, The Library.

**Proposed library:** searchable known entries, consistent labels, readable stat tables, and dated last-known information. Unknown fields are visibly unknown. Search matches only information currently available; sorting cannot place an unidentified object under its secret true name. Tooltips and screen-reader text use the same filtered model as the visible UI.

An optional out-of-game reference manual can contain spoilers, clearly separated from campaign knowledge. Opening such a reference must not mutate the library or automap. Developer inspectors and testing overlays must be absent from normal release navigation.

**Acceptance:** start a fresh world and compare every screen’s visible information; discover a monster with low and high perception; identify an item by different routes; query an old location after an encounter has changed; and inspect unknown content through search, sorting, controller focus, audio, and accessibility output.

## 17 Interface and controls

### 17.1 Main play screen

**Proposed desktop layout:** retain a simultaneous view of the corridor, party condition, encounters, and action controls. Avoid a cinematic full-screen viewport that hides the statistics required to manage four characters. At a standard widescreen size, use a central dungeon view with encounter groups below it, party cards along the bottom, a selected-character panel on one side, and the known map on the other. The combat log and ten buffers stay accessible without opening a new screen.

| Region | Always available information | Interaction |
| --- | --- | --- |
| Dungeon view | Original-visible corridor and encounter imagery | Cell movement and facing |
| Party strip | Name, HP, SP, condition, active command, selected member | Select character and inspect status |
| Encounter groups | Known identity, known count, target and hostility | Select the original-equivalent target group |
| Selected character | Active guild, exposed statistics, resources | Open equipment, inventory, spells, companions |
| Map | Discovered geometry and permitted orientation | Zoom, floor selection, notes |
| Action area | Fight, defend, stop, cast, use, open, original movement actions | Issue or change one command |
| Ten buffers | Spell/item binding and known availability | Execute the corresponding original action |
| Log | Time-ordered observable outcomes | Review without altering simulation |

At narrow sizes, reduce decorative margins and collapse secondary details into reachable panels; keep party status and active target visible. Never silently pause a real-time encounter merely because a responsive panel opened. Every window’s pause behavior follows the timing matrix.

### 17.2 Screen flow

The front end provides Continue, World/Roster, Create Character, Settings, Help, and Credits. Continue restores a consistent world, then the selected character or valid party. Town exposes its services directly. Entering the dungeon restores the original entry placement and rules. Casualty management remains part of the roster and Morgue flows rather than a “reload checkpoint” menu.

Selecting a party member changes whose inventory, spell resources, companions, and actions are shown. Their identity remains visible throughout an action. A targeted spell makes caster and recipient explicit. Trading similarly shows giver, recipient, item instance, and quantity or charges before commitment.

### 17.3 Controls

Preserve an original keyboard preset where documented: Fight on F, Defend on D, opening on O, next party member on N, direct party selection through Ctrl plus number, and spell/item buffer activation through Shift plus number. Complete exact movement and modifier bindings from the approved help/executable. Offer a modern remappable preset without changing action semantics. [Original PlayGuide](https://www.mocagh.org/miscgame/dejenol-refcard.pdf), combat controls.

**Proposed controller scheme:** directional movement/facing, shoulder buttons to select a character or target according to context, a focusable action bar, and a radial view of the same ten buffers. Every operation must also work without drag-and-drop or a mouse. The radial menu may pause only to the extent an explicitly selected pause feature permits; it must not create a hidden tactical advantage.

Debounce one-shot actions, distinguish held movement from discrete commands, and clear held inputs after focus loss. Do not carry a held key from a closed dialog into a destructive action. The input layer emits named commands with explicit character and target IDs; widgets never directly mutate game state.

### 17.4 Feedback and error handling

Explain failed eligibility with the relevant known requirement. Distinguish an invalid command from a valid spell that failed its roll. Show service costs before payment and rolled outcomes afterward. Make important condition changes readable in the party strip and log. Retain a clear stopped/defending/fighting indicator so a player cannot mistake idle selection for protection.

No new confirmation should extend decision time during combat unless the simulation continues or the original would pause. Put accidental-action protection primarily in town and roster management. Confirm deletion of a character or world; ordinary attacks should not require modal confirmation.

## 18 Art direction and animation

### 18.1 Visual objective

**Proposed style:** illustrated dark fantasy with readable silhouettes, weathered stone, restrained metal and parchment interfaces, and warm town lighting against cooler dungeon interiors. Preserve the original’s compact encounter presentation and unusual creature identities. The result should look like a carefully restored version of this game, rather than a generic modern dungeon crawler wearing its name.

The dungeon remains first person and grid based. Use a lightweight 3D corridor renderer or layered perspective art generated from the original map. The prototype must prove identical visibility and camera constraints before the rendering method is fixed. Remastered monster illustrations can use subtle idle motion and short attack, impact, and defeat effects; free-roaming 3D monster positions are unnecessary and could imply tactical geometry the rules do not contain.

### 18.2 Asset inventory

Create a manifest mapping every original asset reference to its remastered replacement, author, source, resolution, animation set, and approval status. Derive actual quantities from the game rather than commissioning one picture for every monster record: the original reuses imagery, and those associations are part of its visual vocabulary.

Required groups include race and character portraits; monster portraits and encounter art; item icons by known appearance; town service scenes; dungeon wall, floor, ceiling and door materials; stairs and visible hazards; spell effects; map symbols; condition icons; interface controls; and title/credits art. Cover unidentified appearances and missing-information states explicitly.

### 18.3 Preservation constraints

Keep recognizable creature proportions, equipment material distinctions, racial identity, and original naming. Preserve depiction-to-identification relationships. If several unknown creatures originally share one portrait, giving each a unique silhouette can leak identity; either retain a shared pre-identification appearance or document and validate an equivalent information boundary.

Decorative cracks, light shafts, ambient movement, and material variation cannot indicate secret doors, lairs, danger, or loot unless the original exposed that cue. Do not theme each floor with a new biome that implies undocumented changes to content. Aesthetic depth variation may occur only without revealing hidden rules.

### 18.4 Animation requirements

Effects never own the combat clock. Their duration may shorten to fit repeated events without changing resolution. Provide instant movement transitions, reduced flashes, disabled screen shake, and reduced motion. Important events have persistent text or symbols. Avoid visual clutter when several groups, companions, and party members act in one round.

**Art acceptance:** compare original and remastered scenes at the same cell, facing, visibility, knowledge state, and encounter. Confirm no extra geometry or identity is revealed. Review all assets at minimum UI size and at high-DPI scaling, including color-vision alternatives.

## 19 Audio direction

The original used MIDI music and wave sound effects. Preserve the recognizable musical and event structure when the necessary assets and permissions are available. The installation guide specifically describes its MIDI setup, which makes instrument rendering part of any original-audio restoration decision. [Original installation guide](https://www.mocagh.org/miscgame/dejenol-install.pdf).

**Proposed audio modes:** an original-audio presentation where licensed and technically supported, and a remastered arrangement with the same musical identity. A remaster arrangement should retain melody, pacing, and atmosphere rather than replacing everything with a new orchestral score. If original arrangements cannot be used, record that as an explicit production decision.

Map each original sound event to a cue: movement, doors, combat impact, casting, conditions, treasure, transactions, failure, death, and town transitions. New ambience may establish mood but must not identify an unseen enemy, nearby treasure, or secret door. Spatial audio must not supply navigation data unavailable to the original player.

Provide independent music, effects, ambience, and interface volume; mono compatibility; visual equivalents for meaningful cues; optional haptics; and restrained peak levels. A rapid combat round should remain comprehensible without playing every sound at equal volume. Audio scheduling follows simulation events and never delays them.

**Acceptance:** disabling audio yields identical outcomes; repeated cues do not leak resources; pause and resume do not replay old attacks; the same unknown monster does not expose a unique identifying call before discovery; and every critical audible event has a non-audio representation.

## 20 Accessibility and onboarding

### 20.1 Equal information and accessible operation

Include scalable text and interface elements, color-independent status symbols, visible keyboard focus, full keyboard navigation, remappable commands, controller navigation, persistent log messages, optional high contrast, and reduced motion. Tooltips must be reachable through focus, not only hover. Do not encode Good/Neutral/Evil, curses, poison, or eligibility by color alone.

Expose labels and changing resources through an accessibility layer. Test actual screen-reader support in the selected engine during the prototype; do not assume that native-looking controls automatically provide it. Announce the same knowledge as the visible interface, including uncertainty and lost orientation. Announcements should prioritize deaths and dangerous conditions without flooding the user with every decorative event.

Original-equivalent pause should be available through a visible control. Later official help says minimizing the main window pauses all events, including poison; the remaster can surface that operation explicitly once confirmed against the baseline. Pause stops the entire simulation, not only enemy attacks. **Validation required:** which commands can be changed while paused and how they apply on resume. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `zkj5q5.htm`, Game Overview.

### 20.2 Learning without altering the campaign

Offer short contextual explanations for natural versus modified stats, active versus learned guilds, carried versus banked gold, spell/item buffers, mapping uncertainty, companions, and corpse recovery. A player can dismiss them permanently or reread them in Help. Do not award extra equipment, stats, gold, or discoveries for completing a tutorial.

Keep an original-style terminology glossary. Explain “hits,” “spell level,” “binding,” “pinned experience,” “stoned,” and “rocked” in context. Avoid quietly renaming mechanically distinct concepts into the same modern term. Tutorials describe risks without revealing the full map or optimal character-growth order.

### 20.3 Localization

English is the reference release. Externalize display strings and allow longer translations without truncating numbers or action labels. Preserve stable IDs beneath translated monster, item, and spell names. Search and command parsing use localized aliases while legacy import and source references retain original names. Test accented character names, pluralization, decimal display, and input-method interactions without changing save identity or formulas.

## 21 Saves and compatibility

### 21.1 Persistent world

Save the complete world: roster, party relationships, corpses, carried and banked possessions, companions, quests, map knowledge, library, merchant and creature stock, relevant encounter state, timers, and any simulated explorer state. Saving each character independently can duplicate an item or split a party transaction; use a consistent world snapshot and journal.

Later official help describes persistent automatic saving and a legacy option that still saves in town and on death. Preserve the campaign’s consequential persistence rather than adding checkpoints and rewind. Technical recovery copies restore integrity after corruption; they are not a new game mechanic. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `xp.y1d.htm`, Game Options.

### 21.2 Proposed save implementation

Use a versioned schema, ruleset fingerprint, monotonic transaction sequence, integrity checks, and atomic replacement. Keep a last-valid recovery copy and recover interrupted writes deterministically. Flush irreversible gameplay transactions at their original logical commitment point. A crash after paying for resurrection cannot restore both the gold and the revived character.

Store simulation time separately from wall-clock timestamps. Suspending, minimizing, quitting, or waiting between sessions must not generate offline deaths, recovery, stock turnover, or combat catch-up unless the baseline explicitly does so. Random state must persist wherever the original prevents rerolling by save/load.

### 21.3 Original save import

**Proposed feature, conditional on format verification:** import a copy of a supported legacy world. Fingerprint the source edition, parse all records, preserve unresolved fields, and show a migration report. Never overwrite the original files. Import characters, map/library knowledge, guild histories, quests, holdings, companions, deaths, and world stock together. Unsupported or modified data must receive a clear report, not silent repair.

Export back to the original binary format is outside launch scope because lossy conversion and undocumented fields can corrupt a legacy world. If parity cannot be established, release new campaigns first and label legacy import as unavailable rather than presenting an approximate transfer as faithful.

Pending resurrection is part of compatibility, not transient UI state: preserve initiator, threshold, method, location and fatal condition until original-equivalent acceptance/processing. A body location update or paid raise must not be mistaken for completed revival. Test importing before payment, after a pending offer is stored, and after acceptance or complications. [Saved-state evidence](research/original-followup-review.md).

### 21.4 Cloud and local profiles

Offline local play requires no account. Optional cloud synchronization is a later convenience, and must synchronize a whole consistent world. A conflict preserves both versions and asks which world to continue; it never merges gold or inventories independently. Allow separate worlds with separate progression and discoveries, subject to reference roster rules within each world.

## 22 Software and data architecture

### 22.1 Proposed implementation stack

Use a standalone C# rules library with no rendering dependency, with a Godot .NET desktop client for presentation. The reason is practical: the rules can be tested and replayed independently, while the client handles scenes, input, audio, and scalable UI. Pin exact supported engine and .NET versions after the prototype. Godot’s official documentation supports C# desktop exports; its current C# web-export limitation reinforces the decision to keep a browser version out of launch scope. [Godot C# documentation](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/index.html).

This is a proposal, not a requirement to rewrite existing project code or install an engine now. Validate accessible UI, controller input, deterministic execution, and export behavior before production commitment. A failed accessibility prototype is a reason to change the client technology while retaining the independent rules library.

### 22.2 Boundaries

| Component | Owns | Must not own |
| --- | --- | --- |
| Reference importer | Original bytes, format validation, provenance | Gameplay rebalance |
| Approved rules catalogue | Versioned immutable content and parameters | Character mutations |
| Simulation core | Commands, scheduling, RNG, rule resolution | Frame rate or UI layout |
| World state | Characters, encounters, economy, knowledge, timers | Asset loading |
| Knowledge view | What this player may currently observe | New discoveries caused by inspection |
| Client presentation | Visuals, audio, focus, input mapping | Damage, prices, loot rolls |
| Persistence | Consistent snapshots, migrations, recovery | Selective gameplay undo |
| Verification tools | Diffs, traces, fixtures, source comparisons | Hidden access in ordinary play |

A command identifies actor, action, targets, parameters, and simulation timestamp. The core validates it, applies original ordering and random draws, mutates state, and emits observable events. The client receives a knowledge-filtered state projection and event stream. Invalid commands do not consume resources or RNG unless the original does so.

### 22.3 Data model

Every content record requires source edition, source file hash, physical record index, embedded original ID, normalized stable ID, field values, unknown raw fields, interpretation notes, verification status, and reviewer. Record index and embedded ID are distinct: the candidate bestiary already demonstrates why assuming uniqueness is unsafe.

Use separate tables for races, racial resistances, guilds, race/guild eligibility, guild abilities, guild growth, spells, guild/spell access, monster definitions, item definitions, encounter rules, map cells, transitions, services, and original text/asset references. Keep definition data separate from mutable instances. Preserve original numerical precision and record both a raw parameter and its interpreted unit.

**Unknown is not zero.** A missing spell-cost formula must remain unresolved, and prevent approval of that rule. A zero resistance read from a trusted record is a real value. A blank printed cell interpreted as zero carries an explicit transcription note. Importers never fill missing behavior with a default modern RPG rule.

### 22.4 Randomness and numerical fidelity

Determine the original RNG algorithm, seeding, call order, range endpoints, and state persistence where possible. Centralize randomness behind a traceable interface. Do not split cosmetic and gameplay randomness by accidentally consuming gameplay draws for particles. The presentation uses a completely separate RNG that cannot change the simulation.

Use exact integer or compatible numeric behavior for formulas, including truncation, ties, caps, signed fields, and percentage interpretation. The original file format’s floating values do not prove that every runtime calculation uses the same precision. Preserve observed edge behavior deliberately and document platform-dependent cases.

### 22.5 Tools

Build a read-only content browser, raw-to-normalized diff tool, map inspector, record validator, formula probe runner, combat trace comparator, and save-state comparator. Provide controlled test-state construction for researchers. Tools can expose complete data; ordinary game screens cannot.

Changes to approved data require a source citation and validation result. An asset replacement changes only the asset map. A balance-changing edit changes the ruleset fingerprint, invalidates relevant comparison tests, and requires an explicit design decision.

### 22.6 Performance and reliability targets

**Proposed targets, to be measured on a declared minimum test machine:** 60 FPS at 1080p, responsive keyboard/controller feedback within 100 ms, town and roster interactions without visible stalls, and no simulation drift at 30, 60, 120, or 144 display FPS. These are engineering targets, not original game statistics or guaranteed hardware specifications.

Keep assets asynchronously loaded while the simulation follows a defined safe scheduling policy. Test long sessions, large guild histories, many discovered records, repeated town visits, high gold values, and maximum supported roster state. Memory and save size should stabilize rather than grow per expedition.

### 22.7 Field semantics and data promotion

Maintain a raw source layer and a separately reviewed semantic layer. Preserve signed values, little-endian field widths, variable-length names within fixed-size records, original numeric representation, record positions, embedded IDs, and unknown bits. Do not rename a field to a gameplay probability until its scale and use are proven.

In the current item candidates, `spell_index` and `spell_id` differ, including a charged crest with spell ID zero. A zero ID cannot universally mean absence. The `class_restricted_raw` field includes `-1`; preserve it rather than requiring the serialized true value to equal `1`. Retain the combined charge/deletion word alongside its candidate halves. Float parameters such as a value close to 1.1 must not be rounded in the canonical import merely because a tooltip displays fewer decimals. [Parser and schema notes](research/bestiary-data.md), [candidate fields](research/item-candidate-shareware.csv).

Promotion to approved rules requires a field definition, source revision, units, signedness, range, valid references, sentinel interpretation, and comparison evidence. The [technical appendix](research/second-pass-appendix.md) identifies concrete values for this audit. No second-pass candidate value has been promoted to certified retail truth.

### 22.8 Original-file importer requirements

MDATA2 uses 75-byte physical records, with version and count before the first spell, a length-prefixed variable name and nineteen signed 16-bit fields. The supplied Python exporter assumes a fixed name width; a supplied C++ reader skips the first record and omits a field. Neither output is authoritative. Use the independently written [local audit parser](research/local-original-audit.py), retaining unknown values and record positions. Do not parse trailing record padding or stale embedded text as extra content.

MDATA11 uses 20-byte records, a floor-offset directory, fixed area-slot allocation and VB Currency terrain masks scaled by 10,000. Preserve signed integers, Single/Double intermediates, Currency, `Int`, implicit VB conversion and RNG order wherever the rules depend on them. The supplied `VBRUN300.reko` describes the VB runtime; it is not Mordor gameplay source. Decompiler output must pass semantic and executable checks before becoming engine logic. [Format review](research/local-original-review.md).

## 23 Fidelity verification

### 23.1 Proof levels

Record four separate achievements: source transcription accuracy, parser correctness, mathematical/behavioral parity, and player-experience review. Passing one does not establish the others. A CSV may be byte-faithful to an edited archive; an accurate equation may still run at the wrong time; a visually familiar game may have incorrect drops.

The test reference must be identified by executable and data hashes, edition, locale, configuration, initial save, and input sequence. Record observations in an isolated research environment. All validation cases below are requirements; this document does not claim they have already passed.

### 23.2 Required suites

| Suite | Required coverage | Pass condition |
| --- | --- | --- |
| Content | Every approved record and field; all map cells | Exact values and references, no unexplained missing entries |
| Character creation | Every race/alignment and stat boundary | Same accepted choices and resulting record |
| Progression | Guild requirements, fees, XP thresholds, HP breakpoints, level cap | Same growth and restrictions |
| Spell access | Every guild/spell pair and stat requirement | Same availability, power source and cost source |
| Combat | Representative monsters for every behavior and flag | Matching deterministic traces or justified statistical parity |
| Exploration | All transitions, hazard types, lost states and perception | Same position, consequences and revealed knowledge |
| Items | Every type, curse, alignment, charge and eligibility path | Same stat, ownership and consumption results |
| Economy | Every service, stock change, pooling and payment route | Same balances, inventories, fees and outcome |
| Companions | Every control state and special capability | Same ownership, obedience and combat participation |
| Death | Ordinary, stoned, rocked, rescue and resurrection | Same state transitions and permanent consequences |
| Persistence | Save/load, crashes, upgrades, suspend and resume | No loss, duplication, time catch-up or reroll exploit |
| Information | All unknown/partial/known states and accessibility outputs | No leaked identity, location or probabilities |
| Presentation | Original and remastered visual/audio profiles | Identical simulation state after the same inputs |

### 23.3 Deterministic and statistical testing

Where RNG can be controlled, compare event-by-event traces and final state exactly. Where it cannot, first isolate deterministic invariants, then compare predefined stochastic experiments. Select sample sizes from the rarity of the outcome and desired detection sensitivity; report confidence intervals. “Looks close after ten fights” is not evidence for a one-percent event.

Do not choose tolerance after seeing results. Any tolerated discrepancy must be explained as measurement uncertainty or an approved version difference. Ordinary game rules have a target of zero intentional numerical deviation. Unexplained mismatches block the affected feature’s fidelity signoff.

### 23.4 High-risk combined scenarios

Run a poisoned, low-HP party through a random teleporter; load a lost character after party separation; charm an enemy while a spell is queued; let a companion revolt during a chest attempt; change guilds while equipment affects displayed stats; pay for resurrection from mixed carried/banked funds; lose an item that granted a protection; and pause on the same scheduler boundary as death.

Test known legacy strategies rather than only isolated formulas: staged guild leveling, selling and repurchasing rechargeable equipment where supported, chest opening during combat, companion trading through town, and rescuing another roster character. The remaster must preserve why those strategies succeed or fail.

### 23.5 Human review

Ask experienced original players to repeat familiar expeditions and builds, then investigate each reported difference with source evidence. Ask new players to identify their active character, current guild, dangerous conditions, and available recovery options without coaching. Familiarity review cannot override an executable trace, but it is valuable for catching timing, feedback, and workflow regressions.

### 23.6 Second-pass comparison scenarios

These are **test specifications**, not passed tests. Capture original build hashes, initial save, clock settings, actions, observations and unresolved variance for each. Run deterministic checks before stochastic distribution comparisons.

| Case | Controlled setup | Required observations |
| --- | --- | --- |
| V01 HP history | Two legal guild orders with the same final levels and stats | HP awards, randomness, breakpoint and tie handling |
| V02 CON timing | Same level path, permanent CON increase at different points | Historical versus future HP changes; no assumed retroactivity |
| V03 Natural stats | Gear crosses an INT/WIS or item-stat boundary | Max SP, casting availability, item use and guild eligibility separately |
| V04 Healing source | Unequal healing guild levels, active guild switched | SP and healing distributions; repeat for item casts |
| V05 Swing chain | First hit kills; second hit leaves a survivor | Whether a third swing occurs; compare misses and group exhaustion |
| V06 Alignment | Every character/item alignment pair | Equip effects, curses, direct-use effect and charge loss |
| V07 Item capacity | Full pack and bank; equip, transfer, find, and combine | Slot occupancy, overflow behavior, ownership and charges |
| V08 Shop recharge | Consumable and rechargeable item at boundary charges | Quote, remaining instance, stock units and repurchase charges |
| V09 Restricted item | Nomad 30/Mage 1, then switch active guild | Iron Dagger versus Padded Leather Armor eligibility |
| V10 Crest lifecycle | Award, drain, carry/equip, town return, guild change | Charges, power source, restrictions and replacement behavior |
| V11 Automatic curse | Acquire attachment-type cursed loot at full capacity | Attachment, stat mutation, displaced items and removal |
| V12 Cast context | Same spell with absent, peaceful, and hostile monsters | Legal action, SP/charge use, target and effect |
| V13 Opening strike | Peaceful encounter becomes hostile near round boundary | First actor, reaction timing, withdrawal and companion order |
| V14 Knowledge | Unknown item and lost map through all UI paths | No hidden identity, geometry, or destination leakage |
| V15 Relocation | Spell/terrain move into a flagged occupied room | Encounter and hazard ordering; no stale source-room action |
| V16 No new automation | Enter dungeon; lose buffs; obtain Seer advice | Only original-supported actions and encounter rules execute |

Cases V10, V11, V13 and V15 use comparison-project reports as discovery leads. An entry called a “fix” in another game is not itself an expected original outcome.

### 23.7 Original-file audit and new comparison cases

Completed static checks compare installed and packaged inputs, parse declared record counts, preserve duplicate IDs, compare public/local item and monster fields, compare selected printed race/guild fields, resolve every positive item-spell reference and extract all fifteen floors. These checks establish data consistency, not gameplay equivalence. The whole source tree has a before/after path, size and SHA256 comparison; see the [preservation report](research/local-original/source-preservation-check.json).

Add original/remaster fixtures for all nine creation pools; natural versus modified SP and A/D; every HP breakpoint and the 999 cap; both duplicate spell-ID pairs; ID-zero item casting; active-guild versus fixed-item healing; alignment failures before/after charge debit; quest levels 4/5 and 15/16; split cash/bank payments; and every floor's first/last cell, area boundary and transition. Check the Dark Shape field against the chosen source and original library/loot behavior. Required runtime fixtures remain outstanding; do not label the static audit as passing those tests.

### 23.8 Follow-up source comparison cases

These are **unexecuted original/remaster test specifications**. Revision 1.3's completed checks cover source hashes, anchor validity, unchanged inputs and document structure; they do not pass these behavioral cases.

| Case | Controlled setup | Required observations |
| --- | --- | --- |
| V17 Charge bundles | Each of eight subtypes; charges 0/B−1/B/B+1/2B; compare Stone/Artifact/Crest | Quote, remaining instance, charge debit, stock and repurchase charges |
| V18 Stock and knowledge | Alignment bucket 0/1/8/9; another alignment stocked; each identification state; cursed definition | Sell/identify/buy quotes, conversion, no-stock sale outcomes |
| V19 Combining and uncurse | Mixed donors, unknown item, mismatched alignment, duplicate index, near-overflow charges; inherent/instance curse | Precheck versus partial acceptance, surviving identity, separation and retained curse |
| V20 Inventory index zero | Only index zero empty, then only index 39 empty; repeat purchase/loot/give | Actual usable slots, rejection before payment, no lost item |
| V21 Companion services | Four occupied slots; binding 7–12 and negative; dead companion | Purchase rejection, binding increments/fees, revival fee, success HP and failure removal |
| V22 Hired search | Floors 1/15; coordinate differences 7/8 on each axis; wrong floor; HP around 20%; Rock | Fee/debit before result, search branches, returned location and actual HP before/after load |
| V23 Wait for rescue | Floor/area boundary, raw flag 23, draws around threshold and denominator change | Elapsed-day order, aging, location and separate raise requirement |
| V24 Pending raise | Paid saved-target versus self-service; methods 20–23; accept/decline/reload | Stored fields, quote rounding, threshold path, charge once, HP 1 versus max |
| V25 Complications | Highest guild 5/6, insufficient/sufficient funds, young/old, racial stat minima, stoning/Rock | Subsidy, failure branch, stacked age, HP reduction, CON floors and equipment loss |
| V26 Town recovery | Different injury per party member, swap leader, full HP/empty SP, living/dead companions | Per-character age rounding, world updates, status clearing and body release |
| V27 Timer/pause | Idle hostile/peaceful room; minimize and both restore states; focus/modal changes | Callback and attack cadence, guard behavior, command interaction and no frame-rate dependence |
| V28 Ailment/age anomalies | Poison/disease separately/together, effective CON changes, relative age below/exactly/above 98% | Severity source, draws, HP loss, original error path and any interrupted tick work |

The [follow-up evidence review](research/original-followup-review.md) supplies source anchors and caveats for each family. Preserve suspected defects as questions until executable comparison and an explicit change decision.

## 24 Production scope and milestones

### 24.1 Deliverables

Launch scope includes the complete approved original rules and content; remastered desktop presentation; full keyboard/mouse control; accessible navigation and scalable UI; tested controller support; offline persistent worlds; documentation; and a fidelity report. Original-style assets and legacy-save import are conditional features requiring successful rights and compatibility work.

Exclude new classes, races, dungeon floors, multiplayer, crafting, procedural generation, new narrative campaigns, seasonal progression, battle passes, and balance changes. Do not spend production effort adding systems while unresolved original mechanics remain.

### 24.2 Sequenced milestones

| Milestone | Concrete output | Exit gate |
| --- | --- | --- |
| M0 Reference freeze | Fingerprinted registered build, source register, conflicts, rights/asset plan | Reference edition and permitted asset use established |
| M1 Data preservation | Complete approved catalogues and all fifteen maps; independent parser checks | Every record accounted for; suspicious candidates excluded |
| M2 Rules prototype | Headless creation, guilds, combat, spells, items, encounters and deterministic saves | First comparison suites pass without art dependencies |
| M3 Vertical slice | Town plus a representative original dungeon route, party, chest, companion and death/recovery | End-to-end parity and usable desktop interaction |
| M4 Content complete | All floors, records, services, effects, quests, and endgame | Full feature/record coverage, no guessed mechanics |
| M5 Presentation complete | Approved art/audio, settings, controller flow, accessibility and tutorial | No information leaks or timing changes |
| M6 Release candidate | Migration policy, installers, recovery, long-session and compatibility tests | Release criteria in section 25 met |

Build M2 and asset prototypes in parallel only after their reference requirements are understood. Do not lock a release date until M0 and M1 resolve data access and formula recovery. A polished first floor cannot establish that deep-dungeon special attacks or the full economy are complete.

### 24.3 Staffing and estimating

Assign explicit ownership for rules research, simulation, interface/accessibility, data tools, art, audio, and QA. One person may cover several roles, but each fidelity decision needs an independent review where feasible. Estimate after the content census and formula backlog exist; report effort by rule family and asset family, with uncertainty, rather than promising an unsupported calendar date.

Prioritize data and behavior before extensive artwork. A remastered monster portrait has little preservation value if its stats or attack flags are wrong. Scope reductions should reduce optional presentation features first, not remove original content.

### 24.4 Distribution and support

**Proposed product model:** a complete offline game without gameplay microtransactions or recurring progression resets. Final pricing and distribution channels depend on the project’s rights and production arrangements. The official site states that Decklin’s Domain acquired the IP; this document does not imply an existing license or endorsement. Confirm permission for the title, content, and retained assets before public release. [Official product page](https://www.decklinsdemise.com/mordor.htm).

Maintain source and third-party credits. Godot’s engine licensing does not grant rights to original game content, and a community parser’s software license does not license the data it reads. [Godot license](https://godotengine.org/license/), [libDejenol repository](https://github.com/JKaniarz/libDejenol).

Support patches should publish whether they affect presentation, reliability, or rules. Save migrations require recovery copies and regression tests. Crash reporting is optional and should avoid uploading character names or full saves without the player’s choice. A bug report can include ruleset hash, build, action trace, and an explicitly selected save attachment.

## 25 Release criteria and open decisions

### 25.1 Completion standard

The remaster is ready to be called faithful only when every original content record and map is accounted for, all rule families have evidence-backed implementations, the required comparison suites pass, and any intentional differences are disclosed. A remaster design can be complete in scope while the exact executable rules remain a research deliverable.

For this document, all major design areas are specified. The remaining work is **implementation evidence**, not an invitation to invent missing statistics. The supporting tables distinguish printed reference data, later official help, community interpretation, and candidate binary data awaiting retail validation.

### 25.2 Evidence gaps and conflicts

| ID | Issue | Current evidence | Resolution required |
| --- | --- | --- | --- |
| F01 | Exact reference edition | Local 1.1 candidate fingerprinted; installed/installer consistency checked | Establish registered-distribution and first-retail provenance |
| F02 | Full dungeon data | All 13,500 cells and transition slots now exported | Verify orientation, activation and traversal against original maps |
| F03 | Monster archive differences | Local/public differ only in compared Dark Shape item_1; shared record anomalies persist | Select baseline explicitly; verify library and loot semantics |
| F04 | Item completeness and semantics | All 366 local records byte-match public data; semantics partly unresolved | Verify behavior and remaining raw fields |
| F05 | Troll alignment | Local mask 7 includes Good; printed card mask 6 omits it | Confirm local creation permits the stored mask |
| F06 | Mage quest chance | Local parameter 15; decompiled assignment has additional gates | Verify conversion, draw order and final assignment distribution |
| F07 | Spell names and access | 105 local records, 103 IDs, 205 derived guild relations; help discrepancies documented | Verify duplicate-ID selection, aliases and access thresholds |
| F08 | Spell power and SP formulas | Static healing equation and cost/access routines located | Verify VB arithmetic and complete multi-guild arbitration |
| F09 | Combat math and clock | Later-help 2-second default versus static 1,000 ms timer initialization; minimize guards located | Measure effective cadence and pause behavior; recover hit/damage, specials, XP and rounding |
| F10 | Death, age and rescue | Static hired/waiting rescue, pending raises, method-specific recovery and complications traced | Verify threshold domains, path-specific fees/chances, time accumulation and losses |
| F11 | Companions | Four-slot purchase, binding 4-point increments/cap 12 and separate revival traced | Verify service boundaries, obedience, friendly fire and caster arbitration |
| F12 | Economy and world timers | Static sale/stock/fee paths; buy-price routine references an unassigned local index | Verify quote conversions and suspicious index, refresh and party world-time updates |
| F13 | Help version mixing | Official CHM includes modern M1 and legacy content | Compare against original shipped help and executable |
| F14 | Legacy save migration | Format research available, full conversion unproven | Validate all world fields and lossless import |
| F15 | Public release permissions | No project license established by this research | Resolve title, content and asset arrangements |
| F16 | Healing power source | Static healing/cure branch uses active guild unless positive cast-level override | Verify spellbook/item callers and effect-family boundaries at runtime |
| F17 | Partially charged sales | Static eight-subtype bundle set, remainder handling and stock guards recovered | Verify charge boundaries, nine-unit stock limit and repurchase by subtype |
| F18 | Special item lifecycle | Crests and involuntary curses have candidate records and remake test leads | Recover award, charge, attachment, removal and replacement rules |
| F19 | Creation, derived stats and HP | Local pools plus static initialization, SP/A-D bands, random HP growth and 999 cap | Verify stat sources, boundaries and RNG with original characters |
| F20 | Decompiled-code identity | Substantial generated VB output; damaged syntax and no certified binary-address mapping | Connect critical routines to the fingerprinted executable |
| F21 | Charge debit on alignment failure | Later help generalizes; static item paths differ in debit/exit order | Compare spell-casting and general items across alignment pairs |
| F22 | Inventory slot zero | Forty slots documented; Store purchase scans only indexes 1–39 | Trace index-zero purpose and compare all acquisition/transfer paths |
| F23 | Suspicious legacy branches | Disease reads poison severity; age check takes ln(0) at exactly 98%; rescue healing message lacks local HP update; raise paths differ in CON floors | Establish executable behavior and document any intentional correction before implementation |

The Scavenger alignment row was rechecked visually during this document’s review: the printed card marks Good, Neutral, and Evil. It is **not** an unresolved conflict; the supporting CSV reflects the corrected transcription.

### 25.3 Formula recovery register

Keep an explicit entry for each of these: creation point budget and starting resources; race/guild XP; attack/defense aggregation; hit chance; damage; critical, backstab and swing checks; spell-level growth; spell cost/power and resistances; HP bonuses; identification and perception; encounter and treasure weighting; trap difficulty and effects; companion control; training/service prices; charge handling; aging and healing time; rescue/raise success; and all timer/RNG behavior. Each entry needs inputs, units, formula or lookup table, bounds, operation order, rounding, source, and comparison fixtures.

### 25.4 Decision ownership

The reference-build selection, treatment of behavior-changing bugs, original-asset availability, legacy import commitment, and minimum platform specification are production decisions. Until resolved, the design defaults to preserving the selected original behavior, using remastered presentation, and withholding claims of verified numerical equivalence. New features cannot be used to conceal an unresolved original rule.

## 26 Numerical reference appendices

### 26.1 Evidence coverage

These are reference inputs for a faithful implementation, with their provenance attached. **None has been certified by running a fingerprinted registered 1.1 executable.** Printed data, later help, and binary candidates must remain separate until their differences are resolved. Tables preserve factual numbers and names; accompanying interpretation is newly written.

| Dataset | Research coverage | Status |
| --- | --- | --- |
| Races | 9 stat/age/experience rows, 9 resistance rows, 9 guild-eligibility rows | Original printed PlayGuide, visually checked |
| Guilds | 12 requirements/growth rows and 12 ability rows | Original printed PlayGuide, visually checked |
| Spell catalogue | 100 category records across 18 named categories | Later official help; formulas incomplete |
| Guild spellbooks | 205 assignments, 103 distinct literal names | Later official help; aliases and unmatched names unresolved |
| Monster data | 401 physical records, 400 unique embedded IDs | Two matching shareware distributions; retail parity unverified |
| Item data | 366 records | Same matching shareware distributions; some field meanings unresolved |
| Supplied local original files | 105 spells; complete fifteen-floor cell export; static rule interpretations | See section 26.12; runtime parity remains unverified |

The supporting CSV files contain provenance and additional fields. Blank spell fields mean unknown or absent in the source extraction, not zero cost, zero power, or immunity. A monster's stored average-hits value is not a verified fixed HP assignment.

### 26.2 Race statistics

Each stat cell is **minimum / printed natural maximum**. Age is an approximate lifespan parameter in years, not an exact death threshold. EXP is the printed experience parameter, not a percentage. G/N/E mean Good/Neutral/Evil. The Troll row below remains the printed transcription. The local original data stores mask 7 (G/N/E); see section 26.12 rather than silently merging the two sources. Source: [original PlayGuide page 1](https://www.mocagh.org/miscgame/dejenol-refcard.pdf).


| Race | Age | EXP | STR | INT | WIS | CON | CHA | DEX | Alignment |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Human | 100 | 3 | 4 / 17 | 4 / 18 | 4 / 18 | 6 / 17 | 5 / 18 | 6 / 18 | G/N/E |
| Elf | 400 | 7 | 3 / 15 | 7 / 20 | 7 / 20 | 3 / 16 | 3 / 18 | 3 / 18 | G/N/E |
| Giant | 225 | 7 | 12 / 25 | 4 / 17 | 3 / 17 | 9 / 19 | 2 / 16 | 3 / 18 | N |
| Gnome | 300 | 7 | 4 / 17 | 7 / 19 | 5 / 19 | 3 / 17 | 9 / 22 | 6 / 18 | G/N/E |
| Dwarf | 275 | 5 | 3 / 18 | 3 / 18 | 7 / 19 | 3 / 19 | 3 / 17 | 5 / 18 | N |
| Ogre | 265 | 6 | 9 / 20 | 3 / 16 | 3 / 16 | 9 / 21 | 3 / 18 | 5 / 17 | G/N/E |
| Morloch | 175 | 4 | 6 / 20 | 3 / 17 | 5 / 19 | 3 / 15 | 2 / 14 | 5 / 20 | G/E |
| Osiri | 325 | 8 | 5 / 17 | 3 / 18 | 3 / 17 | 7 / 19 | 3 / 18 | 10 / 22 | N |
| Troll | 285 | 9 | 6 / 20 | 3 / 18 | 3 / 18 | 6 / 19 | 3 / 17 | 6 / 20 | N/E |


### 26.3 Racial resistance values

Values are printed percentages. Dashes in the printed table are represented as 0, with that normalization recorded in the CSV. These are natural race values, not the final formula for combining equipment, spells, and other protection. Source: PlayGuide page 2.


| Race | Size | Fire | Cold | Elec | Mind | Disease | Poison | Magic | Stone | Paralysis | Drain | Acid |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Human | Normal | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Elf | Small | 0 | 0 | 0 | 50 | 0 | 0 | 80 | 0 | 0 | 0 | 0 |
| Giant | Very Big | 50 | 50 | 50 | 0 | 50 | 50 | 0 | 25 | 50 | 50 | 0 |
| Gnome | Normal | 0 | 0 | 0 | 40 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Dwarf | Small | 45 | 80 | 0 | 0 | 50 | 50 | 0 | 40 | 50 | 90 | 0 |
| Ogre | Big | 75 | 75 | 0 | 0 | 50 | 0 | 0 | 50 | 75 | 75 | 15 |
| Morloch | Normal | 35 | 35 | 35 | 50 | 0 | 0 | 40 | 0 | 95 | 65 | 50 |
| Osiri | Normal | 0 | 0 | 90 | 90 | 0 | 0 | 0 | 90 | 0 | 0 | 90 |
| Troll | Normal | 0 | 0 | 0 | 0 | 45 | 45 | 0 | 0 | 45 | 65 | 25 |


### 26.4 Guild entry requirements

Requirements refer to natural statistics. Race eligibility is an additional condition, shown next. Scavenger permits G/N/E in the printed table; this was visually rechecked. Source: PlayGuide page 2.


| Guild | STR | INT | WIS | CON | CHA | DEX | Alignment |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Nomad | 1 | 1 | 1 | 1 | 1 | 1 | G/N/E |
| Warrior | 14 | 7 | 5 | 10 | 3 | 8 | G/N/E |
| Paladin | 14 | 9 | 9 | 10 | 16 | 15 | G |
| Ninja | 13 | 11 | 7 | 9 | 3 | 15 | G/E |
| Villain | 15 | 14 | 14 | 11 | 6 | 16 | E |
| Seeker | 10 | 13 | 13 | 11 | 5 | 13 | G/N/E |
| Thief | 8 | 12 | 8 | 6 | 5 | 17 | N |
| Scavenger | 11 | 8 | 8 | 9 | 4 | 14 | G/N/E |
| Mage | 6 | 11 | 13 | 8 | 10 | 14 | G/E |
| Sorcerer | 6 | 14 | 13 | 11 | 5 | 8 | G/N/E |
| Wizard | 8 | 18 | 18 | 13 | 6 | 14 | G/N/E |
| Healer | 8 | 14 | 14 | 8 | 7 | 14 | N |


### 26.5 Guild eligibility by race

This is the race permission layer only. A listed guild still requires the proper alignment and natural stats. Source: PlayGuide page 1.


| Race | Permitted guilds before alignment and stat checks |
| --- | --- |
| Human | Nomad, Warrior, Paladin, Ninja, Villain, Seeker, Thief, Scavenger, Mage, Sorcerer, Wizard, Healer |
| Elf | Nomad, Paladin, Seeker, Thief, Scavenger, Mage, Sorcerer, Wizard, Healer |
| Giant | Nomad, Warrior, Seeker |
| Gnome | Nomad, Paladin, Villain, Seeker, Thief, Scavenger, Mage, Sorcerer, Healer |
| Dwarf | Nomad, Warrior, Seeker, Thief, Scavenger, Sorcerer, Wizard, Healer |
| Ogre | Nomad, Warrior, Scavenger |
| Morloch | Nomad, Warrior, Villain, Seeker, Scavenger, Mage, Sorcerer |
| Osiri | Nomad, Seeker, Thief, Scavenger, Sorcerer, Wizard, Healer |
| Troll | Nomad, Ninja, Villain, Thief, Scavenger |


### 26.6 Guild growth parameters

AH is the printed average/base HP-growth parameter, ML its level breakpoint, MH the subsequent HP parameter, EP the experience parameter, and QP the quest-assignment percentage. These entries do not replace the highest-guild-level rule, Constitution bonus, boundary test, or full XP formula. Mage QP is 15% in the printed card; the community Mage page says 20%. Source: PlayGuide page 2.


| Guild | AH | ML | MH | EP | QP percent |
| --- | --- | --- | --- | --- | --- |
| Nomad | 5 | 30 | 1 | 8 | 20 |
| Warrior | 6 | 28 | 2 | 16 | 20 |
| Paladin | 5 | 29 | 2 | 19 | 25 |
| Ninja | 4 | 25 | 2 | 21 | 35 |
| Villain | 4 | 26 | 2 | 21 | 25 |
| Seeker | 4 | 27 | 2 | 18 | 20 |
| Thief | 3 | 21 | 2 | 15 | 15 |
| Scavenger | 4 | 24 | 2 | 18 | 20 |
| Mage | 3 | 27 | 2 | 27 | 15 |
| Sorcerer | 2 | 29 | 2 | 27 | 10 |
| Wizard | 2 | 41 | 2 | 30 | 15 |
| Healer | 2 | 28 | 2 | 32 | 15 |


### 26.7 Guild ability parameters

These are ability parameters, **not direct success percentages, attack counts, or damage values**. Printed blank cells are represented as zero with a normalization note. Source: PlayGuide page 2.


| Guild | Thieving | Backstab | Critical | Multiple swings | Fighting | Perception |
| --- | --- | --- | --- | --- | --- | --- |
| Nomad | 5 | 0 | 0 | 0 | 7 | 5 |
| Warrior | 2 | 0 | 9 | 5 | 12 | 2 |
| Paladin | 2 | 0 | 5 | 2 | 10 | 3 |
| Ninja | 7 | 2 | 5 | 8 | 10 | 6 |
| Villain | 6 | 4 | 1 | 3 | 8 | 4 |
| Seeker | 3.5 | 0 | 3 | 0 | 9 | 9 |
| Thief | 9 | 9 | 0 | 0 | 6 | 3 |
| Scavenger | 7.5 | 5 | 0 | 1 | 7 | 3 |
| Mage | 2 | 0 | 0 | 0 | 5 | 3 |
| Sorcerer | 2 | 0 | 0 | 0 | 5 | 2 |
| Wizard | 2 | 0 | 0 | 0 | 5 | 2 |
| Healer | 2 | 0 | 0 | 0 | 5 | 2 |


### 26.8 Later-help spell catalogue and access

This table preserves the earlier help transcription. The supplied original MDATA2 now provides 105 records, including duplicate IDs and different values; section 26.12 and the local spell table take precedence as evidence of the local stored inputs.

The extracted [spell statistics](research/spell-statistics-updated-help.csv) retain category, base spell level, listed guild access, six requirements, combat context, targeting parameters, and source topic. The [guild spellbook table](research/spell-guild-levels-updated-help.csv) retains each listed guild-specific level. Neither supplies a certified damage or SP-cost formula.

The following counts describe the later-help extraction, **not a certified count of original executable spells**.


| Guild | Extracted spellbook assignments |
| --- | --- |
| Nomad | 2 |
| Warrior | 1 |
| Paladin | 6 |
| Ninja | 2 |
| Villain | 7 |
| Seeker | 22 |
| Thief | 2 |
| Scavenger | 2 |
| Mage | 44 |
| Sorcerer | 37 |
| Wizard | 46 |
| Healer | 34 |


The category catalogue and guild spellbooks disagree in literal naming: eight Charm names appear as Control names; Feather Essence/Essense and Precognitive/Precognative differ; the spellbook also lists Dominate Undead, Dispell Elemental, and Dispell Undead without exact matching category names in this extraction. Retain both source spellings. Resolve aliases through original IDs; do not merge records by an approximate string match.

Selected category records below demonstrate exact extracted requirements. A dash means no requirement stated in that field. “Targets” retains the printed monster/group parameter pair; its total-versus-per-group interpretation requires validation.


| Spell | Class | Base level | STR | INT | WIS | CON | CHA | DEX | Targets M/G |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Firebolt | Fire | 2 | — | 12 | 9 | — | — | — | 4/2 |
| Blue Flame | Fire | 4 | — | 14 | 10 | — | — | — | 2/1 |
| Charm Insect | Charm | 1 | — | 12 | 12 | — | — | — | 4/1 |
| Soul Entrapment | Charm | 12 | — | 18 | 21 | 18 | 22 | — | 4/1 |
| Field of Death | Kill | 14 | — | 22 | 22 | 18 | — | 21 | 20/4 |
| Teleport | Movement | 12 | — | 17 | 14 | 11 | — | 17 | 4/4 |
| Retrieve Soul | Location | 14 | — | 18 | 18 | 16 | — | 18 | — |
| Charm of Opening | Magical | 1 | 12 | 13 | 13 | — | — | 13 | — |
| Resurrect | Heal | 12 | — | 21 | 21 | 14 | — | 18 | — |


Later official help describes choosing the highest applicable learned spell power and the lowest available guild cost separately. Item casting may use the highest guild spell level unless the item specifies a level. This must not be simplified into selecting one “best guild” for both outcomes. The supplied decompiled healing branch supports an active-guild exception and positive cast-level override; see section 9.6 and F16. Runtime verification remains outstanding. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `14n5mvy.htm`, Spells.

### 26.9 Full candidate bestiary and item records

These remain public-archive tables. Local item bytes match; local Dark Shape item_1 differs (33 versus public 34). Local exports and the field comparison are in section 26.12.

The [monster CSV](research/monster-candidate-shareware.csv) contains all 401 parsed records with 64 columns, including resistance values and raw flags. The [item CSV](research/item-candidate-shareware.csv) contains all 366 parsed records with 41 columns. See the [readable bestiary table](research/monster-reference.md), [readable item table](research/item-reference.md), and [data provenance](research/bestiary-provenance.json).

The distribution mirrored by a modern remake and the independent [Internet Archive package](https://archive.org/details/MordorTheDepthsofDejenol_1020) have identical monster and item bytes. This corroborates the public shareware data, but does not prove registered-retail equivalence or all parser semantics. **Do not silently correct GOBLIE, deduplicate ID 307, or remove records with level values above 15.** Establish their original meaning first.

These selected rows are extracted candidate values. They illustrate the data available, not approved balance changes. Full resistance and attack/spell flag fields remain in the CSV.


| Monster | Record | ID | Attack | Defense | Average hits | First level parameter |
| --- | --- | --- | --- | --- | --- | --- |
| Kobold | 2 | 1 | 23 | 6 | 5 | 1 |
| Orc | 3 | 2 | 40 | 25 | 14 | 1 |
| Black Bear | 154 | 79 | 25 | 6 | 10 | 1 |
| Giant Centipede | 197 | 103 | 12 | 6 | 5 | 1 |
| Morgul | 279 | 307 | 187 | 56 | 75 | 4 |
| Shadow Ninja | 390 | 307 | 1500 | 625 | 999 | 16 |
| T'Lanea | 401 | 323 | 450 | 333 | 425 | 16 |


The community Kobold, Orc, and Black Bear pages provide secondary stat checks, but explicitly include some Mordor II material. They are not authorities for importing an entire monster definition. The Orc page describes level 2 while the candidate's stored first-level parameter is 1; this could reflect field interpretation or source differences and remains unresolved. [Kobold](https://dejenol.fandom.com/wiki/Kobold), [Orc](https://dejenol.fandom.com/wiki/Orc), [Black Bear](https://dejenol.fandom.com/wiki/Black_Bear).

### 26.10 Source fingerprints


| Input | SHA256 |
| --- | --- |
| MORDOR11.ZIP | 915fa9bc26359698b2b29a04980f7b6c433bc18dd006766aa8146e2c22cb5cb7 |
| MORDOR.WIP | df0c8fd668a02067b476cb1a65e5622c9d5cd8d5a653e627bdf446c607fb9622 |
| MDATA5.MDR | c26ebd920c94d75dc66f1ee3b664c69393770541e68b860bd55f93095b1c8739 |
| MDATA3.MDR | babf9ede941bc2f3dab073283a304d80fd59ed34d9fcd7099cde1e0f7988d7c7 |


Matching hashes establish identical inputs, not correct historical semantics. Keep these fingerprints with all subsequent field and formula comparison results.

### 26.11 Second-pass item and importer audit

These are selected factual fields from the existing 366-row candidate item table, not new balance values or approved retail rules. The second pass left all nine numerical CSV files unchanged. A machine-readable audit records their hashes, dimensions and structural checks. Record position, item ID, spell index and spell ID are intentionally separate columns.

| Item | Record | ID | A | D | Class flag | Spell index | Spell ID | Charges* | Spell level* |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Bronze Sword | 27 | 8 | 3 | 0 | -1 | 0 | 0 | 0 | 0 |
| Iron Dagger | 12 | 33 | 3 | 0 | 0 | 0 | 0 | 0 | 0 |
| Padded Leather Armor | 84 | 50 | 0 | 6 | -1 | 0 | 0 | 0 | 0 |
| Potion of Healing | 249 | 184 | 0 | 0 | 0 | 14 | 12 | 3 | 15 |
| Crystal of Healing | 290 | 253 | 0 | 0 | 0 | 14 | 12 | 12 | 15 |
| Crest of the Thief | 354 | 305 | 3 | 6 | -1 | 1 | 0 | 12 | -1 |
| Crest of the Paladin | 350 | 301 | 6 | 12 | -1 | 14 | 12 | 12 | -1 |
| Ball and Chain | 361 | 344 | 0 | -3 | 0 | 0 | 0 | 0 | 0 |

Charges and spell-level semantics (marked with an asterisk) remain provisional. A negative spell level is retained as a possible sentinel, not treated as a negative gameplay level. The charge column is the candidate 16-bit interpretation; the CSV also retains the competing combined 32-bit representation.

**Concrete implementation traps:** Crest of the Thief has spell ID zero with a nonzero spell index and charges, so a blanket zero-means-no-spell check loses information. Class-restricted `-1` and unrestricted `0` are distinct raw encodings. Iron Dagger and Padded Leather Armor illustrate that identical guild masks do not imply identical active-guild requirements. A crest's zero base price does not establish that it is freely sold. Ball and Chain's negative defense must not be clamped to zero.

| Raw field family | Interpretation gate before production use |
| --- | --- |
| Monster `average_hits`, `damage_modifier`, `size_raw` | Establish HP distribution, damage equation, size effects and numeric precision |
| Monster spawn, chest and item parameters | Establish weights versus percentages, allowed depth, room context and roll order |
| Monster attack, spell and property flags | Decode each bit and combinations; identify companion-specific behavior |
| Item `guild_flags_raw`, `level_scale_raw`, `class_restricted_raw` | Establish bit ordering and exact per-guild level derivation |
| Item `type_raw`, `hands`, `extra_swings` | Establish class hierarchy, equipment conflicts and swing count semantics |
| Item `spell_index`, `spell_id`, `spell_level` | Establish index base, ID mapping, absence representation and fixed/scaled casts |
| Item charge/deletion word | Resolve competing 16-bit/32-bit field layouts against original behavior |
| Ability, alignment and resistance masks | Keep masks separate from numeric resistances and identify every bit |
| Unused fields, unknown bits and float parameters | Preserve bytes and precision until demonstrated unused or decoded |

The structural audit checks 401 monster rows, 400 unique embedded monster IDs, 366 unique item IDs, CSV shape, and parsed record-size bounds. It does not test combat, prices, probabilities, original gameplay, or full retail completeness. No unknown field was discarded and no candidate name or number was corrected.

### 26.12 Supplied original-file findings — October 9, 2026

The new local evidence is independent of the earlier help transcription. All outputs are under `research/local-original`; the supplied `Mordor` tree is read-only. See the [local review](research/local-original-review.md), [source fingerprints](research/local-original/source-inventory.json), and [data summary](research/local-original/extraction-summary.json). File facts and static decompiler interpretations do not certify runtime parity.

| Dataset | Local extraction | Qualification |
| --- | --- | --- |
| Race and guild definitions | 9 races; 12 guilds | Includes starting allocation pools and raw spell-category matrices |
| Spell definitions | 105 records; 103 distinct embedded IDs | IDs 93 and 94 are duplicated; retain record identity |
| Item definitions | 366 records | MDATA3 bytes match the earlier public archive |
| Monster definitions | 401 physical records | Dark Shape item field differs; duplicate ID 307 remains |
| Item taxonomy | 35 subtypes; 24 classes | Equippable values include a special -1 case |
| Monster taxonomy | 18 types; 15 subtypes | Preserve raw type/flag interpretation |
| Dungeon | 15 floors × 30 × 30; 13,500 cells | Full cells, room records and transition slots exported |

**Creation pools:** each stat initially receives racial minimum + 5 in the decompiled creation screen; these additional points remain available for allocation. Subtracting a stat down to its minimum refunds points. The table does not equate pool size with total points above racial minima.

| Race | Additional pool | Alignment mask | Experience parameter |
| --- | --- | --- | --- |
| Human | 5 | 7 | 3.0 |
| Elf | 7 | 7 | 7.0 |
| Giant | 6 | 2 | 7.0 |
| Gnome | 2 | 7 | 7.0 |
| Dwarf | 10 | 2 | 5.0 |
| Ogre | 5 | 7 | 6.0 |
| Morloch | 8 | 5 | 4.0 |
| Osiri | 5 | 2 | 8.0 |
| Troll | 6 | 7 | 9.0 |

Character alignment bits are Good=1, Neutral=2, Evil=4. The local Troll mask is 7; the printed N/E restriction is not the local data rule. Local Mage quest parameter is 15, but actual assignment includes additional gates described in section 14.7.

**Spell samples:** cost and power fields are raw inputs, not final resource costs or guaranteed effects.

| Spell | ID | Base level | Cost parameter | Power base | Raw modifier |
| --- | --- | --- | --- | --- | --- |
| Charm of Opening | 0 | 1 | 10 | 0 | 0 |
| Minor Heal | 12 | 2 | 13 | 5 | 2 |
| Firebolt | 76 | 1 | 14 | 10 | 0 |
| Blue Flame | 27 | 3 | 12 | 15 | 10 |
| Heal | 29 | 4 | 26 | 15 | 5 |
| Dominate Undead | 98 | 9 | 76 | 15 | 20 |

[All spell records](research/local-original/spell-reference.md), [full spell fields](research/local-original/spells-local.csv), [derived guild access](research/local-original/guild-spell-access-local.csv), [item-to-spell references](research/local-original/item-spell-links-local.csv), and [help differences](research/local-original/spell-help-comparison.json) preserve the evidence separately.

**Dungeon manifest:** transition counts are allocated records, including zero/unused entries; they are not counts of active hazards. Non-rock does not imply reachable.

| Floor | Width | Height | Rock-flag cells | Teleporter slots | Chute slots |
| --- | --- | --- | --- | --- | --- |
| 1 | 30 | 30 | 69 | 20 | 10 |
| 2 | 30 | 30 | 60 | 20 | 10 |
| 3 | 30 | 30 | 70 | 20 | 10 |
| 4 | 30 | 30 | 57 | 20 | 10 |
| 5 | 30 | 30 | 41 | 20 | 10 |
| 6 | 30 | 30 | 66 | 20 | 10 |
| 7 | 30 | 30 | 56 | 20 | 10 |
| 8 | 30 | 30 | 47 | 20 | 10 |
| 9 | 30 | 30 | 91 | 20 | 10 |
| 10 | 30 | 30 | 52 | 10 | 10 |
| 11 | 30 | 30 | 150 | 10 | 10 |
| 12 | 30 | 30 | 55 | 10 | 10 |
| 13 | 30 | 30 | 89 | 10 | 10 |
| 14 | 30 | 30 | 70 | 10 | 10 |
| 15 | 30 | 30 | 80 | 10 | 10 |

[Cell records](research/local-original/dungeon-cells-local.csv), [room records](research/local-original/dungeon-areas-local.csv), [teleporters](research/local-original/dungeon-teleporters-local.csv), and [chutes](research/local-original/dungeon-chutes-local.csv) retain unused slots. The parser reads 201 area slots per floor rather than trusting the area count as a physical record count. Terrain flags are stored as VB Currency scaled by 10,000.

Source executable SHA256: `bd1332c37eb9d6a024d95ba1b70daf03c1a6c64c622964fb3d8bcc6297d06309`. Matching installed copies and installer members establish local consistency; they do not independently establish the distribution license or link every decompiled statement to an executable address.

### 26.13 Follow-up original-source findings — October 9, 2026

Revision 1.3 adds **twelve finding groups (O01–O12)** and **twelve runtime case families (V17–V28)**. These supplement the unchanged revision-1.2 data exports. The findings are static interpretations; runtime comparison remains outstanding.

| Source area | Recovered candidate or explicit uncertainty |
| --- | --- |
| Store | Eight bundle subtypes; alignment-stock cap nine in sale path; full-identification combining; separation versus inherent curse; indexed quote formulas |
| Inventory | Purchase searches 1–39; index-zero purpose unresolved |
| Companion services | Four purchase slots; initial binding capped at ten; paid increments four/cap twelve; separate paid raise with permanent failure loss |
| Rescue | Depth-based paid search and per-axis coordinate tolerance; distinct simulated-day waiting algorithm |
| Character raises | Pending saved offer; method-dependent threshold and HP; novice subsidy; complications and cumulative age |
| Town and age | Missing-HP rest-day calculation; living-companion-only healing; separate party/world-time questions |
| Timers and ailments | 1,000 ms combat initialization versus documented two seconds; shared minimize guard; poison/disease and exact-98%-age anomalies |

Read the [full follow-up review](research/original-followup-review.md), [fingerprinted source anchors](research/original-followup/source-manifest.json) and [whole-tree preservation check](research/original-followup/source-preservation-check.json). Reproduce provenance checks with [original-followup-audit.py](research/original-followup-audit.py). No runtime parity, complete formula recovery or executable/decompiler linkage is claimed.

## 27 Sources and supporting files

### 27.1 Primary and technical sources

| Source | What it supports | Limitation |
| --- | --- | --- |
| [David Allen’s Mordor history](https://requnix.com/development/mordor/) | Creator and 1995 origin | Short retrospective |
| [Official Mordor product page](https://www.decklinsdemise.com/mordor.htm) | Mordor 1.1, races/guilds, combat identity, distribution and ownership statement | Current page, not a build manifest |
| [Original newcomer’s manual](https://www.mocagh.org/miscgame/dejenol-manual.pdf) | Setting and original system descriptions | Introductory; some inconsistent prose |
| [Original PlayGuide](https://www.mocagh.org/miscgame/dejenol-refcard.pdf) | Race/guild numerical tables and spellbook reference | Printed tables need executable checks |
| [Original installation guide](https://www.mocagh.org/miscgame/dejenol-install.pdf) | Windows-era operation and MIDI/audio | Not a modern implementation requirement |
| [Later official help archive](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm) | Detailed system topics cited by filename | Maintained for M1 and legacy; version mixing possible |
| [Internet Archive shareware package](https://archive.org/details/MordorTheDepthsofDejenol_1020) | Independently hosted binary research input | Shareware, not registered retail certification |
| [Mirror fixture](https://github.com/matteo-prosperi/DungeonsOfDejremake/tree/main/tests/fixtures) | Second distribution of the same binary input | Modern project’s provenance claims require corroboration |
| [libDejenol](https://github.com/JKaniarz/libDejenol) | Community-authored original-file structure research | Incomplete field semantics; not the original engine |
| [Godot C# documentation](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/index.html) | Proposed desktop implementation feasibility | Engine versions must be pinned during development |

### 27.2 Secondary checks

The [CRPG Book retrospective](https://crpgbook.wordpress.com/review-index/1995-mordor-depths-of-dejenol/) supplies historical experience and dungeon dimensions. The [MobyGames overview](https://www.mobygames.com/game/31910/mordor-the-depths-of-dejenol/) supplies the commonly reported content counts. Community references are useful cross-checks, never silent replacements for the chosen original build.

Guild references: [Guild rules](https://dejenol.fandom.com/wiki/Guild), [Nomad](https://dejenol.fandom.com/wiki/Nomad), [Warrior](https://dejenol.fandom.com/wiki/Warrior), [Paladin](https://dejenol.fandom.com/wiki/Paladin), [Ninja](https://dejenol.fandom.com/wiki/Ninja), [Villain](https://dejenol.fandom.com/wiki/Villain), [Seeker](https://dejenol.fandom.com/wiki/Seeker), [Thief](https://dejenol.fandom.com/wiki/Thief), [Scavenger](https://dejenol.fandom.com/wiki/Scavenger), [Mage](https://dejenol.fandom.com/wiki/Mage), [Sorcerer](https://dejenol.fandom.com/wiki/Sorcerer), [Wizard](https://dejenol.fandom.com/wiki/Wizard), and [Healer](https://dejenol.fandom.com/wiki/Healer). Community content is attributed to the named pages; no community narrative descriptions are republished as game text.

The [Dungeons of Dej’remake project](https://github.com/matteo-prosperi/DungeonsOfDejremake) is used to identify changes that this remaster must avoid inheriting. Its public implementation source is not available for inspection; its documentation is not the original rules baseline. The second pass is pinned to commit `c932f12ec163693e120a4dc236610619f6af96ab` (October 1, 2026).

### 27.3 Supporting research files

- [Follow-up original-source review](research/original-followup-review.md), [source manifest](research/original-followup/source-manifest.json), and [revision-1.3 preservation check](research/original-followup/source-preservation-check.json)
- [Original-file review and source anchors](research/local-original-review.md), [extraction summary](research/local-original/extraction-summary.json), and [source preservation report](research/local-original/source-preservation-check.json)
- [Local races](research/local-original/races-local.csv), [guilds](research/local-original/guilds-local.csv), [items](research/local-original/items-local.csv), [monsters](research/local-original/monsters-local.csv), and [spell reference](research/local-original/spell-reference.md)
- [Research index and limitations](research/README.md)
- [Second-pass review and decisions](research/second-pass-review.md), [pinned source manifest](research/second-pass-sources.json), and [structural data audit](research/second-pass-data-audit.json)
- [World rules and source topic register](research/world-rules.md)
- [Character and spell evidence notes](research/character-rules.md)
- [Race statistics](research/race-statistics.csv), [resistances](research/race-resistances.csv), and [guild eligibility](research/race-guild-eligibility.csv)
- [Guild requirements and growth](research/guild-statistics.csv) and [ability parameters](research/guild-abilities.csv)
- [Spell statistics](research/spell-statistics-updated-help.csv) and [guild spell access](research/spell-guild-levels-updated-help.csv)
- [Bestiary research and schema notes](research/bestiary-data.md), [all monster fields](research/monster-candidate-shareware.csv), and [all item fields](research/item-candidate-shareware.csv)
- [Binary provenance and comparison](research/bestiary-provenance.json)

Research artifacts are development references. They do not establish permission to redistribute original art, audio, help text, or software as part of a remaster. No original installer or game executable was run during this research.
