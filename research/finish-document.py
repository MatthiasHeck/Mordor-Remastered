"""Build factual appendices and readable reference tables from research CSV files."""
from pathlib import Path
import csv
import hashlib
import io
import json
import os
import zipfile

ROOT = Path(__file__).resolve().parent.parent
R = ROOT / 'research'
DOC = ROOT / 'Mordor Remastered Design Document.md'

def rows(name):
    with (R / name).open(encoding='utf-8', newline='') as f:
        return list(csv.DictReader(f))

def table(headers, values):
    def row(v):
        return '| ' + ' | '.join(str(x).replace('|', '\\|').replace('\n', ' ') for x in v) + ' |'
    return '\n'.join([row(headers), row(['---'] * len(headers))] + [row(v) for v in values]) + '\n'

def alignment(r):
    return '/'.join(short for name, short in [('good','G'),('neutral','N'),('evil','E')] if r[name]=='true')

stats = rows('race-statistics.csv')
resists = rows('race-resistances.csv')
guilds = rows('guild-statistics.csv')
abilities = rows('guild-abilities.csv')
eligibility = rows('race-guild-eligibility.csv')
spells = rows('spell-statistics-updated-help.csv')
books = rows('spell-guild-levels-updated-help.csv')
monsters = rows('monster-candidate-shareware.csv')
items = rows('item-candidate-shareware.csv')

# Independent distribution comparison is evidence, not certification of retail parity.
p = Path(os.environ['TEMP']) / 'bestiary-archive-MORDOR11.ZIP'
b = p.read_bytes()
outer = zipfile.ZipFile(io.BytesIO(b))
inner = zipfile.ZipFile(io.BytesIO(outer.read('MORDOR.WIP')))
provenance = json.loads((R/'bestiary-provenance.json').read_text(encoding='utf-8'))
provenance['status'] = 'CORROBORATED_SHAREWARE_CANDIDATE_RETAIL_PARITY_UNVERIFIED'
provenance['independent_distribution'] = {
    'source_url': 'https://archive.org/download/MordorTheDepthsofDejenol_1020/MORDOR11.ZIP',
    'catalogue_url': 'https://archive.org/details/MordorTheDepthsofDejenol_1020',
    'sha256': hashlib.sha256(b).hexdigest(),
    'monster_data_identical': hashlib.sha256(inner.read('MDATA5.MDR')).hexdigest()==provenance['sha256']['MDATA5.MDR'],
    'item_data_identical': hashlib.sha256(inner.read('MDATA3.MDR')).hexdigest()==provenance['sha256']['MDATA3.MDR'],
}
provenance['limitations'] = [
    'Both independently hosted packages contain identical data; shared origin is possible and retail equivalence is unproven.',
    '401 monster records, 400 unique monster IDs, duplicate ID 307 and first name GOBLIE are preserved exactly; their historical meaning is unresolved.',
    'Record indices are not interchangeable with embedded IDs; no deduplication or name repair has been applied.',
    'Community field-layout interpretations are not executable-verified semantics.',
    'Item charges/deleted interpretation is unresolved; halves and combined raw value are retained.',
    'No original program or installer was executed; no full registered maps or behavior traces were obtained.',
]
(R/'bestiary-provenance.json').write_text(json.dumps(provenance,indent=2)+'\n',encoding='utf-8')

parts = ['''## 26 Numerical reference appendices

### 26.1 Evidence coverage

These are reference inputs for a faithful implementation, with their provenance attached. **None has been certified by running a fingerprinted registered 1.1 executable.** Printed data, later help, and binary candidates must remain separate until their differences are resolved. Tables preserve factual numbers and names; accompanying interpretation is newly written.

| Dataset | Research coverage | Status |
| --- | --- | --- |
| Races | 9 stat/age/experience rows, 9 resistance rows, 9 guild-eligibility rows | Original printed PlayGuide, visually checked |
| Guilds | 12 requirements/growth rows and 12 ability rows | Original printed PlayGuide, visually checked |
| Spell catalogue | 100 category records across 18 named categories | Later official help; formulas incomplete |
| Guild spellbooks | 205 assignments, 103 distinct literal names | Later official help; aliases and unmatched names unresolved |
| Monster data | 401 physical records, 400 unique embedded IDs | Two matching shareware distributions; retail parity unverified |
| Item data | 366 records | Same matching shareware distributions; some field meanings unresolved |
| Supplied local original files | 105 spells; complete fifteen-floor cell export; static rule interpretations | See section 26.12; runtime parity remains unverified |

The supporting CSV files contain provenance and additional fields. Blank spell fields mean unknown or absent in the source extraction, not zero cost, zero power, or immunity. A monster's stored average-hits value is not a verified fixed HP assignment.

### 26.2 Race statistics

Each stat cell is **minimum / printed natural maximum**. Age is an approximate lifespan parameter in years, not an exact death threshold. EXP is the printed experience parameter, not a percentage. G/N/E mean Good/Neutral/Evil. The Troll alignment row is transcribed as printed and remains disputed. Source: [original PlayGuide page 1](https://www.mocagh.org/miscgame/dejenol-refcard.pdf).
''']
parts.append(table(['Race','Age','EXP','STR','INT','WIS','CON','CHA','DEX','Alignment'],[
    [s['race'],s['approximate_lifespan_years'],s['experience_parameter']]+[s[k+'_min']+' / '+s[k+'_max'] for k in ['str','int','wis','con','cha','dex']]+[alignment(s)] for s in stats]))
