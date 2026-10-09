"""Read-only audit of supplied Mordor files; all outputs stay beside this script."""
from pathlib import Path
from collections import Counter
import csv, hashlib, importlib.util, json, struct, sys, zipfile, re, math
sys.dont_write_bytecode = True
SOURCE = Path('D:/Programming Projects/Mordor').resolve()
OUT = Path(__file__).resolve().parent / 'local-original'
OUT.mkdir(exist_ok=True)
assert SOURCE not in OUT.parents

def digest(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for chunk in iter(lambda: f.read(1024*1024), b''):
            h.update(chunk)
    return h.hexdigest()

def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n', encoding='utf-8')

def export(name, rows):
    with (OUT / name).open('w', encoding='utf-8', newline='') as f:
        w=csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)

if '--snapshot' in sys.argv or '--verify' in sys.argv:
    entries={str(p.relative_to(SOURCE)): {'size':p.stat().st_size,'sha256':digest(p)}
             for p in sorted(SOURCE.rglob('*')) if p.is_file()}
    if '--verify' in sys.argv:
        original=json.loads((OUT/'source-inventory.json').read_text(encoding='utf-8'))['files']
        changes=[p for p in original.keys() | entries.keys() if original.get(p)!=entries.get(p)]
        write('source-preservation-check.json', {'files_checked':len(entries),'changed_added_removed':changes})
        assert not changes, changes
        print(json.dumps({'source_files_unchanged':len(entries)}))
    else:
        if (OUT/'source-inventory.json').exists():
            raise RuntimeError('Snapshot exists; refusing to replace the before-state.')
        write('source-inventory.json',{'source_root':str(SOURCE),'review_date':'2026-10-09','files':entries})
        print(json.dumps({'source_files':len(entries),'bytes':sum(v['size'] for v in entries.values())}))
    sys.exit()

spec=importlib.util.spec_from_file_location('existing_parser',OUT.parent/'bestiary-extract.py')
parser=importlib.util.module_from_spec(spec); spec.loader.exec_module(parser)
groups={}
for name in ['MORDOR.EXE','MORDOR.HLP']+[f'MDATA{i}.MDR' for i in range(1,16)]:
    matches=[]
    for p in SOURCE.rglob(name):
        matches.append({'path':str(p.relative_to(SOURCE)),'size':p.stat().st_size,'sha256':digest(p)})
    groups[name]=matches
write('file-comparison.json',groups)
data=SOURCE/'ORIGINAL_DATA'
monsters=parser.extract_monsters((data/'MDATA5.MDR').read_bytes())
items=parser.extract_items((data/'MDATA3.MDR').read_bytes())
export('monsters-local.csv',monsters); export('items-local.csv',items)
diff=[]
for name,rows in [('monster',monsters),('item',items)]:
    old=list(csv.DictReader((OUT.parent/(name+'-candidate-shareware.csv')).open(encoding='utf-8')))
    for i in range(max(len(old),len(rows))):
        a=old[i] if i<len(old) else {}; b=rows[i] if i<len(rows) else {}
        for field in a.keys() | b.keys():
            if str(a.get(field,''))!=str(b.get(field,'')):
                diff.append({'kind':name,'record_index':i+1,'field':field,'public_value':a.get(field,''),'local_value':b.get(field,'')})
write('public-local-field-differences.json',diff)
class Reader:
    def __init__(self,b): self.b=b; self.pos=0
    def get(self,f):
        x=struct.unpack_from('<'+f,self.b,self.pos)[0]; self.pos+=struct.calcsize('<'+f); return x
    def string(self):
        n=self.get('H'); x=self.b[self.pos:self.pos+n].decode('cp1252'); self.pos+=n; return x

def rec(b,size,n): return Reader(b[(n-1)*size:n*size])
def take(reader,row,names,fmt='h'):
    for name in names.split(): row[name]=reader.get(fmt)

b=(data/'MDATA1.MDR').read_bytes()
assert rec(b,260,1).string()=='1.1'
counts=[rec(b,260,i).get('h') for i in range(2,8)]
races=[]; guilds=[]; subtypes=[]; types=[]; montypes=[]; monsubtypes=[]; n=8
stats=['strength','intelligence','wisdom','constitution','charisma','dexterity','unused_7']
for j in range(counts[0]):
    r=rec(b,260,n); n+=1; row={'race_index':j,'name':r.string()}
    for prefix in ['min_','max_']:
        for stat in stats: row[prefix+stat]=r.get('h')
    for kind in ['fire','cold','electrical','mind','disease','poison','magic','stone','paralysis','drain','acid','unused_12']:
        row['resistance_'+kind]=r.get('h')
    take(r,row,'alignment_mask_raw','i'); take(r,row,'size_raw bonus_points max_age'); take(r,row,'experience_parameter','f')
    row['record_bytes_read']=r.pos; assert r.pos<=260; races.append(row)
