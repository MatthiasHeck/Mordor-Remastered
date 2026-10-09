# Character and spell evidence notes

**October 9 update:** the [supplied original-file review](local-original-review.md) adds local race/guild inputs and 105 spell records, creation pools and static SP/A-D, HP-growth, healing and quest logic. Its source-specific findings supersede unresolved claims below where explicitly identified. These earlier notes and printed/help CSVs remain historical transcriptions; static evidence is still distinct from runtime verification.

The main design document contains the numerical tables. The CSV files are the reusable transcription. Sources are the [original PlayGuide](https://www.mocagh.org/miscgame/dejenol-refcard.pdf), the [official later help archive](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), and clearly labeled community comparisons.

## Printed race and guild tables

The race, resistance, guild eligibility, guild requirement, and guild ability CSVs were transcribed from the PlayGuide and checked visually against the scanned pages. Stat ranges are minima and printed natural maxima. Age is approximate. Experience parameters are not direct percentages. Guild ability parameters are not success chances. Printed dashes/blanks normalized to zero are identified in each affected file.

The primary reviewer corrected the initial Scavenger alignment transcription: the printed table contains all three G/N/E marks. There is no remaining Scavenger alignment conflict. Troll's printed row does have only N/E, while the later help and community table permit G/N/E. Preserve the conflict until creation is checked in the selected executable.

Mage's printed quest probability is 15%; the [community Mage page](https://dejenol.fandom.com/wiki/Mage) reports 20%. Do not overwrite the printed value or average them. The selected original build must decide which ruleset applies.

## Later official help

The downloaded CHM is explicitly linked for modern M1 and the legacy game. Some topics contain modern wording and a 2026 footer. It is primary publisher documentation but not independently certified as unchanged 1995 text.

Useful topic filenames within `official-help/html/`:

| Topic | File |
| --- | --- |
| Character Information | `81ywhd.htm` |
| Creating a Character | `ye.co6.htm` |
| Race tables | `31qxif1.htm` |
| Guild tables | `d7eivm.htm` |
| Spell explanation | `14n5mvy.htm` |
| Item behavior | `5hmud3.htm` |

The help describes allocation of creation stat points and displays guild eligibility, but the exact point budget by race and starting resources have not been executable-verified. Do not substitute a randomly rolled or generic point-buy system.

The help distinguishes natural-stat requirements for guilds and items from modified-stat eligibility for spells. It describes spell power and spell cost as potentially chosen from different guild capabilities. These distinctions are explicitly preserved in the design, while exact equations and rounding remain unresolved.

## Spell extraction

`spell-statistics-updated-help.csv` contains 100 category records across 18 category names. `spell-guild-levels-updated-help.csv` contains 205 guild assignments with 103 distinct literal spell names. This is an extraction census, not a certified count of original spells.

Naming differences remain literal: category Charm names versus guild Control names; Feather Essence versus Essense; Precognitive versus Precognative; and unmatched Dominate Undead, Dispell Elemental, and Dispell Undead spellbook entries. The category extractor did not produce complete numeric effect formulas. Its power columns are empty because no corresponding numeric power pattern was found in the effect lines; empty does not mean zero.

The monster/group target columns are parameters transcribed from the help. Their interpretation as per-group or total targets is not settled by the wording. Combat/noncombat context was parsed from the effect line, not inferred from the spell's name. Per-row topic filenames permit a direct review of the source.

Printed-versus-later-help spell levels also require comparison. Examples noted during visual review are Sorcerer Firebolt, Blue Flame, and Electric Field. No one table has been silently promoted to final game data.

## Remaining work

Compare creation outcomes; natural and modified stat boundaries; race caps and stat-gain items; every guild eligibility combination; XP and HP breakpoints; Constitution bonus distributions; the level cap; all guild/spell associations; SP costs and power; and status interactions in the chosen registered build. Documented values are strong test inputs, but those comparisons have not been run.