parts.append('''### 26.3 Racial resistance values

Values are printed percentages. Dashes in the printed table are represented as 0, with that normalization recorded in the CSV. These are natural race values, not the final formula for combining equipment, spells, and other protection. Source: PlayGuide page 2.
''')
parts.append(table(['Race','Size','Fire','Cold','Elec','Mind','Disease','Poison','Magic','Stone','Paralysis','Drain','Acid'],[
    [s['race'],s['size']]+[s[k+'_pct'] for k in ['fire','cold','electrical','mind','disease','poison','magic','stone','paralysis','drain','acid']] for s in resists]))
parts.append('''### 26.4 Guild entry requirements

Requirements refer to natural statistics. Race eligibility is an additional condition, shown next. Scavenger permits G/N/E in the printed table; this was visually rechecked. Source: PlayGuide page 2.
''')
parts.append(table(['Guild','STR','INT','WIS','CON','CHA','DEX','Alignment'],[[g['guild']]+[g[k+'_req'] for k in ['str','int','wis','con','cha','dex']]+[alignment(g)] for g in guilds]))
parts.append('''### 26.5 Guild eligibility by race

This is the race permission layer only. A listed guild still requires the proper alignment and natural stats. Source: PlayGuide page 1.
''')
parts.append(table(['Race','Permitted guilds before alignment and stat checks'],[[e['race'],', '.join(g['guild'] for g in guilds if e[g['guild']]=='true')] for e in eligibility]))
parts.append('''### 26.6 Guild growth parameters

AH is the printed average/base HP-growth parameter, ML its level breakpoint, MH the subsequent HP parameter, EP the experience parameter, and QP the quest-assignment percentage. These entries do not replace the highest-guild-level rule, Constitution bonus, boundary test, or full XP formula. Mage QP is 15% in the printed card; the community Mage page says 20%. Source: PlayGuide page 2.
''')
parts.append(table(['Guild','AH','ML','MH','EP','QP percent'],[[g['guild']]+[g[k] for k in ['AH','ML','MH','EP','QP_pct']] for g in guilds]))
parts.append('''### 26.7 Guild ability parameters

These are ability parameters, **not direct success percentages, attack counts, or damage values**. Printed blank cells are represented as zero with a normalization note. Source: PlayGuide page 2.
''')
parts.append(table(['Guild','Thieving','Backstab','Critical','Multiple swings','Fighting','Perception'],[[a['guild']]+[a[k] for k in ['thieving','backstabbing','critical_hit','multiple_swings','fighting','perception']] for a in abilities]))
parts.append('''### 26.8 Spell catalogue and access

The extracted [spell statistics](research/spell-statistics-updated-help.csv) retain category, base spell level, listed guild access, six requirements, combat context, targeting parameters, and source topic. The [guild spellbook table](research/spell-guild-levels-updated-help.csv) retains each listed guild-specific level. Neither supplies a certified damage or SP-cost formula.

The following counts describe the later-help extraction, **not a certified count of original executable spells**.
''')
parts.append(table(['Guild','Extracted spellbook assignments'],[[g['guild'],sum(b['guild']==g['guild'] for b in books)] for g in guilds]))
parts.append('''The category catalogue and guild spellbooks disagree in literal naming: eight Charm names appear as Control names; Feather Essence/Essense and Precognitive/Precognative differ; the spellbook also lists Dominate Undead, Dispell Elemental, and Dispell Undead without exact matching category names in this extraction. Retain both source spellings. Resolve aliases through original IDs; do not merge records by an approximate string match.

Selected category records below demonstrate exact extracted requirements. A dash means no requirement stated in that field. “Targets” retains the printed monster/group parameter pair; its total-versus-per-group interpretation requires validation.
''')
selected = ['Firebolt','Blue Flame','Charm Insect','Soul Entrapment','Field of Death','Teleport','Retrieve Soul','Charm of Opening','Resurrect']
parts.append(table(['Spell','Class','Base level','STR','INT','WIS','CON','CHA','DEX','Targets M/G'],[
    [s['spell'],s['spell_class'],s['base_spell_level']]+[s[k+'_req'] or '—' for k in ['str','int','wis','con','cha','dex']]+[(s['monsters_parameter']+'/'+s['groups_parameter']) if s['monsters_parameter'] else '—'] for name in selected for s in spells if s['spell']==name]))
