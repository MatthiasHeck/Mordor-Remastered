import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { marked } from 'file:///C:/Users/Matt/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/marked/lib/marked.esm.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const input = path.join(root, 'Mordor Remastered Design Document.md');
const output = path.join(root, 'Mordor Remastered Design Document.html');
const md = fs.readFileSync(input, 'utf8');
let html = await marked.parse(md, { gfm: true });
const toc = [];
html = html.replace(/<h2>(\d+\s+[^<]+)<\/h2>/g, (_, title) => {
  const number = title.match(/^\d+/)[0];
  toc.push(`<a href="#section-${number}">${title}</a>`);
  return `<h2 id="section-${number}">${title}</h2>`;
});
html = html.replace(/<table>/g, '<div class="table-wrap" tabindex="0"><table>').replace(/<\/table>/g,'</table></div>');
const page = `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Mordor Remastered Design Document</title>
<style>
:root{--ink:#242b2b;--muted:#52615e;--paper:#fcfbf7;--line:#d9dfd9;--accent:#20594c;--aside:#edf1ec}
*{box-sizing:border-box}html{scroll-behavior:smooth;scroll-padding-top:2rem}body{margin:0;background:var(--paper);color:var(--ink);font:17px/1.65 "Segoe UI",system-ui,sans-serif}
a{color:var(--accent);text-underline-offset:.18em;overflow-wrap:anywhere}a:hover{color:#103a30}a:focus-visible,button:focus-visible,.table-wrap:focus-visible{outline:3px solid #bb7626;outline-offset:3px}
aside{position:fixed;width:292px;inset:0 auto 0 0;padding:25px 24px;background:var(--aside);border-right:1px solid var(--line);overflow-y:auto;font-size:13px;line-height:1.4}
aside strong{display:block;color:var(--accent);font-size:18px;line-height:1.3;margin-bottom:8px}aside p{color:var(--muted);margin:0 0 16px}nav a{display:block;padding:6px 0;text-decoration:none}nav a:hover{text-decoration:underline}
main{margin-left:292px;padding:54px clamp(24px,5vw,84px) 80px;max-width:1430px}article{max-width:1010px;margin:auto}h1{font-family:Georgia,serif;font-weight:500;font-size:clamp(34px,3.5vw,52px);line-height:1.12;letter-spacing:-.025em;margin:0 0 22px;color:#173f36}
h2{font-size:28px;line-height:1.25;margin:55px 0 20px;color:#173f36;font-weight:650}h3{font-size:21px;line-height:1.35;margin:30px 0 12px;font-weight:650}p{margin:0 0 17px}li{margin:.4em 0}strong{font-weight:650}code{font-size:.9em;background:#edf0e9;padding:.1em .3em;border-radius:3px;overflow-wrap:anywhere}
.table-wrap{overflow-x:auto;border:1px solid var(--line);border-radius:4px;margin:22px 0 30px}table{border-collapse:collapse;min-width:100%;font-size:14px;line-height:1.45}th{background:#e3ebe3;color:#1d3c32;text-align:left;font-weight:650}td,th{padding:11px 13px;border-bottom:1px solid var(--line);vertical-align:top}tbody tr:nth-child(even){background:#f2f4ee}tr:last-child td{border-bottom:0}td{min-width:65px}td:first-child{font-weight:500}thead{display:table-header-group}
.tools{display:flex;gap:14px;align-items:center;border-bottom:1px solid var(--line);padding-bottom:18px;margin-bottom:35px;font-size:13px;color:var(--muted)}button{font:inherit;color:var(--accent);background:transparent;border:1px solid #abbcb0;border-radius:4px;padding:6px 12px;cursor:pointer}.skip{position:absolute;left:-9999px}.skip:focus{left:10px;top:10px;z-index:9;background:white;padding:10px}
@media(max-width:1000px){aside{position:relative;width:auto;max-height:270px;border-right:0;border-bottom:1px solid var(--line)}nav{columns:2}main{margin-left:0;padding:35px 22px}h2{font-size:25px}body{font-size:16px}}
@media(max-width:550px){nav{columns:1}aside{max-height:220px}.tools{flex-wrap:wrap}td,th{padding:9px}h1{font-size:35px}}
@media(prefers-reduced-motion:reduce){html{scroll-behavior:auto}}
@media print{aside,.tools,.skip{display:none}main{margin:0;max-width:none;padding:0}body{font:10pt/1.4 "Segoe UI",sans-serif;background:white;color:black}h1{font-size:26pt}h2{font-size:17pt;break-after:avoid;margin-top:25pt}h3{font-size:12pt;break-after:avoid}a{color:inherit;text-decoration:none}.table-wrap{overflow:visible;border-radius:0;break-inside:auto}table{font-size:8pt}tr{break-inside:avoid}td,th{padding:5pt}p{orphans:3;widows:3}@page{size:A4;margin:17mm}}
</style></head><body>
<a class="skip" href="#document">Skip to document</a>
<aside aria-label="Document contents"><strong>Mordor Remastered</strong><p>Design and preservation specification<br>Research edition · October 9, 2026</p><nav>${toc.join('\n')}</nav></aside>
<main id="document"><article><div class="tools"><span>27 sections · numerical appendices · linked evidence</span><button type="button" onclick="window.print()">Print</button><a href="Mordor%20Remastered%20Design%20Document.md">Markdown source</a></div>${html}</article></main>
</body></html>`;
fs.writeFileSync(output,page);
console.log(JSON.stringify({output,sections:toc.length,bytes:Buffer.byteLength(page)}));
