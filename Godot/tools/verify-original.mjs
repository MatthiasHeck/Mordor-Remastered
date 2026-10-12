// Read-only integrity check against the research inventory and copied inputs.
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const inventory = JSON.parse(fs.readFileSync(path.join(root,'research/local-original/source-inventory.json'),'utf8'));
const source = path.resolve(process.argv[2] ?? inventory.source_root);
const sha = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const failures = [];
let originals = 0;
for (const [relative, expected] of Object.entries(inventory.files)) {
  const file = path.join(source,relative);
  if (!fs.existsSync(file)) { failures.push(`Missing original: ${relative}`); continue; }
  const bytes = fs.readFileSync(file);
  if (bytes.length !== expected.size || sha(bytes) !== expected.sha256) failures.push(`Original differs from inventory: ${relative}`);
  originals++;
}
const manifest = JSON.parse(fs.readFileSync(path.join(root,'Godot/data/manifest.json'),'utf8'));
for (const item of manifest.files) {
  const file = path.join(root,'Godot',item.target);
  if (!fs.existsSync(file) || sha(fs.readFileSync(file)) !== item.sha256) failures.push(`Copied input differs: ${item.target}`);
}
const report = {originals_checked:originals,copies_checked:manifest.files.length,failures};
fs.writeFileSync(path.join(root,'Godot/tests/integrity-results.json'),JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report,null,2));
process.exitCode = failures.length ? 1 : 0;
