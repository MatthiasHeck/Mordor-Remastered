# Supplied original files: preservation review

Research date: October 9, 2026. Supports revision 1.2 of the [design document](../Mordor%20Remastered%20Design%20Document.md).

The supplied source tree is `D:\Programming Projects\Mordor`. It was treated as read-only. All new parsers, exports, comparisons and documentation are in `D:\Programming Projects\Mordor Remastered`. No original game, installer, decompiler or supplied exporter was executed. The audit inventoried 1,273 source files totaling 1,095,498,352 bytes; review concentrated on installed data, packaging and the relevant decompiled routines, not every build artifact.

## Evidence and source identity

Three evidence levels must remain separate: **file fact** (bytes directly extracted from a fingerprinted input), **static interpretation** (behavior inferred from supplied decompiler output), and **runtime verification** (not performed in this review). Static findings are stronger leads than remake documentation, but are not a claim to have recovered the author's source code. `POOP` contains substantial VB decompiler output with generated identifiers and malformed statements. Its relationship to the installed executable still needs address-level or controlled behavioral verification.

The two installed `MORDOR.EXE` copies match. Installed EXE, HLP, MDATA1, MDATA2, MDATA3 and MDATA5 also match their members in the local `Mordor/setup/MORDOR.WIP`. MDATA11 is separate from that archive. All encountered copies of each static MDATA1/2/3/5/11 file match; mutable character/world files have differences and must not be treated as alternate rulesets merely because their hashes differ.

| File | SHA256 |
| --- | --- |
| MORDOR.EXE | `bd1332c37eb9d6a024d95ba1b70daf03c1a6c64c622964fb3d8bcc6297d06309` |
| MORDOR.HLP | `88ee3d1288aa1651a6670bb8be1ab99d5ea07f9c1cb2a80db61178caef142b84` |
| MDATA1.MDR | `b8086bf87fb71c86a6bf8c4654b6437160bacf6e3f318be4c0e63e96bc2d032f` |
| MDATA2.MDR | `cd811db2c9067a392835e740c6a94a587bb0235cb173eb91682e8f69001908dd` |
| MDATA3.MDR | `babf9ede941bc2f3dab073283a304d80fd59ed34d9fcd7099cde1e0f7988d7c7` |
| MDATA5.MDR | `dc95efef50ef62eb6063a11b3fa9a116a06a4dab7d0000804e39324324a6c124` |
| MDATA11.MDR | `0cfc52dc554f9a3362a222ad19f87a13cb829b50a3818574fa8fcbccd2d757a1` |

The data headers identify version 1.1. [Decompiled constants](<D:/Programming Projects/Mordor/POOP/main.txt:31>) include fifteen floors, version 1.1 and the date string `7/20/95`. This string is not independent proof of a shipping date or first-retail identity. The files provide a concrete local baseline candidate with full maps; registered-distribution provenance remains to be established.

See the [whole-tree inventory](local-original/source-inventory.json), [file-copy comparison](local-original/file-comparison.json), [installer-member comparison](local-original/installer-member-comparison.json), and [final source-preservation check](local-original/source-preservation-check.json).

## What was extracted

| Input | Output coverage |
| --- | --- |
| MDATA1 | 9 races, 12 guilds, allocation pools, guild/category matrices, 35 item subtypes, 24 item classes, 18 monster types, 15 monster subtypes |
| MDATA2 | 105 physical spell records with 103 distinct embedded IDs; raw costs, powers, requirements, effect and resistance fields |
| MDATA3 | 366 item records; complete parsed fields retained |
| MDATA5 | 401 monster records with 400 distinct embedded IDs; complete parsed fields retained |
| MDATA11 | 15 floors of 30×30 cells, 13,500 cells, 3,015 allocated area records, teleporter and chute slots |
| Decompiled global initialization | Indexed labels for spell categories, effects, fatal conditions and terrain flags |

The [summary](local-original/extraction-summary.json) and [audit script](local-original-audit.py) describe the extraction. Existing printed/help/public-archive tables are retained as historical source transcriptions; local tables are separate, not silently merged replacements.

