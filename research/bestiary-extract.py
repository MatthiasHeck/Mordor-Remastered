"""Read-only factual export of public Mordor 1.1 data; never executes game code.

Input: original MORDOR11.ZIP distribution. Output: numeric CSVs and provenance.
Record layout reference: JKaniarz/libDejenol, MTypes.h and MLoader.cpp.
Implementation written independently for research; raw game files stay in memory.
Uninterpreted fields are retained without invented meaning.
"""
import argparse
import csv
import hashlib
import io
import json
from pathlib import Path
import struct
import zipfile


class Reader:
    def __init__(self, data):
        self.data, self.pos = data, 0

    def get(self, fmt):
        value = struct.unpack_from('<' + fmt, self.data, self.pos)[0]
        self.pos += struct.calcsize('<' + fmt)
        return value

    def string(self):
        length = self.get('H')
        value = self.data[self.pos:self.pos + length].decode('cp1252')
        self.pos += length
        return value


def sha(data):
    return hashlib.sha256(data).hexdigest()


def record(data, size, index):
    return Reader(data[size * index:size * (index + 1)])


def add_fields(r, out, names, fmt='h'):
    for name in names.split():
        out[name] = r.get(fmt)


def extract_monsters(data):
    size = 160
    assert record(data, size, 0).string() == '1.1'
    count = record(data, size, 2).get('h')
    rows = []
    for i in range(count):
        r = record(data, size, i + 3)
        out = {'record_index': i + 1, 'name': r.string()}
        add_fields(r, out, 'attack defense monster_id average_hits group_count picture_id locked_chest_chance first_level')
        for kind in ('fire', 'cold', 'electrical', 'mind', 'disease', 'poison', 'magic', 'stone', 'paralysis', 'drain', 'acid', 'unused_12'):
            out['resistance_' + kind] = r.get('h')
        add_fields(r, out, 'property_flags_raw attack_flags_raw spell_flags_raw', 'I')
        add_fields(r, out, 'spawn_chance chest_chance_1 chest_chance_2 chest_chance_3 chest_chance_unused_4 alignment members_per_group')
        add_fields(r, out, 'gold_factor trap_flags_raw', 'I')
        add_fields(r, out, 'guild_level')
        for stat in ('strength', 'intelligence', 'wisdom', 'constitution', 'charisma', 'dexterity', 'unused_7'):
            out['stat_' + stat] = r.get('h')
        add_fields(r, out, 'type_raw')
        add_fields(r, out, 'damage_modifier', 'f')
        add_fields(r, out, 'companion_type_raw companion_spawn_mode_raw companion_id')
        for j in range(11):
            out['item_' + str(j + 1)] = r.get('h')
        add_fields(r, out, 'subtype_raw companion_subtype_raw size_raw item_drop_level item_chance')
        out['record_bytes_read'] = r.pos
        rows.append(out)
    return rows


def extract_items(data):
    size = 125
    assert record(data, size, 0).string() == '1.1'
    count = record(data, size, 2).get('h')
    rows = []
    for i in range(count):
        r = record(data, size, i + 3)
        out = {'record_index': i + 1, 'name': r.string()}
        add_fields(r, out, 'item_id attack defense')
        add_fields(r, out, 'base_price', 'i')
        add_fields(r, out, 'first_level rarity_raw')
        add_fields(r, out, 'ability_flags_raw', 'I')
        add_fields(r, out, 'extra_swings special_type_raw spell_index spell_id')
        # Two 16-bit fields in MTypes.h; MLoader.cpp instead reads one dword.
        # Keep the raw value plus both halves until original executable validates.
        add_fields(r, out, 'charges_candidate deleted_candidate')
        out['charges_deleted_raw32'] = (out['deleted_candidate'] & 65535) * 65536 + (out['charges_candidate'] & 65535)
        add_fields(r, out, 'guild_flags_raw', 'I')
        add_fields(r, out, 'level_scale_raw')
        add_fields(r, out, 'damage_modifier', 'f')
        add_fields(r, out, 'alignment_flags_raw', 'I')
        add_fields(r, out, 'hands type_raw')
        add_fields(r, out, 'resistance_flags_raw', 'I')
        for prefix in ('required_', 'modifier_'):
            for stat in ('strength', 'intelligence', 'wisdom', 'constitution', 'charisma', 'dexterity', 'unused_7'):
                out[prefix + stat] = r.get('h')
        add_fields(r, out, 'cursed_raw spell_level class_restricted_raw')
        out['record_bytes_read'] = r.pos
        rows.append(out)
    return rows