parts.append('''Later official help describes choosing the highest applicable learned spell power and the lowest available guild cost separately. Item casting may use the highest guild spell level unless the item specifies a level. This must not be simplified into selecting one “best guild” for both outcomes. [Official help](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm), `14n5mvy.htm`, Spells.

### 26.9 Full candidate bestiary and item records

The [monster CSV](research/monster-candidate-shareware.csv) contains all 401 parsed records with 71 columns, including resistance values and raw flags. The [item CSV](research/item-candidate-shareware.csv) contains all 366 parsed records with 42 columns. See the [readable bestiary table](research/monster-reference.md), [readable item table](research/item-reference.md), and [data provenance](research/bestiary-provenance.json).

The distribution mirrored by a modern remake and the independent [Internet Archive package](https://archive.org/details/MordorTheDepthsofDejenol_1020) have identical monster and item bytes. This corroborates the public shareware data, but does not prove registered-retail equivalence or all parser semantics. **Do not silently correct GOBLIE, deduplicate ID 307, or remove records with level values above 15.** Establish their original meaning first.

These selected rows are extracted candidate values. They illustrate the data available, not approved balance changes. Full resistance and attack/spell flag fields remain in the CSV.
''')
sample_names=['Kobold','Orc','Black Bear','Giant Centipede','Morgul','Shadow Ninja',"T'Lanea"]
parts.append(table(['Monster','Record','ID','Attack','Defense','Average hits','First level parameter'],[[m[k] for k in ['name','record_index','monster_id','attack','defense','average_hits','first_level']] for name in sample_names for m in monsters if m['name']==name]))
parts.append('''The community Kobold, Orc, and Black Bear pages provide secondary stat checks, but explicitly include some Mordor II material. They are not authorities for importing an entire monster definition. The Orc page describes level 2 while the candidate's stored first-level parameter is 1; this could reflect field interpretation or source differences and remains unresolved. [Kobold](https://dejenol.fandom.com/wiki/Kobold), [Orc](https://dejenol.fandom.com/wiki/Orc), [Black Bear](https://dejenol.fandom.com/wiki/Black_Bear).

### 26.10 Source fingerprints
''')
parts.append(table(['Input','SHA256'],[[k,v] for k,v in provenance['sha256'].items()]))
parts.append('''Matching hashes establish identical inputs, not correct historical semantics. Keep these fingerprints with all subsequent field and formula comparison results.

## 27 Sources and supporting files

### 27.1 Primary and technical sources

| Source | What it supports | Limitation |
| --- | --- | --- |
| [David Allen’s Mordor history](https://requnix.com/development/mordor/) | Creator and 1995 origin | Short retrospective |
| [Official Mordor product page](https://www.decklinsdemise.com/mordor.htm) | Mordor 1.1, races/guilds, combat identity, distribution and ownership statement | Current page, not a build manifest |
| [Original newcomer’s manual](https://www.mocagh.org/miscgame/dejenol-manual.pdf) | Setting and original system descriptions | Introductory; some inconsistent prose |
| [Original PlayGuide](https://www.mocagh.org/miscgame/dejenol-refcard.pdf) | Race/guild numerical tables and spellbook reference | Printed tables need executable checks |
| [Original installation guide](https://www.mocagh.org/miscgame/dejenol-install.pdf) | Windows-era operation and MIDI/audio | Not a modern implementation requirement |
| [Later official help archive](https://www.decklinsdomain.info/DsD/mordor1/M1B040b.chm) | Detailed system topics cited by filename | Maintained for M1 and legacy; version mixing possible |
| [Internet Archive shareware package](https://archive.org/details/MordorTheDepthsofDejenol_1020) | Independently hosted binary research input | Shareware, not registered retail certification |
| [Mirror fixture](https://github.com/matteo-prosperi/DungeonsOfDejremake/tree/main/tests/fixtures) | Second distribution of the same binary input | Modern project’s provenance claims require corroboration |
| [libDejenol](https://github.com/JKaniarz/libDejenol) | Community-authored original-file structure research | Incomplete field semantics; not the original engine |
| [Godot C# documentation](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/index.html) | Proposed desktop implementation feasibility | Engine versions must be pinned during development |

### 27.2 Secondary checks

The [CRPG Book retrospective](https://crpgbook.wordpress.com/review-index/1995-mordor-depths-of-dejenol/) supplies historical experience and dungeon dimensions. The [MobyGames overview](https://www.mobygames.com/game/31910/mordor-the-depths-of-dejenol/) supplies the commonly reported content counts. Community references are useful cross-checks, never silent replacements for the chosen original build.

Guild references: [Guild rules](https://dejenol.fandom.com/wiki/Guild), [Nomad](https://dejenol.fandom.com/wiki/Nomad), [Warrior](https://dejenol.fandom.com/wiki/Warrior), [Paladin](https://dejenol.fandom.com/wiki/Paladin), [Ninja](https://dejenol.fandom.com/wiki/Ninja), [Villain](https://dejenol.fandom.com/wiki/Villain), [Seeker](https://dejenol.fandom.com/wiki/Seeker), [Thief](https://dejenol.fandom.com/wiki/Thief), [Scavenger](https://dejenol.fandom.com/wiki/Scavenger), [Mage](https://dejenol.fandom.com/wiki/Mage), [Sorcerer](https://dejenol.fandom.com/wiki/Sorcerer), [Wizard](https://dejenol.fandom.com/wiki/Wizard), and [Healer](https://dejenol.fandom.com/wiki/Healer). Community content is attributed to the named pages; no community narrative descriptions are republished as game text.

The [Dungeons of Dej’remake project](https://github.com/matteo-prosperi/DungeonsOfDejremake) is used to identify changes that this remaster must avoid inheriting. Its implementation and help are not the original rules baseline.

### 27.3 Supporting research files

- [Research index and limitations](research/README.md)
- [World rules and source topic register](research/world-rules.md)
- [Character and spell evidence notes](research/character-rules.md)
- [Race statistics](research/race-statistics.csv), [resistances](research/race-resistances.csv), and [guild eligibility](research/race-guild-eligibility.csv)
- [Guild requirements and growth](research/guild-statistics.csv) and [ability parameters](research/guild-abilities.csv)
- [Spell statistics](research/spell-statistics-updated-help.csv) and [guild spell access](research/spell-guild-levels-updated-help.csv)
- [Bestiary research and schema notes](research/bestiary-data.md), [all monster fields](research/monster-candidate-shareware.csv), and [all item fields](research/item-candidate-shareware.csv)
- [Binary provenance and comparison](research/bestiary-provenance.json)

Research artifacts are development references. They do not establish permission to redistribute original art, audio, help text, or software as part of a remaster. No original installer or game executable was run during this research.
''')