for j in range(counts[1]):
    r=rec(b,260,n); n+=1; row={'guild_index':j,'name':r.string()}
    take(r,row,'average_hp hp_breakpoint post_breakpoint_hp'); take(r,row,'experience_parameter','f'); take(r,row,'M55AD_raw')
    for stat in stats: row['required_'+stat]=r.get('h')
    take(r,row,'alignment_mask_raw','i')
    for k in range(7): row[f'ability_{k}_raw']=r.get('f')
    take(r,row,'M55CB_raw'); take(r,row,'M55D8_raw','f'); take(r,row,'quest_parameter')
    # VB stores the first dimension contiguously, then advances the second.
    for col in range(2):
        for category in range(19): row[f'spell_category_{category}_column_{col}']=r.get('f')
    take(r,row,'race_mask_raw','i'); take(r,row,'M4F2D_raw'); take(r,row,'M560D_raw M4E97_raw M4EA1_raw','f')
    take(r,row,'M561A_raw'); take(r,row,'M5626_raw','f'); take(r,row,'M5631_raw M563F_raw')
    row['record_bytes_read']=r.pos; assert r.pos<=260; guilds.append(row)
for count,rows,key in zip(counts[2:],[subtypes,types,montypes,monsubtypes],['parent_class_raw','equippable_raw','unused_raw','parent_type_raw']):
    for j in range(count):
        r=rec(b,260,n); n+=1; rows.append({'index':j,'name':r.string(),key:r.get('h')})
for name,rows in [('races',races),('guilds',guilds),('item-subtypes',subtypes),('item-classes',types),('monster-types',montypes),('monster-subtypes',monsubtypes)]: export(name+'-local.csv',rows)

b=(data/'MDATA2.MDR').read_bytes(); assert rec(b,75,1).string()=='1.1'
spellcount=rec(b,75,2).get('h'); spells=[]
for j in range(spellcount):
    r=rec(b,75,j+3); row={'record_index':j+1,'name':r.string()}
    take(r,row,'spell_id category base_level M556D_raw M5B0A_raw M5B12_raw monsters_parameter groups_parameter power_base power_modifier special_effect_raw')
    for stat in stats: row['required_'+stat]=r.get('h')
    take(r,row,'resisted_by_raw'); row['record_bytes_read']=r.pos
    assert r.pos<=75 and row['name'].isprintable(); spells.append(row)
export('spells-local.csv',spells)
links=[]
for item in items:
    ix=item['spell_index']
    if ix>0:
        s=spells[ix-1]
        links.append({'item':item['name'],'spell_index':ix,'item_spell_id':item['spell_id'],'spell_name':s['name'],'spell_id':s['spell_id'],'id_matches':item['spell_id']==s['spell_id']})
export('item-spell-links-local.csv',links)

