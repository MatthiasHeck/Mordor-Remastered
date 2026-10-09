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
