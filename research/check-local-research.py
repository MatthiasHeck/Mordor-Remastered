"""Check exported evidence and preservation of earlier source transcriptions."""
from pathlib import Path
import csv, hashlib, json, re

root = Path(__file__).resolve().parent
local = root / 'local-original'
def rows(name):
    with (local / name).open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))

checks = {}
previous = json.loads((root / 'second-pass-data-audit.json').read_text(encoding='utf-8'))
checks['earlier_csv_files_unchanged'] = all(
    hashlib.sha256((root / name).read_bytes()).hexdigest() == data['sha256']
    for name, data in previous['datasets'].items())
spells = rows('spells-local.csv')
access = rows('guild-spell-access-local.csv')
floors = rows('dungeon-floors-local.csv')
cells = rows('dungeon-cells-local.csv')
links = rows('item-spell-links-local.csv')
checks['spell_count_and_ids'] = len(spells) == 105 and len({x['spell_id'] for x in spells}) == 103
checks['guild_access'] = len(access) == 205 and len({x['spell_record_index'] for x in access}) == 101
checks['item_spell_references'] = len(links) == 132 and all(x['id_matches'] == 'True' for x in links)
checks['complete_floor_cells'] = len(floors) == 15 and len(cells) == 13500 and all(
    len([c for c in cells if c['floor'] == str(i)]) == 900 for i in range(1,16))
checks['adjacent_floor_offsets'] = all(int(a['parsed_end_record']) + 1 == int(b['start_record']) for a,b in zip(floors, floors[1:]))
checks['area_slot_counts'] = len(rows('dungeon-areas-local.csv')) == 3015
checks['transition_slot_counts'] = len(rows('dungeon-teleporters-local.csv')) == 240 and len(rows('dungeon-chutes-local.csv')) == 150
checks['unchanged_original_tree'] = json.loads((local / 'source-preservation-check.json').read_text()) == {'files_checked':1273,'changed_added_removed':[]}
source_review = (root / 'local-original-review.md').read_text(encoding='utf-8')
anchors = re.findall(r'<(D:/Programming Projects/Mordor/[^>]+):(\d+)>',source_review)
checks['source_anchors_exist'] = bool(anchors) and all(Path(p).exists() and int(n) <= len(Path(p).read_text(encoding='cp1252').splitlines()) for p,n in anchors)
report = {'status':'STATIC_EVIDENCE_CHECKS_NOT_RUNTIME_PARITY','checks':checks,
          'earlier_csv_files_checked':len(previous['datasets']),'source_code_anchors_checked':len(anchors)}
(local / 'research-check.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
assert all(checks.values()), checks
