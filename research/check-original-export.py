"""Validate revision-1.4 exports and documents; no original program is executed."""
from pathlib import Path
from collections import Counter
from urllib.parse import unquote
import csv
import hashlib
import json
import re
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / 'research/original-export'
summary = json.loads((OUT / 'summary.json').read_text(encoding='utf-8'))
manifest = json.loads((OUT / 'source-manifest.json').read_text(encoding='utf-8'))
SOURCE = Path(manifest['source_root'])
checks = {}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def rows(relative):
    with (OUT / relative).open(encoding='utf-8', newline='') as stream:
        return list(csv.DictReader(stream))


for relative, entry in manifest['files'].items():
    data = (SOURCE / relative).read_bytes()
    assert len(data) == entry['size'] and digest(data) == entry['sha256'], relative
checks['fingerprinted_inputs_match'] = len(manifest['files'])

assets = json.loads((OUT / 'graphics/manifest.json').read_text(encoding='utf-8'))
for a in assets:
    raw = (OUT / a['bmp']).read_bytes()
    assert digest(raw) == a['sha256']
    for origin in a['origins']:
        source = (SOURCE / origin['source']).read_bytes()
        assert source[origin['offset']:origin['offset'] + origin['bytes']] == raw
    with Image.open(OUT / a['bmp']) as bmp, Image.open(OUT / a['png']) as png:
        assert bmp.size == png.size == (a['width'], a['height'])
        assert bmp.convert('RGB').tobytes() == png.convert('RGB').tobytes()
assert len(assets) == summary['unique_bmp_assets'] == 34
assert sum(len(a['origins']) for a in assets) == summary['bmp_occurrences'] == 78
for c in rows('graphics/monster-crops.csv'):
    x, y, w, h = (int(c[k]) for k in ['x', 'y', 'width', 'height'])
    with Image.open(OUT / c['sheet']) as sheet, Image.open(OUT / c['file']) as crop:
        expected = sheet.crop((x, y, x + w, y + h))
        assert expected.convert('RGB').tobytes() == crop.convert('RGB').tobytes()
assert len(rows('graphics/monster-crops.csv')) == summary['monster_grid_crops'] == 90
assert len(rows('graphics/monster-picture-map.csv')) == summary['monster_records_mapped'] == 401
with Image.open(OUT / 'graphics/MORDOR-icon-1.ico') as icon:
    icon.load()
checks['exact_bmp_bytes_png_pixels_and_monster_crops'] = True

code_files = json.loads((OUT / 'code/files.json').read_text(encoding='utf-8'))
lines = {}
for f in code_files:
    data = (OUT / f['export']).read_bytes()
    assert data == (SOURCE / f['source']).read_bytes()
    assert digest(data) == f['sha256']
    lines[f['source'].split('/')[-1]] = data.decode('cp1252').splitlines(keepends=True)
assert len(code_files) == summary['code_files'] == 46
procedures = json.loads((OUT / 'code/procedures.json').read_text(encoding='utf-8'))
for p in procedures:
    source_lines = lines[p['file']]
    assert source_lines[p['start_line'] - 1].strip() == p['signature']
    assert source_lines[p['end_line'] - 1].strip() == 'End ' + p['kind']
assert len(procedures) == summary['indexed_procedures'] == 691
for p in rows('code/selected-routines.csv'):
    expected = ''.join(lines[p['file']][int(p['start_line']) - 1:int(p['end_line'])]).encode('cp1252')
    assert (OUT / p['export']).read_bytes() == expected, p['export']
assert len(rows('code/selected-routines.csv')) == summary['selected_routines'] == 37
checks['complete_code_copies_indexes_and_exact_excerpts'] = True

prices = rows('prices/item-base-prices.csv')
with (ROOT / 'research/local-original/items-local.csv').open(encoding='utf-8', newline='') as stream:
    previous = list(csv.DictReader(stream))
assert len(prices) == len(previous) == summary['item_base_prices'] == 366
for a, b in zip(prices, previous):
    assert all(a[k] == b[k] for k in ['record_index', 'item_id', 'name', 'base_price', 'first_level', 'cursed_raw', 'alignment_flags_raw'])
    assert a['subtype_raw'] == b['type_raw'] and a['base_charges_candidate'] == b['charges_candidate']
    assert a['first_level_zero_buy_price_candidate'] == (b['base_price'] if b['first_level'] == '0' else '')
