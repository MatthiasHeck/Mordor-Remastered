"""Extract factual research tables from the downloaded official HelpScribble CHM HTML.
This is a documentation extractor, not a game implementation.
"""
from pathlib import Path
import csv
import re
from html import unescape

ROOT = Path(__file__).parent
HELP = ROOT / 'official-help' / 'html'
SOURCE = 'https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm'

def write(name, rows, fields):
    with (ROOT / name).open('w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)

books = []
spells = []
for path in sorted(HELP.glob('*.htm')):
    raw = path.read_text(encoding='cp1252')
    def plain(fragment):
        return ' '.join(unescape(re.sub(r'<[^>]+>', ' ', fragment)).split())
    title = plain(re.search(r'<title[^>]*>(.*?)</title>', raw, re.I | re.S).group(1))
    paragraphs = [plain(p) for p in re.findall(r'<p\b[^>]*>(.*?)</p>', raw, re.I | re.S)]
    if title.startswith('Spells: '):
        guild = title[8:]
        for text in paragraphs:
            match = re.fullmatch(r'(.+?)\s+(\d+)', text)
            if match:
                books.append(dict(guild=guild, spell=match[1], spell_level=int(match[2]), source=SOURCE, source_topic=path.name, status='official_updated_help_not_executable_verified'))
    elif title.endswith(' Spells'):
        for i, text in enumerate(paragraphs):
            match = re.match(r'Base Level:\s*(\d+)\s*Guilds:\s*(.+)', text)
            if not match:
                continue
            required = paragraphs[i+1]
            effect = paragraphs[i+2]
            target = re.search(r'(\d+) Monsters? in (\d+) Groups?', effect)
            noncombat = bool(re.search(r'\bNON-COMBAT\b', effect))
            combat = bool(re.search(r'(?<!-)\bCOMBAT\b', effect))
            context = 'both' if noncombat and combat else ('noncombat' if noncombat else ('combat' if combat else 'unparsed'))
            row = dict(spell=paragraphs[i-1], spell_class=title[:-7], base_spell_level=int(match[1]), guild_access_raw=match[2], context=context, monsters_parameter=target[1] if target else '', groups_parameter=target[2] if target else '', source=SOURCE, source_topic=path.name, status='official_updated_help_not_executable_verified')
            for stat in ['Str', 'Int', 'Wis', 'Con', 'Cha', 'Dex']:
                stat_match = re.search(r'(\d+)\s+' + stat + r'\b', required)
                row[stat.lower() + '_req'] = stat_match[1] if stat_match else ''
            power = re.search(r'(\d+)\s*/\s*(\d+)', effect)
            row['power_base'] = power[1] if power else ''
            row['power_level_modifier'] = power[2] if power else ''
            spells.append(row)

write('spell-guild-levels-updated-help.csv', books, ['guild','spell','spell_level','source','source_topic','status'])
write('spell-statistics-updated-help.csv', spells, ['spell','spell_class','base_spell_level','guild_access_raw','str_req','int_req','wis_req','con_req','cha_req','dex_req','context','monsters_parameter','groups_parameter','power_base','power_level_modifier','source','source_topic','status'])
print('Guild spellbook rows:', len(books))
print('Unique guild spellbook names:', len({r['spell'] for r in books}))
print('Category spell records:', len(spells))
print('Unparsed contexts:', [(r['spell'],r['source_topic']) for r in spells if r['context']=='unparsed'])
print('Per guild:', {g:sum(r['guild']==g for r in books) for g in sorted({r['guild'] for r in books})})
print('Power fields:', [(r['spell'],r['power_base'],r['power_level_modifier']) for r in spells if r['power_base']])