Compared printed race minima/maxima, lifespan and experience parameters, guild stat requirements and growth/experience/quest parameters agree with local values. The compared alignment masks have one disagreement: **Troll is 7 (Good/Neutral/Evil) locally**, versus printed 6 (Neutral/Evil). Local Mage quest parameter is **15**. This parameter is not, by itself, the final probability of assignment. See [compared fields and differences](local-original/printed-local-differences.json).

Local item bytes match the public archive exactly. The parsed monster comparison has one field difference: **Dark Shape, physical record 266, `item_1` is 33 locally versus 34 publicly**. This is a stored item field, not proof of a particular drop probability. All other compared monster fields match. Preserve `GOBLIE`, duplicate monster ID 307 and first-level values above 15. See [field differences](local-original/public-local-field-differences.json).

## Character creation and derived statistics

[CHARCREA.cmbRace_Click](<D:/Programming Projects/Mordor/POOP/CHARCREA.bas:48>) initializes each natural stat to racial minimum + 5. The additional pool is Human 5, Elf 7, Giant 6, Gnome 2, Dwarf 10, Ogre 5, Morloch 8, Osiri 5, Troll 6. Decreasing a stat refunds points down to its racial minimum. Thus the pool is additional to the thirty points initially distributed across six stats. Unspent points can be accepted after confirmation. Preserve the individual bounds, rather than equalizing races.

The creation initialization routine sets age to `16 × 365` days, carried gold to 1,500, bank balance to zero, current/maximum HP to 15, Nomad level to 1, active guild to Nomad, and location to town (floor 0; stored coordinates 9,11). Initial raw attack and defense are 10 before the stat adjustment call. No starter-equipment grant appears in that routine; this does not prove that no other initialization path supplies equipment. The name validation rejects `|` and duplicates. Sex is stored; absence of mechanical consequences has not been established. [Creation code](<D:/Programming Projects/Mordor/POOP/CHARCREA.bas:211>).

[Module6.fn1338](<D:/Programming Projects/Mordor/POOP/Module6.bas:2650>) reads natural INT and WIS for maximum SP: `5 × (INT + WIS)`. [Module6.sub047C](<D:/Programming Projects/Mordor/POOP/Module6.bas:4467>) uses natural plus modifier values for stat contributions to both attack and defense: STR/DEX contribute zero at 8–12 inclusive, −2 per point below 8 and +2 per point above 12; INT/WIS contribute zero at 8–14 inclusive, −1 below 8 and +1 above 14. CON/CHA have no contribution in this particular adjustment. The routine removes old contributions and adds new ones; those modes must not be implemented as two cumulative bonuses. Guild and equipment calculations remain separate parts of the total.

## HP advancement

[FRMCTYG.cmdMake_Click](<D:/Programming Projects/Mordor/POOP/FRMCTYG.bas:349>) supplies a concrete static algorithm. Let N be the newly attained level, AH the guild's base HP parameter, ML its breakpoint, and MH its later gain. Each U below represents a separate original random draw:

1. HP growth occurs only if N strictly exceeds every other guild level.
2. If N > ML, add MH.
3. Otherwise, start with AH. Draw `floor(U × 3) + 1`; outcomes 1 or 2 add `floor(U × AH / 5) + 1`, using another draw. Outcome 3 adds no random increment.
4. Within that latter branch, natural CON > 16 adds `floor(U × (CON − 16)) + 1` only when **N < ML**.
5. Cap maximum HP at **999**. Set current HP to maximum after advancement, including when no maximum-HP gain was awarded.

This contradicts treating Nomad's printed AH=5 as a guaranteed fixed five-point gain before its breakpoint. The random AH increment still applies at N=ML, but the CON increment does not. Test ties, ML−1/ML/ML+1, CON 16/17 and the cap before approving executable parity. Retain historical earned HP; do not reconstruct it deterministically from current levels.

## Spells, identity and guild access

