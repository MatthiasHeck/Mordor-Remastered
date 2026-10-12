import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { chromium } = require('C:/Users/Matt/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/playwright');
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const out = path.join(root, 'research', 'original-export');
const browser = await chromium.launch({ headless: true, executablePath: 'C:/Program Files/Google/Chrome/Application/chrome.exe' });
const page = await browser.newPage({ viewport: { width: 1440, height: 1000 } });
const errors = [];
page.on('pageerror', e => errors.push(String(e)));
const checks = {};

try {
  await page.goto(pathToFileURL(path.join(root, 'Mordor Remastered Design Document.html')).href);
  await page.getByRole('heading', { name: '10.7 Automatic doors and contextual stairs', exact: true }).scrollIntoViewIfNeeded();
  await page.screenshot({ path: path.join(out, 'design-controls-preview.png') });
  checks.designDesktop = await page.evaluate(() => ({
    sections: document.querySelectorAll('h2[id]').length,
    horizontalOverflow: document.documentElement.scrollWidth > innerWidth,
    version: document.body.innerText.includes('Document version: 1.4')
  }));
  await page.setViewportSize({ width: 540, height: 900 });
  await page.getByRole('heading', { name: '10.7 Automatic doors and contextual stairs', exact: true }).scrollIntoViewIfNeeded();
  checks.designNarrow = await page.evaluate(() => ({ horizontalOverflow: document.documentElement.scrollWidth > innerWidth }));
  await page.setViewportSize({ width: 1440, height: 1000 });
  await page.goto(pathToFileURL(path.join(out, 'graphics-gallery.html')).href);
  await page.evaluate(async () => {
    await Promise.all([...document.images].map(async img => { img.loading = 'eager'; await img.decode(); }));
  });
  checks.galleryDesktop = await page.evaluate(() => ({
    images: document.images.length,
    broken: [...document.images].filter(img => !img.complete || !img.naturalWidth).map(img => img.src),
    horizontalOverflow: document.documentElement.scrollWidth > innerWidth
  }));
  await page.screenshot({ path: path.join(out, 'graphics-gallery-preview.png') });
  await page.setViewportSize({ width: 540, height: 900 });
  checks.galleryNarrow = await page.evaluate(() => ({ horizontalOverflow: document.documentElement.scrollWidth > innerWidth }));
} finally {
  await browser.close();
}

const report = { revision: '1.4', checks, pageErrors: errors, runtimeGameTestsExecuted: false };
fs.writeFileSync(path.join(out, 'preview-validation.json'), JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify(report, null, 2));
if (errors.length || !checks.designDesktop.version || checks.designDesktop.sections !== 27 ||
    checks.galleryDesktop.images !== 34 || checks.galleryDesktop.broken.length ||
    Object.values(checks).some(c => c.horizontalOverflow)) process.exitCode = 1;
