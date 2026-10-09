"""Read-only provenance and preservation checks for design revision 1.3.

Run with the bundled Python. Does not run/import original code or change exports.
The original review's immutable inventory supplies the before-state.
"""
from pathlib import Path
import hashlib
import json
import re
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parent.parent
SOURCE = Path('D:/Programming Projects/Mordor')
OUT = ROOT / 'research' / 'original-followup'
OUT.mkdir(exist_ok=True)

def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()

review = ROOT / 'research' / 'original-followup-review.md'
anchors = re.findall(r'<D:/Programming Projects/Mordor/([^>]+):(\d+)>', review.read_text(encoding='utf-8'))
files = {}
for relative, line in anchors:
    path = SOURCE / relative
    lines = path.read_text(encoding='cp1252').splitlines()
    line = int(line)
    assert 1 <= line <= len(lines), (relative, line)
    assert re.match(r'(Sub |Function |Const |sub0A49$)', lines[line - 1].strip()), (relative, line)
    entry = files.setdefault(relative, {'sha256': digest(path), 'line_count': len(lines), 'anchors': []})
    if not any(a['line'] == line for a in entry['anchors']):
        entry['anchors'].append({'line': line, 'text': lines[line - 1].strip()})
assert files
manifest = {'revision': '1.3', 'review_date': '2026-10-09', 'source_root': str(SOURCE),
            'evidence': 'Static decompiler interpretation; no original executable run', 'files': files}
(OUT / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')

baseline_path = ROOT / 'research' / 'local-original' / 'source-inventory.json'
baseline = json.loads(baseline_path.read_text(encoding='utf-8'))['files']
current = {str(p.relative_to(SOURCE)): {'size': p.stat().st_size, 'sha256': digest(p)}
           for p in sorted(SOURCE.rglob('*')) if p.is_file()}
changes = sorted(p for p in baseline.keys() | current.keys() if baseline.get(p) != current.get(p))
report = {'revision': '1.3', 'baseline': 'research/local-original/source-inventory.json',
          'baseline_sha256': digest(baseline_path), 'files_checked': len(current),
          'changed_added_removed': changes, 'passed': not changes}
(OUT / 'source-preservation-check.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
assert not changes, changes

# Validate this revision's documents and rebuilt reading edition, not game behavior.
documents = [ROOT / 'Mordor Remastered Design Document.md', review, ROOT / 'research' / 'README.md']
link_count = 0
for document in documents:
    contents = document.read_text(encoding='utf-8')
    for target in re.findall(r'\]\(([^\n]+?)\)', contents):
        target = unquote(target.strip('<>'))
        if re.match(r'\w+:', target) or target.startswith('#'):
            continue
        assert (document.parent / target.split('#')[0]).is_file(), (document.name, target)
        link_count += 1
    table_width = None
    for number, line in enumerate(contents.splitlines(), 1):
        if line.startswith('|') and line.endswith('|'):
            width = len(line.split('|'))
            if table_width is None:
                table_width = width
            assert width == table_width, (document.name, number, 'inconsistent table')
        else:
            table_width = None
design = documents[0].read_text(encoding='utf-8')
sections = re.findall(r'^## (\d+) ', design, re.M)
assert sections == [str(n) for n in range(1, 28)], sections
for n in range(17, 29):
    assert len(re.findall(rf'^\| V{n} ', design, re.M)) == 1
for n in range(1, 24):
    assert len(re.findall(rf'^\| F{n:02d} ', design, re.M)) == 1
html = (ROOT / 'Mordor Remastered Design Document.html').read_text(encoding='utf-8')
assert '<strong>Document version:</strong> 1.3' in html, 'Rebuild HTML first'
assert len(re.findall(r'<h2 id="section-\d+">', html)) == 27
for heading in re.findall(r'^### (.+)$', design, re.M):
    assert f'<h3>{heading}</h3>' in html, ('missing HTML heading', heading)
validation = {'revision': '1.3', 'numbered_sections': 27, 'new_runtime_case_families': 12,
              'conflict_entries': 23, 'local_document_links_checked': link_count,
              'tables_consistent': True, 'html_headings_match': True,
              'runtime_game_tests_executed': False}
(OUT / 'document-validation.json').write_text(json.dumps(validation, indent=2) + '\n', encoding='utf-8')
print(json.dumps({'reviewed_source_files': len(files), 'source_anchors': len(anchors),
                  'unchanged_source_files': len(current), 'document_validation': validation}))