The 105 records include **duplicate embedded ID 93** for Mass Sight Veil (record 99) and Mass Protection (101), and **duplicate ID 94** for Fate (100) and She'tal (102). Use record index plus source fingerprint as extraction identity; an ID-keyed dictionary would lose two records. Item links are one-based physical spell references with a separately stored ID: all 132 positive references agree with their target's embedded ID, including the Crest of Thief's reference to ID 0, **Charm of Opening**. Zero is therefore a valid spell ID, not universally “no spell.” [Spell table](local-original/spell-reference.md), [item links](local-original/item-spell-links-local.csv).

The MDATA1 category matrix and [guild advancement checks](<D:/Programming Projects/Mordor/POOP/FRMCTYG.bas:310>) derive 205 guild/spell relationships across 101 physical spell records. Fate, She'tal, Life Domination and Shock Lance have base level 50 and no ordinary guild relationship from this matrix. Preserve their records without automatically exposing them as learnable or declaring them unused.

Access checks include category multiplier > 0, category cap at least spell base level, required product `base level × multiplier`, and available spell level `floor(guild level / 2 + 0.5)`. Natural plus modified stats are checked by [fn10E5](<D:/Programming Projects/Mordor/POOP/Module6.bas:1362>). The exported guild-level threshold is a **derived candidate**, not a measured UI unlock. Retain matrix columns and operation order. [Derived access table](local-original/guild-spell-access-local.csv).

There are 92 exact-name matches with the later-help category extraction and nine differing compared fields. Local base levels include Cause Wounds 1 (help 2), Firebolt 1 (2), Blue Flame 3 (4), Cause Heavy Wounds 3 (4). Charm Humanoid requires INT/WIS/CHA 14/14/14 (help 16/16/18); Charm Undead WIS is 15 (17); Piercing Darkness INT is 19 (17). Local and help names also differ, including Control/Bind terminology and spellings such as `Feather Essense`. Keep edition-specific names and explicit aliases; never resolve duplicates or spelling changes by guesswork. [Detailed comparison](local-original/spell-help-comparison.json).

Stored `M556D` is a cost input; it is not the final SP price. [fn142F](<D:/Programming Projects/Mordor/POOP/Module6.bas:2882>) considers guild-derived levels, multipliers and bounds. Its candidate calculation includes `floor((required level / available level) × cost parameter × multiplier × 1.9)`, with minimum/bound selection bookkeeping requiring a complete trace. Preserve VB conversions instead of simplifying this into a universal formula. The spell-detail display adds one to the raw power modifier ([line 4837](<D:/Programming Projects/Mordor/POOP/Module6.bas:4837>)); display values and runtime coefficients must remain distinct.

## Healing exception: stronger evidence for F16

The positive-power healing/cure branch in [Module6.fn1173](<D:/Programming Projects/Mordor/POOP/Module6.bas:636>) selects `L = floor(active guild level / 2 + 0.5)` when its explicit cast-level argument is non-positive. A positive argument overrides it. L is clamped to at least one. [Spellbook invocation](<D:/Programming Projects/Mordor/POOP/FRMCHAR3.bas:182>) passes zero. [Direct item use](<D:/Programming Projects/Mordor/POOP/Module6.bas:6210>) passes the item's level field. This supports active-guild healing and a positive fixed-level item override; it does not establish that all spell families use the active guild.

For this branch, B is the raw power base, M the raw modifier and U a random draw:

```text
E = B + B × log10(L) + floor((L / 10) × M)
R = floor(U × (E − (L − 1) / L²) / 2) + 1
healing = floor(E − R)
```

The recipient's resulting HP is capped at its maximum; the recipient loop draws separately. Single-precision temporaries, `Int` and implicit VB conversions still require faithful emulation. SP-cost arbitration is a separate routine. Keep original active-guild comparisons, fixed-level items, non-positive-level items, companion healing and mass effects in the runtime test matrix.

## Item use, town payments and quests

