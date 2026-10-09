"""Audit unchanged factual tables and record the revision-pinned research inputs.

Run after downloading public help pages into TEMP/mordor-second-pass.
This performs structural checks, not original-game behavioral verification.
"""
import csv
import hashlib
import json
import os
from pathlib import Path

R = Path(__file__).resolve().parent
REV = 'c932f12ec163693e120a4dc236610619f6af96ab'
BASE = 'https://github.com/matteo-prosperi/DungeonsOfDejremake/blob/' + REV


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def read(name):
    with (R / name).open(encoding='utf-8', newline='') as f:
        reader = csv.DictReader(f)
        rows = list(reader)
        assert all(None not in row and None not in row.values() for row in rows)
        return rows, reader.fieldnames


def table(headers, rows):
    def line(values):
        return '| ' + ' | '.join(str(x).replace('|', '\\|') for x in values) + ' |'
    return '\n'.join([line(headers), line(['---'] * len(headers))] + [line(row) for row in rows])


expected = {
    'race-statistics.csv': 9, 'race-resistances.csv': 9,
    'race-guild-eligibility.csv': 9, 'guild-statistics.csv': 12,
    'guild-abilities.csv': 12, 'spell-statistics-updated-help.csv': 100,
    'spell-guild-levels-updated-help.csv': 205,
    'monster-candidate-shareware.csv': 401, 'item-candidate-shareware.csv': 366,
}
datasets = {}
for name, count in expected.items():
    rows, fields = read(name)
    assert len(rows) == count, (name, len(rows), count)
    datasets[name] = {'rows': len(rows), 'columns': len(fields), 'sha256': sha(R / name)}
items, _ = read('item-candidate-shareware.csv')
monsters, _ = read('monster-candidate-shareware.csv')
assert len({m['monster_id'] for m in monsters}) == 400
assert len({i['item_id'] for i in items}) == 366
assert all(int(m['record_bytes_read']) <= 160 for m in monsters)
assert all(int(i['record_bytes_read']) <= 125 for i in items)

topics = ['index', 'character-creation', 'character-sheet', 'guild-hall',
          'general-store', 'dungeon', 'changelog', 'companion-store', 'library', 'bank']
cache = Path(os.environ['TEMP']) / 'mordor-second-pass'
manifest = {
    'review_date_local': '2026-10-08', 'repository_revision': REV,
    'revision_committed_at': '2026-10-01T04:09:24Z',
    'implementation_source_inspected': False,
    'original_program_executed': False,
    'sources': [{'path': 'docs/help/' + t + '.md',
                 'url': BASE + '/docs/help/' + t + '.md',
                 'sha256': sha(cache / (t + '.md'))} for t in topics],
    'publisher_help': {
        'url': 'https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm',
        'sha256': sha(R / 'official-help-M1B040b.chm'),
        'status': 'LATER_OFFICIAL_HELP_ORIGINAL_EDITION_PARITY_UNVERIFIED'
    }
}
(R / 'second-pass-sources.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
audit = {
    'status': 'STRUCTURAL_CHECKS_ONLY_NOT_RUNTIME_PARITY',
    'datasets': datasets,
    'monster_unique_ids': 400,
    'item_unique_ids': 366,
    'item_class_restricted_values': sorted({int(i['class_restricted_raw']) for i in items}),
    'item_negative_spell_levels': sum(int(i['spell_level']) < 0 for i in items),
    'charged_items_with_zero_spell_id': [i['name'] for i in items if int(i['charges_candidate']) > 0 and i['spell_id'] == '0'],
}
(R / 'second-pass-data-audit.json').write_text(json.dumps(audit, indent=2) + '\n', encoding='utf-8')

selected = ['Bronze Sword', 'Iron Dagger', 'Padded Leather Armor', 'Potion of Healing',
            'Crystal of Healing', 'Crest of the Thief', 'Crest of the Paladin', 'Ball and Chain']
by_name = {i['name']: i for i in items}
fields = ['name', 'record_index', 'item_id', 'attack', 'defense', 'class_restricted_raw',
          'spell_index', 'spell_id', 'charges_candidate', 'spell_level']
sample = table(['Item', 'Record', 'ID', 'A', 'D', 'Class flag', 'Spell index', 'Spell ID', 'Charges*', 'Spell level*'],
               [[by_name[n][f] for f in fields] for n in selected])
appendix = '''### 26.11 Second-pass item and importer audit

These are selected factual fields from the existing 366-row candidate item table, not new balance values or approved retail rules. The second pass left all nine numerical CSV files unchanged. A machine-readable audit records their hashes, dimensions and structural checks. Record position, item ID, spell index and spell ID are intentionally separate columns.

''' + sample + '''

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
'''
(R / 'second-pass-appendix.md').write_text(appendix, encoding='utf-8')
print(json.dumps(audit, indent=2))