# Correct actual schema widths instead of hand-maintaining a claim.
appendix='\n\n'.join(parts)
appendix=appendix.replace('with 71 columns',f'with {len(monsters[0])} columns').replace('with 42 columns',f'with {len(items[0])} columns')
# Keep the second-pass technical appendix and evidence links on regeneration.
supplement = R / 'second-pass-appendix.md'
if supplement.exists():
    appendix = appendix.replace('## 27 Sources and supporting files', supplement.read_text(encoding='utf-8').strip() + '\n\n## 27 Sources and supporting files')
    appendix = appendix.replace('This must not be simplified into selecting one “best guild” for both outcomes.', 'This must not be simplified into selecting one “best guild” for both outcomes. The claimed active-guild healing exception is unresolved: see section 9.6 and conflict F16 before applying this general account to healing.')
    appendix = appendix.replace('Its implementation and help are not the original rules baseline.', 'Its public implementation source is not available for inspection; its documentation is not the original rules baseline. The second pass is pinned to commit `c932f12ec163693e120a4dc236610619f6af96ab` (October 1, 2026).')
    appendix = appendix.replace('- [Research index and limitations](research/README.md)', '- [Research index and limitations](research/README.md)\n- [Second-pass review and decisions](research/second-pass-review.md), [pinned source manifest](research/second-pass-sources.json), and [structural data audit](research/second-pass-data-audit.json)')
