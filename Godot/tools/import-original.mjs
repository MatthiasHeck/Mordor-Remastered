// Copies evidence; never executes or writes into the original installation.
// Run with: node Godot/tools/import-original.mjs [path-to-Mordor]
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const source = path.resolve(process.argv[2] ?? path.join(root, '../Mordor'));
const installation = path.join(source, '_Original Game Files');
const project = path.join(root, 'Godot');
const sha = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const manifest = {format: 1, source_installation: installation, behavioral_parity: false, files: []};
const output = (relative, bytes) => {
  const target = path.join(project, relative);
  fs.mkdirSync(path.dirname(target), {recursive: true});
  fs.writeFileSync(target, bytes);
};
const json = (relative, value) => output(relative, JSON.stringify(value, null, 2) + '\n');
const copy = (input, target, origin) => {
  const bytes = fs.readFileSync(input);
  output(target, bytes);
  manifest.files.push({source: origin, target, bytes: bytes.length, sha256: sha(bytes)});
};
// Record the executable identity, but do not ship or run a Win16 executable in Godot.
manifest.executable_sha256 = sha(fs.readFileSync(path.join(installation, 'MORDOR.EXE')));
for (const name of fs.readdirSync(path.join(installation, 'DATA')).sort()) {
  if (/^MDATA\d+\.MDR$/i.test(name)) {
    copy(path.join(installation, 'DATA', name), `data/original/${name}`, `_Original Game Files/DATA/${name}`);
  }
}
const vb = path.join(source, 'POOP');
for (const name of fs.readdirSync(vb).sort()) {
  if (/\.(bas|txt)$/i.test(name)) copy(path.join(vb, name), `reference/vb/${name}`, `POOP/${name}`);
}
for (const name of fs.readdirSync(path.join(source, 'CodeFiles')).sort()) {
  if (/\.(h|cpp)$/i.test(name)) copy(path.join(source, 'CodeFiles', name), `reference/cpp/${name}`, `CodeFiles/${name}`);
}
for (const name of fs.readdirSync(path.join(root, 'research/original-export/graphics/png')).sort()) {
  if (name.endsWith('.png')) copy(path.join(root, 'research/original-export/graphics/png', name), `assets/graphics/${name}`, `research/original-export/graphics/png/${name}`);
}
for (const name of fs.readdirSync(path.join(root, 'research/fidelity-foundations/audio')).sort()) {
  // .bin prevents Godot's WAV importer looping on odd-length legacy RIFF data.
  // The runtime adapter reads the original bytes without changing sample data.
  if (/\.(wav|mid)$/i.test(name)) copy(path.join(root, 'research/fidelity-foundations/audio', name), `assets/audio/${name}.bin`, `research/fidelity-foundations/audio/${name}`);
}
// Preserve inclusive VB array upper bounds and declaration order. Godot's codec
// stores multidimensional arrays flat in VB column-major order.
const declarations = fs.readFileSync(path.join(vb, 'main.txt'), 'latin1');
const types = {};
for (const block of declarations.matchAll(/^Type (\w+)\r?\n([\s\S]*?)^End Type/gm)) {
  const fields = [];
  for (const line of block[2].split(/\r?\n/).filter(x => x.trim())) {
    const match = line.match(/^\s*(\w+)(?:\(([^)]+)\))? As (\w+)(?: \* (\d+))?/);
    if (!match) throw new Error(`Unrecognized declaration: ${line}`);
    const [,name, dimensions, type, length] = match;
    fields.push({name, type, ...(dimensions ? {dimensions: dimensions.split(',').map(x => Number(x.trim()) + 1)} : {}), ...(length ? {length: Number(length)} : {})});
  }
  types[block[1]] = fields;
}
json('data/types.json', types);
const constants = {};
for (const file of fs.readdirSync(vb).filter(x => /\.(bas|txt)$/.test(x))) {
  const text = fs.readFileSync(path.join(vb, file), 'latin1');
  constants[file] = {};
  for (const match of text.matchAll(/^(?:Global )?Const (\w+)\s*=\s*("[^"]*"|[-+]?\d+(?:\.\d+)?)/gm)) {
    constants[file][match[1]] = match[2].startsWith('"') ? match[2].slice(1,-1) : Number(match[2]);
  }
}
json('data/constants.json', constants);
// Literal guild titles from Module6.fn126E; retain strict '<' tier boundaries.
const titleSource = fs.readFileSync(path.join(vb,'Module6.bas'),'latin1').match(/^Function fn126E[\s\S]*?^End Function/m)?.[0];
if (!titleSource) throw new Error('Missing guild-title procedure');
const guildTitles = {};
let titleGuild, titleBoundary;
for (const line of titleSource.split(/\r?\n/)) {
  let match;
  if ((match = line.match(/^        Case (\d+)$/))) {
    titleGuild = match[1]; guildTitles[titleGuild] = [];
  } else if ((match = line.match(/Case Is < (\d+)/))) titleBoundary = Number(match[1]);
  else if (/Case Else/.test(line)) titleBoundary = null;
  else if ((match = line.match(/fn126E = "([^"]*)"/))) guildTitles[titleGuild].push({below:titleBoundary,title:match[1]});
}
if (Object.keys(guildTitles).length !== 12 || Object.values(guildTitles).some(tiers => tiers.at(-1)?.below !== null)) throw new Error('Incomplete title tiers');
json('data/guild-titles.json',guildTitles);
const procedures = JSON.parse(fs.readFileSync(path.join(root, 'research/original-export/code/procedures.json'), 'utf8'));
const ports = JSON.parse(fs.readFileSync(path.join(project, 'ports.json'), 'utf8'));
const covered = new Map(ports.procedures.map(x => [`${x.file}:${x.name}`, x]));
for (const proc of procedures) {
  // Match the reference index against the actual supplied source, not just a filename.
  const src = fs.readFileSync(path.join(vb, proc.file), 'latin1');
  if (!src.split(/\r?\n/)[proc.start_line-1].includes(proc.name)) throw new Error(`Stale source index: ${proc.name}`);
  proc.source_text = src.split(/\r?\n/).slice(proc.start_line-1, proc.end_line).join('\n');
  proc.port = covered.get(`${proc.file}:${proc.name}`) ?? {status: 'not_ported'};
}
json('data/procedures.json', procedures);
const labels = [];
const labelSymbols = {gv07B0:'spell_category', gv05EE:'stat', gv0620:'resistance', gv0652:'guild_ability', gv08DC:'monster_property', gv0684:'item_ability', gv090E:'monster_attack', gv194E:'terrain_flag', gv074C:'alignment', gv06B6:'sex'};
const module1 = fs.readFileSync(path.join(vb, 'Module1.bas'), 'latin1');
for (const [symbol,kind] of Object.entries(labelSymbols)) {
  for (const m of module1.matchAll(new RegExp('^\\s*'+symbol+'\\$?\\((\\d+)\\) = "([^"]*)"', 'gm'))) labels.push({kind, index:Number(m[1]), label:m[2]});
}
json('data/labels.json', labels);
copy(path.join(root, 'research/fidelity-foundations/audio-manifest.json'), 'tests/reference/audio-manifest.json', 'research/fidelity-foundations/audio-manifest.json');
// Independent research exports are fixtures only; production loads binary files.
for (const name of fs.readdirSync(path.join(root, 'research/local-original')).sort()) {
  if (name.endsWith('-local.csv')) copy(path.join(root, 'research/local-original', name), `tests/reference/${name}`, `research/local-original/${name}`);
}
manifest.type_count = Object.keys(types).length;
manifest.procedure_count = procedures.length;
manifest.translated_procedures = procedures.filter(x => x.port.status === 'translated_candidate').length;
manifest.partial_procedures = procedures.filter(x => x.port.status === 'partial').length;
json('data/manifest.json', manifest);
output('reference/.gdignore', '');
output('tools/.gdignore', '');
output('tests/reference/.gdignore', '');
output('tests/tmp/.gdignore', '');
output('tests/screenshots/.gdignore', '');
console.log(JSON.stringify({files:manifest.files.length, types:manifest.type_count, procedures:procedures.length, translated:manifest.translated_procedures, partial:manifest.partial_procedures, executable:manifest.executable_sha256},null,2));
