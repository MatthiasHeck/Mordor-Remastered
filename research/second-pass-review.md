# Second research pass: original fidelity review

Reviewed October 8, 2026. This review updates the design to version 1.1 in the renamed **Mordor Remastered** folder. It supplements the earlier research; it does not certify runtime parity or replace the reference datasets.

## Research boundary

The user-supplied [DungeonsOfDejremake repository](https://github.com/matteo-prosperi/DungeonsOfDejremake) was inspected at commit **c932f12ec163693e120a4dc236610619f6af96ab**, dated October 1, 2026. The repository publishes documentation and release material, but its README says the game implementation source is not published. Consequently this pass inspected public documentation, not engine formulas or a private test suite. Its original shareware fixture was already independently corroborated in the first pass.

The [source manifest](second-pass-sources.json) records revision-pinned URLs and SHA256 hashes of the help pages actually retrieved. These pages describe a different remake. Original-format research, later publisher help, and observed original behavior have different evidentiary roles.

## Decisions integrated into the design

| Review ID | Finding and disposition | Design location |
| --- | --- | --- |
| R01 | Preserve path-dependent HP advancement; do not reconstruct earned HP from current guild levels and CON | 6.5 |
| R02 | Keep proposed stat formulas as hypotheses, with boundary experiments, rather than certified original equations | 4.5 |
| R03 | Healing power may be an exception to general multi-guild spell selection; unresolved | 9.6; F16 |
| R04 | Define equip versus use, item alignment, class restrictions, and carried capacity explicitly | 12.5–12.7 |
| R05 | Extra physical swings are documented as kill-dependent; test misses, survivors and group boundaries | 8.6 |
| R06 | Preserve item-type-specific sale and recharge behavior; reject a universal partial-charge rule | 13.4; F17 |
| R07 | Separate charged crests and involuntary cursed attachment from ordinary equipment workflows | 12.8; F18 |
| R08 | Treat healing and resurrection spells as distinct effects and context restrictions | 9.7 |
| R09 | Exclude new combat stances, automatic buff maintenance, and encounter pity rules | 2.4; 23.6 |
| R10 | Preserve original inventory occupancy despite separate equipment and pack panels | 12.5 |
| R11 | Retain raw flags, floats, zero IDs, and index/ID pairs without convenience normalization | 22.7; 26.11 |
| R12 | Record new scenario-based comparison fixtures; none is claimed executed | 23.6 |

## Repository evidence and its limits

- [Guild Hall](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/guild-hall.md): explicitly changes HP to a deterministic function, making advancement order irrelevant. Reject that change. Its account of original randomness is a secondary lead; recover the precise original distribution independently.
- [Character creation](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/character-creation.md): suggests concrete stat-band and SP hypotheses for comparison. Starting equipment and allocation details remain unapproved as original rules.
- [Character sheet](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/character-sheet.md): says healing formerly depended on the active guild. This conflicts with the general rule in later publisher help. Neither establishes a tested exception in registered 1.1.
- [General Store](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/general-store.md): its account of original partial-charge disposal is broader than the publisher help's consumable/rechargeable distinction. Retain the distinction and test each category.
- [Dungeon](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/dungeon.md): its approximately one-second timer and new Tank action are not original defaults. Its fixed player-first description must not establish initiative for this remaster.
- [Changelog](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/changelog.md): useful leads include crest charging, cursed attachment, relocation events, and a hostile opening strike. Claims of fidelity still need reference checks. A Seer-linked encounter escalation is excluded without original evidence. The opening-strike entry also qualifies the dungeon page's absolute player-first wording.
- [Bank](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/bank.md), [Library](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/library.md), and [companion store](https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/c932f12ec163693e120a4dc236610619f6af96ab/docs/help/companion-store.md) were reviewed for service boundaries. They do not authorize changing original banking, map knowledge, or companion control.

## Publisher-help cross-checks

The previously downloaded [official M1 help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm) remains a **later source**, with modern and legacy material mixed. This pass reread these local topics:

| Topic | Contribution to this revision |
| --- | --- |
| `5hmud3.htm` — Items | Forty character item slots; equipment-class exclusivity; aligned equipment versus direct use; current-guild restriction; kill-dependent extra swings |
| `irl356.htm` — Store | Charge chunks; combining; rechargeable equipment versus consumables; identification during uncurse; bank fallback |
| `14n5mvy.htm` — Spells | Independent selection of spell power and cost; item spell level; combat/non-combat context |
| `d7eivm.htm` — Guild statistics | Highest-level HP gate, growth breakpoints, highest rather than summed abilities |
| `81ywhd.htm` — Character information | Natural versus modified statistics; CON bonus threshold; SP inputs |
| `ye.co6.htm` — Creation | Adjustable stat allocation and eligibility feedback; not a verified numerical creation budget |
| `9dns9..htm` — Game screen | Information gated by identification; guild ability display scale; item and spell detail fields |
| `60.eu..htm` — Heal spells | Different heal, cure and resurrection effects; combat eligibility |

The item examples were cross-checked against the existing candidate CSV. No numeric row was edited. Notably, **spell ID zero cannot automatically mean “no spell”**: the Crest of the Thief candidate has `spell_index=1`, `spell_id=0`, and a nonzero charge field. This is an importer warning, not a decoded spell assignment.

## Remaining proof obligations

This pass did not run original Mordor, verify registered retail files, inspect unpublished remake source, or establish exact HP, SP, damage, pricing, initiative, or healing formulas. F16–F19 extend the existing conflict register. All comparison scenarios remain planned tests. Data counts and table integrity can be checked now; original behavioral equivalence cannot be claimed from those checks.