# Preserve the third-pass original-file evidence on every regeneration.
local_supplement = R / 'local-original-appendix.md'
if local_supplement.exists():
    appendix = appendix.replace('## 27 Sources and supporting files', local_supplement.read_text(encoding='utf-8').strip() + '\n\n## 27 Sources and supporting files')
    appendix = appendix.replace('The claimed active-guild healing exception is unresolved: see section 9.6 and conflict F16 before applying this general account to healing.', 'The supplied decompiled healing branch supports an active-guild exception and positive cast-level override; see section 9.6 and F16. Runtime verification remains outstanding.')
    appendix = appendix.replace('The Troll alignment row is transcribed as printed and remains disputed.', 'The Troll row below remains the printed transcription. The local original data stores mask 7 (G/N/E); see section 26.12 rather than silently merging the two sources.')
    appendix = appendix.replace('### 26.8 Spell catalogue and access', '### 26.8 Later-help spell catalogue and access\n\nThis table preserves the earlier help transcription. The supplied original MDATA2 now provides 105 records, including duplicate IDs and different values; section 26.12 and the local spell table take precedence as evidence of the local stored inputs.')
    appendix = appendix.replace('### 26.9 Full candidate bestiary and item records', '### 26.9 Full candidate bestiary and item records\n\nThese remain public-archive tables. Local item bytes match; local Dark Shape item_1 differs (33 versus public 34). Local exports and the field comparison are in section 26.12.')
    appendix = appendix.replace('- [Research index and limitations](research/README.md)', '- [Original-file review and source anchors](research/local-original-review.md), [extraction summary](research/local-original/extraction-summary.json), and [source preservation report](research/local-original/source-preservation-check.json)\n- [Local races](research/local-original/races-local.csv), [guilds](research/local-original/guilds-local.csv), [items](research/local-original/items-local.csv), [monsters](research/local-original/monsters-local.csv), and [spell reference](research/local-original/spell-reference.md)\n- [Research index and limitations](research/README.md)')
body=DOC.read_text(encoding='utf-8').split('\n## 26 Numerical reference appendices')[0].rstrip()
body=body.replace('quarantined candidate binary data','candidate binary data awaiting retail validation')
body=body.replace('Candidate has 401 records, duplicate ID 307, and first name GOBLIE | Obtain independent original data and compare bytes/records','Two distribution sources match bytes; 401 records, duplicate ID 307, and first name GOBLIE remain | Compare with registered data and original library behavior')
DOC.write_text(body+'\n\n'+appendix,encoding='utf-8')

monster_intro='''# Mordor candidate bestiary reference

All physical records parsed from the publicly archived Mordor 1.1 shareware data. This is a **research candidate, not a certified retail bestiary**. Two independently hosted packages match bytes. Record index and embedded ID differ; retain both. ID 307 is duplicated and GOBLIE is the source spelling. Levels above 15 are preserved without assuming a playable extra floor. Average hits and first-level fields are community format interpretations, not verified runtime distributions. Full statistics, resistances, raw flags and loot fields are in [the CSV](monster-candidate-shareware.csv); [provenance](bestiary-provenance.json) records hashes and limitations. No names or numbers were rebalanced.

Source: [Internet Archive package](https://archive.org/details/MordorTheDepthsofDejenol_1020). Format reference: [libDejenol](https://github.com/JKaniarz/libDejenol).

'''
(R/'monster-reference.md').write_text(monster_intro+table(['Record','ID','Monster','Attack','Defense','Average hits','First level','STR','CON','DEX'],[[m[k] for k in ['record_index','monster_id','name','attack','defense','average_hits','first_level','stat_strength','stat_constitution','stat_dexterity']] for m in monsters]),encoding='utf-8')
item_intro='''# Mordor candidate item reference

All 366 item records parsed from the same corroborated public shareware data. **Retail parity and some field interpretations remain unverified.** Price is the stored base-price parameter, not a guaranteed buy or sell quote. Damage modifier is the stored floating parameter, not an independently verified formula. The CSV preserves requirements, modifiers, guild/alignment/resistance masks, charges and other fields; see [all item fields](item-candidate-shareware.csv) and [provenance](bestiary-provenance.json). No values were rebalanced.

Source: [Internet Archive package](https://archive.org/details/MordorTheDepthsofDejenol_1020). Format reference: [libDejenol](https://github.com/JKaniarz/libDejenol).

'''
(R/'item-reference.md').write_text(item_intro+table(['Record','ID','Item','Attack','Defense','Base price','First level','Damage modifier'],[[i[k] for k in ['record_index','item_id','name','attack','defense','base_price','first_level','damage_modifier']] for i in items]),encoding='utf-8')

print(json.dumps({'document_words':len(DOC.read_text(encoding='utf-8').split()),'monster_records':len(monsters),'monster_columns':len(monsters[0]),'item_records':len(items),'item_columns':len(items[0]),'spell_records':len(spells),'guild_spell_rows':len(books),'independent_comparison':provenance['independent_distribution']},indent=2))