checks['all_item_base_values_match_preceding_export'] = True

cells = rows('dungeon/all-cells.csv')
assert len(cells) == summary['dungeon_cells'] == 13500
assert Counter(c['floor'] for c in cells) == {str(f): 900 for f in range(1, 16)}
special = rows('dungeon/special-squares.csv')
assert special == [c for c in cells if c['special_features']]
assert len(special) == summary['special_squares_excluding_rock_and_edges'] == 3965
assert len(rows('dungeon/doors.csv')) == summary['door_edge_flags'] == 2328
assert len(rows('dungeon/flag-definitions.csv')) == 23
assert len(rows('dungeon/areas.csv')) == 3015
assert len(rows('dungeon/teleporters.csv')) == 240 and len(rows('dungeon/chutes.csv')) == 150
transitions = json.loads((OUT / 'dungeon/transition-checks.json').read_text(encoding='utf-8'))
assert transitions['teleporters']['flagged_cells_without_slot'] == [[8, 5, 6], [8, 6, 6]]
assert transitions['teleporters']['slots_without_cell_flag'] == []
assert transitions['chutes']['exact_match'] and transitions['chutes']['active_slots'] == 17
preservation = json.loads((OUT / 'source-preservation-check.json').read_text(encoding='utf-8'))
assert preservation['passed'] and preservation['files_checked'] == 1273 and not preservation['changed_added_removed']
checks['dungeon_counts_combined_flags_and_recorded_discrepancy'] = True
checks['preceding_whole_tree_preservation_passed'] = True

documents = [ROOT / 'Mordor Remastered Design Document.md', ROOT / 'research/README.md',
             *sorted(OUT.rglob('*.md'))]
local_links = 0
for document in documents:
    text = document.read_text(encoding='utf-8')
    for target in re.findall(r'\]\(([^\n]+?)\)', text):
        target = unquote(target.strip('<>'))
        if re.match(r'\w+:', target) or target.startswith('#'):
            continue
        resolved = (document.parent / target.split('#')[0]).resolve()
        # This report is written on success below; its own document link is prospective.
        assert resolved == OUT / 'validation.json' or resolved.is_file(), (document.name, target)
        local_links += 1
    width = None
    for number, line in enumerate(text.splitlines(), 1):
        if line.startswith('|') and line.endswith('|'):
            current = len(line.split('|'))
            if width is None:
                width = current
            assert current == width, (document.name, number, 'table width')
        else:
            width = None
design = documents[0].read_text(encoding='utf-8')
preview = (ROOT / 'Mordor Remastered Design Document.html').read_text(encoding='utf-8')
assert re.findall(r'^## (\d+) ', design, re.M) == [str(n) for n in range(1, 28)]
assert '**Document version:** 1.4' in design and '<strong>Document version:</strong> 1.4' in preview
assert 'October 10, 2026' in preview and len(re.findall(r'<h2 id="section-\d+">', preview)) == 27
for n in range(1, 24):
    assert len(re.findall(rf'^\| F{n:02d} ', design, re.M)) == 1
for n in range(17, 32):
    assert len(re.findall(rf'^\| V{n} ', design, re.M)) == 1
for n in range(1, 4):
    assert len(re.findall(rf'^\| U{n:02d} ', design, re.M)) == 1
for phrase in ['open it automatically and continue through that edge', 'Press **T** once', 'Debounce T until key release']:
    assert phrase in design, phrase
for heading in re.findall(r'^### (.+)$', design, re.M):
    assert f'<h3>{heading}</h3>' in preview, heading
for target in re.findall(r'(?:href|src)="([^"]+)"', (OUT / 'graphics-gallery.html').read_text(encoding='utf-8')):
    assert (OUT / unquote(target)).is_file(), target
checks['documents_links_tables_controls_and_html'] = True
report = {'revision': '1.4', 'status': 'EXPORT_AND_DOCUMENT_CHECKS_PASSED', 'checks': checks,
          'local_document_links_checked': local_links, 'runtime_game_tests_executed': False}
(OUT / 'validation.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps(report, indent=2))