b=(data/'MDATA11.MDR').read_bytes(); floors=rec(b,20,1).get('h'); maps=[]; cells=[]; areas=[]; teleporters=[]; chutes=[]
for floor in range(floors):
    start=rec(b,20,floor+2).get('h'); r=rec(b,20,start); header={'table_floor':floor+1,'start_record':start}
    take(r,header,'width height stored_floor area_count chute_count teleporter_count'); n=start+1
    rock=0
    for j in range(header['width']*header['height']):
        r=rec(b,20,n); n+=1; aid=r.get('h'); flags=r.get('q'); assert flags%10000==0
        decoded=flags//10000; rock+=bool(decoded & (1<<19))
        cells.append({'floor':floor+1,'cell_index':j,'x_candidate':j%header['width']+1,'y_candidate':j//header['width']+1,'area_id':aid,'flags_currency_raw':flags,'flags_integer':decoded})
    assert rec(b,20,n).get('h')==header['area_count']; n+=1
    for j in range(201):
        r=rec(b,20,n); n+=1; areas.append({'floor':floor+1,'area_index':j,'spawn_mask_raw':r.get('I'),'lair_id_raw':r.get('h')})
    assert rec(b,20,n).get('h')==header['teleporter_count']; n+=1
    for j in range(header['teleporter_count']):
        r=rec(b,20,n); n+=1; row={'floor':floor+1,'slot':j}; take(r,row,'x y destination_x destination_y destination_floor'); teleporters.append(row)
    assert rec(b,20,n).get('h')==header['chute_count']; n+=1
    for j in range(header['chute_count']):
        r=rec(b,20,n); n+=1; row={'floor':floor+1,'slot':j}; take(r,row,'x y depth'); chutes.append(row)
    header['rock_flag_cells']=rock; header['nonrock_flag_cells']=header['width']*header['height']-rock
    header['parsed_end_record']=n-1; maps.append(header)
for name,rows in [('dungeon-floors',maps),('dungeon-cells',cells),('dungeon-areas',areas),('dungeon-teleporters',teleporters),('dungeon-chutes',chutes)]: export(name+'-local.csv',rows)
summary={'counts':dict(zip(['races','guilds','item_subtypes','item_classes','monster_types','monster_subtypes'],counts)),
 'spells':len(spells),'unique_spell_ids':len(set(s['spell_id'] for s in spells)),
 'monsters':len(monsters),'items':len(items),'public_difference_count':len(diff),'differences':diff,
 'monster_changed':monsters[265]['name'],'item_spell_links':len(links),'item_spell_link_mismatches':[x for x in links if not x['id_matches']],
 'floors':maps,'cells':len(cells),'source_root_untouched_by_this_script':True}
write('extraction-summary.json',summary)
module=(SOURCE/'POOP/Module1.bas').read_text(encoding='cp1252')
label_arrays={'gv07B0':'spell_category','gv05EE':'stat','gv0620':'resistance','gv0652':'guild_ability','gv08DC':'monster_property','gv0684':'item_ability','gv090E':'monster_attack','gv194E':'terrain_flag','gv074C':'character_alignment','gv077E':'item_alignment','gv0814':'death_state'}
labels=[]
for symbol,kind in label_arrays.items():
    for m in re.finditer(r'^\s*'+symbol+r'\$?\((\d+)\) = "([^"]*)"',module,re.M):
        labels.append({'kind':kind,'index':int(m[1]),'label':m[2],'source':'POOP/Module1.bas','line':module[:m.start()].count('\n')+1})
export('enum-labels-decompiled.csv',labels)
categories={x['index']:x['label'] for x in labels if x['kind']=='spell_category'}
access=[]
for guild in guilds:
    for spell in spells:
        cat=spell['category']; multiplier=guild[f'spell_category_{cat}_column_0']; cap=guild[f'spell_category_{cat}_column_1']
        if multiplier>0 and spell['base_level']<=cap:
            threshold=spell['base_level']*multiplier
            access.append({'guild':guild['name'],'spell':spell['name'],'spell_record_index':spell['record_index'],'spell_id':spell['spell_id'],'category':categories.get(cat,str(cat)),
                'base_level':spell['base_level'],'category_multiplier':multiplier,'category_cap':cap,
                'required_spell_level_product':threshold,'guild_level_candidate':max(1,2*math.ceil(threshold)-1),
                'evidence':'MDATA1/2 + FRMCTYG.bas:310-336; runtime pending'})
export('guild-spell-access-local.csv',access)
summary['guild_spell_relations'] = len(access)
summary['guild_access_physical_spells'] = len(set(a['spell_record_index'] for a in access))
summary['duplicate_spell_ids'] = {str(k): [{'record_index':s['record_index'],'name':s['name']} for s in spells if s['spell_id']==k]
    for k,v in Counter(s['spell_id'] for s in spells).items() if v>1}
summary['no_ordinary_guild_access'] = [s['name'] for s in spells if not any(a['spell_record_index']==s['record_index'] for a in access)]
write('extraction-summary.json',summary)
printed_races=list(csv.DictReader((OUT.parent/'race-statistics.csv').open(encoding='utf-8')))
printed_guilds=list(csv.DictReader((OUT.parent/'guild-statistics.csv').open(encoding='utf-8')))
cross=[]
for rows,old,kind,idfield,fields in [
    (races,printed_races,'race','race',{'max_age':'approximate_lifespan_years','experience_parameter':'experience_parameter',**{f'{prefix}_{long}':f'{short}_{prefix}' for prefix in ['min','max'] for short,long in zip(['str','int','wis','con','cha','dex'],stats)}}),
    (guilds,printed_guilds,'guild','guild',{'average_hp':'AH','hp_breakpoint':'ML','post_breakpoint_hp':'MH','experience_parameter':'EP','quest_parameter':'QP_pct',**{f'required_{long}':f'{short}_req' for short,long in zip(['str','int','wis','con','cha','dex'],stats)}})]:
    for row in rows:
        prev=next(x for x in old if x[idfield]==row['name'])
        for field,oldfield in fields.items():
            if float(row[field])!=float(prev[oldfield]): cross.append({'kind':kind,'name':row['name'],'field':field,'printed':prev[oldfield],'local':row[field]})
        oldmask=sum(1<<i for i,k in enumerate(['good','neutral','evil']) if prev[k]=='true')
        if oldmask!=row['alignment_mask_raw']: cross.append({'kind':kind,'name':row['name'],'field':'alignment_mask','printed':oldmask,'local':row['alignment_mask_raw']})
write('printed-local-differences.json',cross)
help_spells=list(csv.DictReader((OUT.parent/'spell-statistics-updated-help.csv').open(encoding='utf-8')))
spell_diffs=[]
for s in spells:
    matched=next((x for x in help_spells if x['spell']==s['name']),None)
    if matched:
        for local,helpfield in [('base_level','base_spell_level'),('monsters_parameter','monsters_parameter'),('groups_parameter','groups_parameter')]+[(f'required_{long}',f'{short}_req') for short,long in zip(['str','int','wis','con','cha','dex'],stats)]:
            if matched[helpfield] and int(matched[helpfield])!=s[local]:
                spell_diffs.append({'name':s['name'],'field':local,'later_help':matched[helpfield],'local':s[local]})
write('spell-help-comparison.json',{'exact_name_matches':sum(any(x['spell']==s['name'] for x in help_spells) for s in spells),'differences':spell_diffs,
 'local_names_without_exact_help_match':[s['name'] for s in spells if not any(x['spell']==s['name'] for x in help_spells)],
 'help_names_without_exact_local_match':[s['spell'] for s in help_spells if not any(x['name']==s['spell'] for x in spells)]})
wip=SOURCE/'Mordor/setup/MORDOR.WIP'; package=[]
with zipfile.ZipFile(wip) as z:
    for name in ['MORDOR.EXE','MORDOR.HLP','MDATA1.MDR','MDATA2.MDR','MDATA3.MDR','MDATA5.MDR']:
        raw=z.read(name); local=SOURCE/'Mordor'/name if name.startswith('MORDOR') else data/name
        package.append({'name':name,'sha256':hashlib.sha256(raw).hexdigest(),'matches_installed':raw==local.read_bytes()})
write('installer-member-comparison.json',{'archive':'Mordor/setup/MORDOR.WIP','sha256':digest(wip),'members':package,'map_note':'MDATA11.MDR is not a member; installed maps audited separately.'})

def table(headers,rows):
    def line(xs): return '| '+' | '.join(str(x).replace('|','\\|') for x in xs)+' |'
    return '\n'.join([line(headers),line(['---']*len(headers))]+[line(x) for x in rows])
spell_table=table(['Record','ID','Spell','Class','Base level','Cost parameter*','Power base*','Modifier raw*','Targets M/G'],
 [[s['record_index'],s['spell_id'],s['name'],categories.get(s['category'],s['category']),s['base_level'],s['M556D_raw'],s['power_base'],s['power_modifier'],f"{s['monsters_parameter']}/{s['groups_parameter']}"] for s in spells])
(OUT/'spell-reference.md').write_text('# Local original spell records\n\n105 records from the supplied MDATA2.MDR, parsed using its VB record loader and type declaration. Counts include records without ordinary guild access. These are file values, not certified observed behavior. Cost parameter is not a final SP quote; modifier is stored raw and the decompiled detail display adds one. Full requirements and effect fields are in [spells-local.csv](spells-local.csv); guild access is in [guild-spell-access-local.csv](guild-spell-access-local.csv).\n\n'+spell_table+'\n',encoding='utf-8')
appendix='''### 26.12 Supplied original-file findings — October 9, 2026

The new local evidence is independent of the earlier help transcription. All outputs are under `research/local-original`; the supplied `Mordor` tree is read-only. See the [local review](research/local-original-review.md), [source fingerprints](research/local-original/source-inventory.json), and [data summary](research/local-original/extraction-summary.json). File facts and static decompiler interpretations do not certify runtime parity.

| Dataset | Local extraction | Qualification |
| --- | --- | --- |
| Race and guild definitions | 9 races; 12 guilds | Includes starting allocation pools and raw spell-category matrices |
| Spell definitions | 105 records; 103 distinct embedded IDs | IDs 93 and 94 are duplicated; retain record identity |
| Item definitions | 366 records | MDATA3 bytes match the earlier public archive |
| Monster definitions | 401 physical records | Dark Shape item field differs; duplicate ID 307 remains |
| Item taxonomy | 35 subtypes; 24 classes | Equippable values include a special -1 case |
| Monster taxonomy | 18 types; 15 subtypes | Preserve raw type/flag interpretation |
| Dungeon | 15 floors × 30 × 30; 13,500 cells | Full cells, room records and transition slots exported |

**Creation pools:** each stat initially receives racial minimum + 5 in the decompiled creation screen; these additional points remain available for allocation. Subtracting a stat down to its minimum refunds points. The table does not equate pool size with total points above racial minima.

'''
appendix+=table(['Race','Additional pool','Alignment mask','Experience parameter'],[[x['name'],x['bonus_points'],x['alignment_mask_raw'],x['experience_parameter']] for x in races])
appendix+='\n\nCharacter alignment bits are Good=1, Neutral=2, Evil=4. The local Troll mask is 7; the printed N/E restriction is not the local data rule. Local Mage quest parameter is 15, but actual assignment includes additional gates described in section 14.7.\n\n**Spell samples:** cost and power fields are raw inputs, not final resource costs or guaranteed effects.\n\n'
appendix+=table(['Spell','ID','Base level','Cost parameter','Power base','Raw modifier'],[[s[k] for k in ['name','spell_id','base_level','M556D_raw','power_base','power_modifier']] for s in spells if s['name'] in ['Charm of Opening','Firebolt','Blue Flame','Minor Heal','Heal','Dominate Undead']])
appendix+='\n\n[All spell records](research/local-original/spell-reference.md), [full spell fields](research/local-original/spells-local.csv), [derived guild access](research/local-original/guild-spell-access-local.csv), [item-to-spell references](research/local-original/item-spell-links-local.csv), and [help differences](research/local-original/spell-help-comparison.json) preserve the evidence separately.\n\n**Dungeon manifest:** transition counts are allocated records, including zero/unused entries; they are not counts of active hazards. Non-rock does not imply reachable.\n\n'
appendix+=table(['Floor','Width','Height','Rock-flag cells','Teleporter slots','Chute slots'],[[x[k] for k in ['stored_floor','width','height','rock_flag_cells','teleporter_count','chute_count']] for x in maps])
appendix+='\n\n[Cell records](research/local-original/dungeon-cells-local.csv), [room records](research/local-original/dungeon-areas-local.csv), [teleporters](research/local-original/dungeon-teleporters-local.csv), and [chutes](research/local-original/dungeon-chutes-local.csv) retain unused slots. The parser reads 201 area slots per floor rather than trusting the area count as a physical record count. Terrain flags are stored as VB Currency scaled by 10,000.\n\nSource executable SHA256: `'+groups['MORDOR.EXE'][0]['sha256']+'`. Matching installed copies and installer members establish local consistency; they do not independently establish the distribution license or link every decompiled statement to an executable address.\n'
(OUT.parent/'local-original-appendix.md').write_text(appendix,encoding='utf-8')
print(json.dumps({'guild_spell_links':len(access),'printed_differences':cross,'spell_field_differences':len(spell_diffs),'special_unassigned_spells':[s['name'] for s in spells if not any(a['spell_id']==s['spell_id'] for a in access)]},indent=2))
print(json.dumps({'counts':summary['counts'],'spells':len(spells),'floors':floors,'cells':len(cells),'differences':diff,'monster_changed':monsters[265]['name'],
 'race_creation':[{k:r[k] for k in ['name','bonus_points','alignment_mask_raw','experience_parameter']} for r in races],
 'spell_samples':[r for r in spells if r['name'] in ['Firebolt','Blue Flame','Charm of Opening','Heal','Dominate Undead']],
 'link_mismatch_count':len(summary['item_spell_link_mismatches'])},indent=2))