def write_csv(path, rows):
    with path.open('w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=rows[0])
        writer.writeheader()
        writer.writerows(rows)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('archive', type=Path)
    parser.add_argument('--out', type=Path, default=Path(__file__).parent)
    args = parser.parse_args()
    raw = args.archive.read_bytes()
    outer = zipfile.ZipFile(io.BytesIO(raw))
    inner_raw = outer.read('MORDOR.WIP')
    inner = zipfile.ZipFile(io.BytesIO(inner_raw))
    monsters_raw, items_raw = inner.read('MDATA5.MDR'), inner.read('MDATA3.MDR')
    monsters, items = extract_monsters(monsters_raw), extract_items(items_raw)
    # Retain irregular records for the evidence audit; never silently deduplicate.
    duplicates = {str(row['monster_id']): [m['name'] for m in monsters if m['monster_id'] == row['monster_id']]
                  for row in monsters if sum(m['monster_id'] == row['monster_id'] for m in monsters) > 1}
    assert len({row['item_id'] for row in items}) == len(items)
    assert all(0 <= row['record_bytes_read'] <= 160 for row in monsters)
    assert all(0 <= row['record_bytes_read'] <= 125 for row in items)
    assert all(row['name'] and row['name'].isprintable() for row in monsters + items)
    args.out.mkdir(parents=True, exist_ok=True)
    write_csv(args.out / 'monster-candidate-shareware.csv', monsters)
    write_csv(args.out / 'item-candidate-shareware.csv', items)
    provenance = {
        'research_date_local': '2026-10-08',
        'distribution': 'MORDOR11.ZIP / PUBLIC shareware / data header 1.1',
        'source_url': 'https://raw.githubusercontent.com/matteo-prosperi/DungeonsOfDejremake/main/tests/fixtures/MORDOR11.ZIP',
        'schema_sources': [
            'https://github.com/JKaniarz/libDejenol/blob/master/libDejenol/MTypes.h',
            'https://github.com/JKaniarz/libDejenol/blob/master/libDejenol/MLoader.cpp',
            'https://github.com/JKaniarz/libDejenol/blob/master/libDejenol/RecordReader.h'
        ],
        'sha256': { 'MORDOR11.ZIP': sha(raw), 'MORDOR.WIP': sha(inner_raw), 'MDATA5.MDR': sha(monsters_raw), 'MDATA3.MDR': sha(items_raw) },
        'monster_record_count': len(monsters),
        'status': 'QUARANTINED_CANDIDATE_NOT_CANONICAL',
        'duplicate_monster_ids': duplicates,
        'unexpected_first_monster_name': monsters[0]['name'],
        'item_record_count': len(items),
        'raw_assets_written': False,
        'original_programs_executed': False,
        'limitations': [
            'Shareware reference data, not independently compared to registered retail copy.',
            'Field names are community format interpretations; not all semantics verified in original executable.',
            'Monster header contains 401 records and duplicate IDs; do not load this candidate as production rules.',
            'First monster name GOBLIE and duplicate ID 307 indicate possible edited data; authenticity unresolved.',
            'Item charges/deleted interpretation differs between upstream type and loader; both halves and combined raw value preserved.',
            'Probabilities, damage formulas, flag meanings and timing require behavioral verification.'
        ]
    }
    (args.out / 'bestiary-provenance.json').write_text(json.dumps(provenance, indent=2) + '\n', encoding='utf-8')
    print(json.dumps({'monsters': len(monsters), 'items': len(items), 'first_monster': monsters[0], 'last_monster': monsters[-1], 'first_item': items[0]}, indent=2))


if __name__ == '__main__':
    main()
