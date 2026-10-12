import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {fileURLToPath} from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
const relative = 'research/fidelity-foundations/runtime-libraries/VBRUN300.DLL';
const bytes = fs.readFileSync(path.join(root, relative));
const code = '57a1160e8b0e9014f7e1978bdaa1180ef7e103d8a19014f726160e03d8033e9414121e941432ff8bd78916160e891e180e5f9bdb06160e9bd8369814';
assert.equal(bytes.subarray(228026,228026 + code.length / 2).toString('hex'),code);
assert.equal(bytes.readUInt32LE(294646),0x50000);
assert.equal(bytes.readUInt16LE(296304),0x43fd);
assert.equal(bytes.readUInt16LE(296308),0x9ec3);
assert.equal(bytes[296308],0xc3);
assert.equal(bytes.readFloatLE(296312),16777216);
let state = 0x50000n;
let half = Number(state);
const golden = [];
for (let i=0;i<10000;i++) {
  state = (state * 0xfd43fdn + 0xc39ec3n) & 0xffffffn;
  const lo = half & 0xffff, hi = half >>> 16;
  const product = lo * 0x43fd;
  const added = (product & 0xffff) + 0x9ec3;
  half = ((((product >>> 16) + hi * 0x43fd + lo * 0x43fd + 0xc3 + (added >>> 16)) & 0xff) << 16) | (added & 0xffff);
  assert.equal(Number(state),half);
  if (i<16) golden.push({draw:i+1,state:Number(state),value:Number(state)/16777216});
}
const report = {
  status:'static_runtime_candidate_not_executed',
  source:relative,
  sha256:crypto.createHash('sha256').update(bytes).digest('hex'),
  code:{offset:228026,hex:code},
  data_segment_file_offset:291040,
  initial_seed:{ds:'0E16',offset:294646,hex:'00000500',value:0x50000},
  constants:[{ds:'1490',offset:296304,hex:'fd430300',use:'low halfword read twice as both multiply halves'},
    {ds:'1494',offset:296308,hex:'c39e2600',use:'low halfword plus low byte as high seed byte'},
    {ds:'1498',offset:296312,hex:'0000804b',use:'Single divisor 2^24'}],
  recurrence:'state = (state * 0xFD43FD + 0xC39EC3) & 0xFFFFFF; result = state / 16777216',
  halfword_vs_bigint_checks:10000,golden,
  limitations:['The runtime was not executed.', 'Randomize seed derivation is not ported.',
    'Shared music/ambient draws and original game call schedule are not reproduced.',
    'Campaign uses the controlled initial seed and persists its state as a new adapter.']
};
fs.writeFileSync(path.join(root,'research/fidelity-foundations/vb3-rng-static.json'),JSON.stringify(report,null,2)+'\n');
console.log('VB3 RNG static bytes verified; 10000 halfword/BigInt checks passed.');
