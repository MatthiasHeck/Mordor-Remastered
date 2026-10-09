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
