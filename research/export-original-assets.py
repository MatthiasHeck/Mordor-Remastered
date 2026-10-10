"""Read-only export of local Mordor graphics, decompiler text and reference data.

Usage: python research/export-original-assets.py [--source PATH]
Requires Pillow. Never loads an original DLL, runs an EXE, or imports original code.
All generated files live in research/original-export. Source byte offsets are zero-based;
code lines and physical item/monster/picture indexes are one-based.
"""
from pathlib import Path
from collections import Counter
import argparse
import csv
import hashlib
import html
import importlib.util
import io
import json
import re
import struct
import sys
from PIL import Image, ImageDraw

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'original-export'
SOURCE = Path(argparse.ArgumentParser(description=__doc__).parse_known_args()[1][1]).resolve() if False else None
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--source', type=Path, default=ROOT.parent.parent / 'Mordor')
SOURCE = parser.parse_args().source.resolve()
assert SOURCE.is_dir() and SOURCE != OUT and SOURCE not in OUT.parents
OUT.mkdir(exist_ok=True)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def write_json(name, data):
    p = OUT / name
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(data, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')


def write_csv(name, rows):
    assert rows, name
    p = OUT / name
    p.parent.mkdir(parents=True, exist_ok=True)
    with p.open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


inputs = {}


def read_source(relative):
    p = SOURCE / relative
    data = p.read_bytes()
    inputs[relative] = {'size': len(data), 'sha256': sha(data)}
    return data


def ne_resources(data):
    assert data[:2] == b'MZ'
    ne = struct.unpack_from('<I', data, 60)[0]
    assert data[ne:ne + 2] == b'NE'
    table = ne + struct.unpack_from('<H', data, ne + 36)[0]
    end = ne + struct.unpack_from('<H', data, ne + 38)[0]
    shift = struct.unpack_from('<H', data, table)[0]
    assert shift <= 16 and table < end <= len(data)

    def name(value):
        if value & 0x8000:
            return str(value & 0x7fff)
        p = table + value
        assert table <= p < end and p + 1 + data[p] <= end
        return data[p + 1:p + 1 + data[p]].decode('cp1252')

    pos = table + 2
    rows = []
    while True:
        assert pos + 2 <= end
        typ = struct.unpack_from('<H', data, pos)[0]
        if not typ:
            break
        typ, count = struct.unpack_from('<HH', data, pos)
        pos += 8
        for _ in range(count):
            assert pos + 12 <= end
            offset, size, flags, rid, _, _ = struct.unpack_from('<6H', data, pos)
            pos += 12
            offset <<= shift
            size <<= shift
            assert offset + size <= len(data)
            rows.append({'type': name(typ), 'id': name(rid), 'offset': offset,
                         'allocated_size': size, 'flags': flags})
    return rows


def bitmaps(data):
    pos = 0
    while (pos := data.find(b'BM', pos)) >= 0:
        start = pos
        pos += 2
        if start + 54 > len(data):
            continue
        size, reserved1, reserved2, pixel_offset, header = struct.unpack_from('<IHHII', data, start + 2)
        if reserved1 or reserved2 or header not in (12, 40, 108, 124):
            continue
        if not (54 <= pixel_offset < size and start + size <= len(data)):
            continue
        raw = data[start:start + size]
        try:
            with Image.open(io.BytesIO(raw)) as im:
                im.load()
                assert im.width <= 8192 and im.height <= 8192
        except (OSError, ValueError, AssertionError):
            continue
        yield start, raw
        pos = start + size


assets = {}
occurrences = []
ne_tables = []


def save_bitmap(raw, name, relative, offset, resource=''):
    hashed = sha(raw)
    origin = {'source': relative, 'offset': offset, 'bytes': len(raw), 'resource': resource,
              'sha256': hashed}
    if hashed not in assets:
        bmp = f'graphics/bitmaps/{name}.bmp'
        png = f'graphics/png/{name}.png'
        (OUT / bmp).parent.mkdir(parents=True, exist_ok=True)
        (OUT / png).parent.mkdir(parents=True, exist_ok=True)
        (OUT / bmp).write_bytes(raw)
        with Image.open(io.BytesIO(raw)) as im:
            rgb = im.convert('RGB')
            rgb.save(OUT / png)
            with Image.open(OUT / png) as check:
                assert check.convert('RGB').tobytes() == rgb.tobytes()
            assets[hashed] = {'name': name, 'bmp': bmp, 'png': png, 'width': im.width,
                              'height': im.height, 'sha256': hashed, 'origins': []}
    assets[hashed]['origins'].append(origin)
    occurrences.append({**origin, 'bmp': assets[hashed]['bmp']})


for relative in ['ORIGINAL_DATA/MG11.DLL', 'Mordor/MORDOR.EXE']:
    data = read_source(relative)
    resources = ne_resources(data)
    for resource in resources:
        offset, size = resource['offset'], resource['allocated_size']
        chunk = data[offset:offset + size]
        ne_tables.append({'source': relative, **resource, 'sha256': sha(chunk)})
        for local, raw in bitmaps(chunk):
            name = f"{Path(relative).stem}_{resource['id']}_{local:06x}"
            save_bitmap(raw, name, relative, offset + local, f"{resource['type']}/{resource['id']}")
    # Every structurally valid embedded BMP must fall in one of the resource spans.
    assert {p for p, _ in bitmaps(data)} == {o['offset'] for o in occurrences if o['source'] == relative}
    if relative.endswith('.EXE'):
        groups = [r for r in resources if r['type'] == '14']
        icons = {r['id']: r for r in resources if r['type'] == '3'}
        for group in groups:
            chunk = data[group['offset']:group['offset'] + group['allocated_size']]
            reserved, kind, count = struct.unpack_from('<HHH', chunk)
            assert reserved == 0 and kind == 1
            directory, bodies, position = [], [], 6 + count * 16
            for i in range(count):
                entry = chunk[6 + i * 14:20 + i * 14]
                nbytes, rid = struct.unpack_from('<IH', entry, 8)
                resource = icons[str(rid)]
                assert nbytes <= resource['allocated_size']
                body = data[resource['offset']:resource['offset'] + nbytes]
                directory.append(entry[:12] + struct.pack('<I', position))
                bodies.append(body)
                position += nbytes
            ico = chunk[:6] + b''.join(directory) + b''.join(bodies)
            target = OUT / 'graphics' / f"MORDOR-icon-{group['id']}.ico"
            target.write_bytes(ico)
            with Image.open(target) as im:
                im.load()
                im.save(target.with_suffix('.png'))

for p in sorted((SOURCE / 'POOP').glob('*.FRM')):
    relative = p.relative_to(SOURCE).as_posix()
    data = read_source(relative)
    for offset, raw in bitmaps(data):
        save_bitmap(raw, f'{p.stem}_{offset:06x}', relative, offset, 'VB3 form embedded BMP')

write_json('graphics/manifest.json', list(assets.values()))
write_csv('graphics/occurrences.csv', occurrences)
write_json('graphics/ne-resources.json', ne_tables)

# Slice only the grid explicitly used by FRMLIBRA.picMonster_Paint.
mons = next(a for a in assets.values() if a['name'].startswith('MG11_MONS_'))
with Image.open(OUT / mons['png']) as sheet:
    assert sheet.size == (600, 540)
    (OUT / 'graphics/monsters').mkdir(exist_ok=True)
    crops = []
    for picture in range(1, 91):
        x, y = ((picture - 1) % 10) * 60, ((picture - 1) // 10) * 60
        name = f'graphics/monsters/picture-{picture:03}.png'
        crop = sheet.crop((x, y, x + 60, y + 60))
        crop.save(OUT / name)
        crops.append({'picture_id': picture, 'file': name, 'sheet': mons['png'], 'x': x, 'y': y,
                      'width': 60, 'height': 60, 'source': 'POOP/FRMLIBRA.bas', 'line': 93,
                      'evidence': 'Static drawing coordinates; special ASMO branch separate'})
    write_csv('graphics/monster-crops.csv', crops)

# Reuse our own parser, never any module from the original source folder.
spec = importlib.util.spec_from_file_location('reference_parser', ROOT / 'bestiary-extract.py')
reference = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reference)
items = reference.extract_items(read_source('ORIGINAL_DATA/MDATA3.MDR'))
monsters = reference.extract_monsters(read_source('ORIGINAL_DATA/MDATA5.MDR'))
for filename, rows in [('items-local.csv', items), ('monsters-local.csv', monsters)]:
    with (ROOT / 'local-original' / filename).open(encoding='utf-8', newline='') as stream:
        old = list(csv.DictReader(stream))
    assert old == [{k: str(v) for k, v in row.items()} for row in rows], filename

write_csv('graphics/monster-picture-map.csv', [
    {'record_index': m['record_index'], 'monster_id': m['monster_id'], 'name': m['name'],
     'picture_id': m['picture_id'],
     'grid_picture_candidate': f"graphics/monsters/picture-{m['picture_id']:03}.png" if 1 <= m['picture_id'] <= 90 else '',
     'special_picture_note': 'FRMLIBRA calls fn0C3B; ASMO override must be evaluated separately'} for m in monsters])

write_csv('prices/item-base-prices.csv', [
    {'record_index': i['record_index'], 'item_id': i['item_id'], 'name': i['name'],
     'base_price': i['base_price'], 'first_level': i['first_level'], 'subtype_raw': i['type_raw'],
     'base_charges_candidate': i['charges_candidate'], 'cursed_raw': i['cursed_raw'],
     'alignment_flags_raw': i['alignment_flags_raw'],
     'first_level_zero_buy_price_candidate': i['base_price'] if i['first_level'] == 0 else '',
     'price_source': 'MDATA3.MDR base value; not a universal shop quote',
     'buy_rule_source': 'POOP/FRMCTYS.bas:583'} for i in items])
write_json('prices/formulas.json', {
    'evidence': 'Literal supplied decompiler expressions; not executable or verified pricing code',
    'variables': {'V': 'base price', 'S': 'selected alignment stock', 'I': 'identification field',
                  'C': 'instance charges', 'B': 'definition charges', 'K': 'bundle penalty multiplier'},
    'bundle_subtypes': [23, 24, 25, 26, 27, 28, 30, 31],
    'buy': {'source': 'FRMCTYS.bas:583 fn272C', 'first_level_zero': 'V',
            'other': 'VB_Long((1.5*V)/(ln(min(S-1,9)+1)+1.15) - VB_Single(ln(abs(B - gv1426(l0202).M56DB)+1))*(0.05*V))',
            'blockers': ['l0202 is declared but not assigned in this function', 'S=0 reaches ln(0); eligibility caller matters',
                         'VB numeric precision and error handler must be reproduced']},
    'sell': {'source': 'FRMCTYS.bas:695 fn273B',
             'formula': 'T=VB_Long((0.9*V/(S+1.15))/(I+1)); quote=VB_Long(T - VB_Single(K*ln(abs(C-B)+1))*(0.05*T))',
             'guards': ['Selected stock zero becomes one if another alignment has stock; cap S at 9',
                        'Eight bundle subtypes with B>0 use K=5 and C=min(C,B); otherwise K=1',
                        'Fully identified inherently cursed goods return zero',
                        'Earlier equipped/inherent curse guard can set V=0; caller blocks equipped cursed sales']},
    'identify': {'source': 'FRMCTYS.bas:564 fn271B',
                 'formula': 'VB_Long((0.23*V)/(((min(S,9)/2)+1)*0.9)/I + 1)', 'guard': 'I=0 must be excluded by caller'},
    'uncurse': {'source': 'FRMCTYS.bas:763 fn274F', 'formula': 'VB_Long((0.8*V)/0.5)',
                'guard': 'Separate item from character; intrinsic curse may remain'},
    'rounding': 'VB_Long/VB_Single mark conversion boundaries, not a supplied tested emulator',
    'stock': 'Mutable save-state stock is intentionally not treated as a canonical static price table'})

# Preserve the entire supplied text set so selected routines retain their dependencies.
code_rows, procedures, code_lines = [], [], {}
for p in sorted((SOURCE / 'POOP').iterdir()):
    if p.suffix.lower() != '.bas' and p.name != 'main.txt':
        continue
    relative = p.relative_to(SOURCE).as_posix()
    raw = read_source(relative)
    target = OUT / 'code/source' / p.name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(raw)
    assert digest(target) == sha(raw)
    lines = raw.decode('cp1252').splitlines(keepends=True)
    code_lines[p.name] = lines
    code_rows.append({'source': relative, 'export': target.relative_to(OUT).as_posix(),
                      'bytes': len(raw), 'sha256': sha(raw), 'lines': len(lines), 'encoding': 'cp1252'})
    current = None
    for number, line in enumerate(lines, 1):
        match = re.match(r'^(Sub|Function)\s+(\w+)\b', line)
        if match:
            assert current is None, (p.name, number)
            current = {'file': p.name, 'name': match[2], 'kind': match[1], 'start_line': number,
                       'signature': line.strip()}
        if current and re.match(r'^End (Sub|Function)\s*$', line.strip()):
            current['end_line'] = number
            body = ''.join(lines[current['start_line'] - 1:number])
            current['referenced_generated_symbols'] = sorted(set(re.findall(r'\b(?:fn|sub)[0-9A-F]{4}\b', body)) - {current['name']})
            procedures.append(current)
            current = None
    assert current is None, p.name
write_json('code/files.json', code_rows)
write_json('code/procedures.json', procedures)
write_csv('code/procedures.csv', [{k: (';'.join(v) if isinstance(v, list) else v) for k, v in p.items()} for p in procedures])

selections = {
    'combat': [('FRMDUNM.bas', 'timCombat_Timer'), ('Module7.bas', 'sub155A'),
               ('Module4.bas', 'sub1019'), ('Module4.bas', 'sub0C8A'), ('Module4.bas', 'sub0E85'),
               ('Module4.bas', 'sub0F01'), ('Module6.bas', 'fn1173'), ('Module3.bas', 'sub0A49')],
    'store': [('FRMCTYS.bas', n) for n in ['cmdBuy_Click', 'cmdSell_Click', 'cmdUncurse_Click',
                                         'fn271B', 'fn272C', 'fn273B', 'fn274F', 'sub2621']],
    'recovery': [('FRMMORG.bas', 'cmdCommand_Click'), ('FRMMORG.bas', 'sub2BDB'),
                 ('FRMDUNM.bas', 'cmdWait_Click'), ('FRMCTYM.bas', 'Form_Load'),
                 ('Module6.bas', 'sub0EAE'), ('Module6.bas', 'fn11A1'), ('Module6.bas', 'fn10A3'),
                 ('Module6.bas', 'sub0A7C'), ('Module6.bas', 'fn131D')],
    'dungeon': [('Module3.bas', 'sub0835'), ('Module3.bas', 'sub08F5'), ('Module3.bas', 'sub0A1D'),
                ('Module3.bas', 'sub087C'), ('Module6.bas', 'fn14CB'), ('Module6.bas', 'fn164C'),
                ('Module6.bas', 'fn10E5'), ('FRMDUNM.bas', 'timMonsters_Timer')],
}
selected = []
for category, entries in selections.items():
    for file, name in entries:
        matches = [p for p in procedures if p['file'] == file and p['name'] == name]
        assert len(matches) == 1, (file, name)
        p = matches[0]
        relative = f'code/{category}/{Path(file).stem}--{name}.bas'
        target = OUT / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        # Encode back to cp1252; preserve original line breaks and generated identifiers.
        target.write_bytes(''.join(code_lines[file][p['start_line'] - 1:p['end_line']]).encode('cp1252'))
        selected.append({'category': category, 'file': file, 'procedure': name,
                         'start_line': p['start_line'], 'end_line': p['end_line'], 'export': relative})
write_csv('code/selected-routines.csv', selected)

# Decode special cells directly from the fixed-record MDATA11 input.
data = read_source('ORIGINAL_DATA/MDATA11.MDR')
module1 = ''.join(code_lines['Module1.bas'])
labels = {int(m[1]): m[2] for m in re.finditer(r'^\s*gv194E\((\d+)\) = "([^"]+)"', module1, re.M)}
assert set(labels) == set(range(23))
all_cells, special, doors, teleports, chutes, floors, areas = [], [], [], [], [], [], []
flags_count = Counter()


def values(record, fmt):
    return struct.unpack_from('<' + fmt, data, (record - 1) * 20)


for floor in range(1, values(1, 'h')[0] + 1):
    start = values(floor + 1, 'h')[0]
    width, height, stored, area_count, chute_count, teleport_count = values(start, '6h')
    floors.append({'floor': floor, 'width': width, 'height': height, 'stored_floor': stored,
                   'area_count': area_count, 'chute_slots': chute_count, 'teleporter_slots': teleport_count})
    n = start + 1
    for i in range(width * height):
        area, raw = values(n, 'hq')
        assert raw % 10000 == 0
        flags = raw // 10000
        assert flags >= 0 and flags >> 23 == 0
        bits = [b for b in labels if flags & (1 << b)]
        features = [b for b in bits if b >= 6 and b != 19]
        row = {'floor': floor, 'cell_index': i, 'x_candidate': i % width + 1, 'y_candidate': i // width + 1,
               'area_id': area, 'record_number': n, 'byte_offset': (n - 1) * 20,
               'flags_currency_raw': raw, 'flags_integer': flags, 'flags_hex': hex(flags),
               'all_flags': ';'.join(labels[b] for b in bits),
               'special_features': ';'.join(labels[b] for b in features)}
        all_cells.append(row)
        if features:
            special.append(row)
        for b in bits:
            flags_count[(floor, b)] += 1
        for b in [2, 3, 4, 5]:
            if b in bits:
                doors.append({k: row[k] for k in ['floor', 'cell_index', 'x_candidate', 'y_candidate', 'byte_offset']} |
                             {'bit': b, 'label': labels[b], 'edge': 'right' if b in (2, 4) else 'upper',
                              'secret': b in (4, 5), 'note': 'Stored shared edge; do not duplicate onto neighbor'})
        n += 1
    assert values(n, 'h')[0] == area_count
    n += 1
    for slot in range(201):
        spawn, lair = values(n, 'Ih')
        areas.append({'floor': floor, 'area_index': slot, 'spawn_mask_raw': spawn, 'lair_id_raw': lair,
                      'byte_offset': (n - 1) * 20})
        n += 1
    assert values(n, 'h')[0] == teleport_count
    n += 1
    for slot in range(teleport_count):
        x, y, dx, dy, df = values(n, '5h')
        teleports.append({'floor': floor, 'slot': slot, 'x': x, 'y': y, 'destination_x': dx,
                          'destination_y': dy, 'destination_floor_raw': df, 'active_slot': bool(x and y),
                          'destination_kind_candidate': 'unused' if not (x and y) else ('random_xy' if not (dx and dy) else 'fixed_xy'),
                          'effective_floor_candidate': (df if df > 0 else floor) if x and y else '',
                          'byte_offset': (n - 1) * 20})
        n += 1
    assert values(n, 'h')[0] == chute_count
    n += 1
    for slot in range(chute_count):
        x, y, depth = values(n, '3h')
        chutes.append({'floor': floor, 'slot': slot, 'x': x, 'y': y, 'depth_raw': depth,
                       'active_slot': bool(x and y), 'byte_offset': (n - 1) * 20})
        n += 1
for name, rows in [('all-cells', all_cells), ('special-squares', special), ('doors', doors),
                   ('teleporters', teleports), ('chutes', chutes), ('areas', areas), ('floors', floors)]:
    write_csv(f'dungeon/{name}.csv', rows)
write_csv('dungeon/flag-counts.csv', [{'floor': f, 'bit': b, 'mask': 1 << b, 'label': labels[b],
                                    'cells': flags_count[(f, b)]} for f in range(1, 16) for b in labels])
write_csv('dungeon/flag-definitions.csv', [{'bit': b, 'mask': 1 << b, 'label': name,
                                          'class': 'edge' if b < 6 else ('solid' if b == 19 else 'special')} for b, name in labels.items()])
cell_lookup = {(c['floor'], c['x_candidate'], c['y_candidate']): c for c in all_cells}
for rows, bit in [(teleports, 14), (chutes, 21)]:
    active = [r for r in rows if r['active_slot']]
    assert len({(r['floor'], r['x'], r['y']) for r in active}) == len(active)
    assert {(r['floor'], r['x'], r['y']) for r in active} == {k for k, c in cell_lookup.items() if c['flags_integer'] & (1 << bit)}
for r in teleports:
    if r['active_slot'] and r['destination_kind_candidate'] == 'fixed_xy':
        assert (r['effective_floor_candidate'], r['destination_x'], r['destination_y']) in cell_lookup
with (ROOT / 'local-original/dungeon-cells-local.csv').open(encoding='utf-8', newline='') as stream:
    old_cells = list(csv.DictReader(stream))
assert len(all_cells) == len(old_cells) == 13500
for new, old in zip(all_cells, old_cells):
    assert all(str(new[k]) == value for k, value in old.items())

# A portable, local gallery with the original pixel art and source provenance.
cards = []
for a in assets.values():
    origins = ', '.join(f"{o['source']} @ 0x{o['offset']:x}" for o in a['origins'])
    cards.append(f'<figure><a href="{a["png"]}"><img loading="lazy" src="{a["png"]}" alt="{html.escape(a["name"])}"></a>'
                 f'<figcaption><strong>{html.escape(a["name"])}</strong> · {a["width"]}×{a["height"]} '
                 f'<a href="{a["bmp"]}">Original BMP</a><small>{html.escape(origins)}</small></figcaption></figure>')
gallery = '<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">'
gallery += '<title>Mordor original graphics export</title><style>body{background:#151a20;color:#e8ebed;font:16px/1.5 system-ui;margin:0 auto;padding:32px;max-width:1300px}a{color:#8dc8ff}figure{margin:28px 0;background:#252c35;padding:18px;border-radius:8px}img{max-width:100%;height:auto;image-rendering:pixelated}small{display:block;overflow-wrap:anywhere;color:#abb7c5}h1{font-size:30px}figcaption{margin-top:12px}</style>'
gallery += '<h1>Mordor original graphics</h1><p>Extracted locally from MG11.DLL, MORDOR.EXE and supplied forms. BMP files retain original bytes; PNGs retain decoded RGB pixels. This is a research export, not remastered art.</p>'
gallery += '<p><a href="README.md">Export guide</a> · <a href="graphics/manifest.json">Asset manifest</a> · <a href="graphics/monster-picture-map.csv">Monster mappings</a></p>'
gallery += ''.join(cards) + '</html>'
(OUT / 'graphics-gallery.html').write_text(gallery, encoding='utf-8')

# Contact sheet is a preview only; exported originals and PNGs retain full resolution.
preview_assets = list(assets.values())
contact = Image.new('RGB', (1000, ((len(preview_assets) + 3) // 4) * 190), '#181e26')
draw = ImageDraw.Draw(contact)
for index, a in enumerate(preview_assets):
    x, y = (index % 4) * 250, (index // 4) * 190
    with Image.open(OUT / a['png']) as im:
        im.thumbnail((230, 140), Image.Resampling.NEAREST)
        contact.paste(im, (x + 10, y + 10))
    draw.text((x + 10, y + 152), a['name'], fill='white')
    draw.text((x + 10, y + 168), f"{a['width']} x {a['height']}", fill='#aab9c8')
contact.save(OUT / 'graphics/contact-sheet.png')

summary = {'review_date': '2026-10-09', 'source_root': str(SOURCE),
           'unique_bmp_assets': len(assets), 'bmp_occurrences': len(occurrences),
           'graphics_library_sheets': 10, 'monster_grid_crops': len(crops),
           'monster_records_mapped': len(monsters), 'item_base_prices': len(items),
           'code_files': len(code_rows), 'indexed_procedures': len(procedures), 'selected_routines': len(selected),
           'dungeon_cells': len(all_cells), 'special_squares_excluding_rock_and_edges': len(special),
           'door_edge_flags': len(doors), 'active_teleporters': sum(r['active_slot'] for r in teleports),
           'active_chutes': sum(r['active_slot'] for r in chutes),
           'unknown_terrain_bits': 0, 'prior_item_monster_cell_exports_match': True,
           'teleporter_chute_slots_match_flagged_cells': True, 'runtime_verified': False}
write_json('summary.json', summary)
write_json('source-manifest.json', {'source_root': str(SOURCE), 'files': inputs})

# Whole-tree preservation against the preceding immutable review inventory.
baseline_path = ROOT / 'local-original/source-inventory.json'
baseline = json.loads(baseline_path.read_text(encoding='utf-8'))['files']
current = {str(p.relative_to(SOURCE)): {'size': p.stat().st_size, 'sha256': digest(p)}
           for p in sorted(SOURCE.rglob('*')) if p.is_file()}
changes = sorted(p for p in baseline.keys() | current.keys() if baseline.get(p) != current.get(p))
write_json('source-preservation-check.json', {'baseline_sha256': digest(baseline_path),
           'files_checked': len(current), 'changed_added_removed': changes, 'passed': not changes})
assert not changes, changes
print(json.dumps({**summary, 'source_files_unchanged': len(current)}))