[Module6.sub1577](<D:/Programming Projects/Mordor/POOP/Module6.bas:6151>) reveals an important exception to the later help's blanket alignment statement: a differently aligned **spell-casting item** can print “Nothing Happens” and exit before charge debit. A later general-item path debits before checking alignment. Do not implement “all failed alignment uses consume a charge.” Resolve by item/effect path in executable tests (F21).

Item taxonomy includes 24 classes and an exceptional `equippable_raw = -1` for Miscellaneous Object. Keep raw values until the UI and eligibility branches are interpreted; a convenient generic boolean can lose semantics. The decompiled item structure uses adjacent 16-bit fields for charges and the following field. The latter's meaning is not established merely by a third-party “deleted” label.

[Module6.fn114E](<D:/Programming Projects/Mordor/POOP/Module6.bas:395>) pays from carried gold first. If that is insufficient but the combined total covers the cost, it zeros carried gold and deducts the remainder from the bank; insufficient combined funds reject the payment. Verify service callers separately; this is not an instruction to auto-bank gold.

[Quest assignment](<D:/Programming Projects/Mordor/POOP/FRMCTYG.bas:456>) uses more than the raw QP parameter. Levels below five force a rejecting roll; the routine clears prior quest state, checks a `Rnd × 100` result assigned to a VB Integer against QP, and then performs a further random “off the hook” check. Item quests additionally require level >15 and another selection condition. Consequently QP=15 must not be displayed or tested as exactly a flat 15% final assignment rate. Preserve implicit conversion separately from `Int`; verify random draw order and all boundary cases.

The [fatal-condition labels](<D:/Programming Projects/Mordor/POOP/Module1.bas:444>) distinguish Dead, Stoned, Destroyed, Immolated, Frozen, Annihalated, Melted and Rock (source spelling retained). Preserve condition identity; recovery eligibility and irreversible loss must be traced per branch.

## Dungeon layout and parser cautions

MDATA11 uses 20-byte physical records and a floor-offset directory. Each floor has a header, 900 cells and **201 allocated area slots**, followed by transition tables. The header's area count is not the number of physical area slots to skip. Teleporter tables allocate 20 entries on floors 1–9 and 10 on floors 10–15; chute tables allocate ten per floor. Zero/unused entries remain in the exports. Terrain flags use VB Currency storage scaled by 10,000; rock is bit 19, consistent with decompiled labels. [Coordinate helpers](<D:/Programming Projects/Mordor/POOP/Module3.bas:73>) support one-based x/y addressing. Orientation, reachability and activation need runtime overlays, not assumptions from non-rock counts.

The source folder's existing `export_MDATA2_to_csv.py` assumes a fixed 37-byte spell name and placeholder version logic. The local C++ spell reader also skips the first record and omits a 16-bit field after the cost input. Neither is a reliable source of final spell values. The new parser instead follows the VB loader and `T5AFD` structure: 75-byte physical records; version and count in the first two records; first spell in record three; a two-byte length prefix plus variable string followed by nineteen signed 16-bit values. Bytes after the used payload are padding, sometimes containing stale strings. Stop at the declared count.

`VBRUN300.reko` is disassembly of the VB runtime, not a recovered Mordor rules module. The local libDejenol README also identifies unfinished GameData and character-loading coverage. These artifacts are useful corroboration and discovery tools; they must not silently become the implementation specification.

## Next verification gates

Freeze the local baseline manifest, connect critical decompiled routines to that executable, then capture original behavior for creation, HP breakpoints, healing, item alignment and quest assignment. Validate dungeon coordinates and every transition against the original automap. Resolve duplicate spell identity and library selection before building ID indexes. Further work remains on combat RNG/timing, complete cost and service formulas, companions, death/rescue and lossless save import. This review supplies concrete data and narrower hypotheses; it does not certify behavioral parity.

Reproduction: run `local-original-audit.py --snapshot` once before source inspection, run `local-original-audit.py` for exports, and run `local-original-audit.py --verify` afterward. The script never opens source files for writing. The snapshot is intentionally not overwritten. Its final verification compares the complete relative path set, byte sizes and SHA256 digests.
