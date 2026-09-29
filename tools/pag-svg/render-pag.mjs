import { readFile, writeFile } from 'node:fs/promises';
import { instance } from '@viz-js/viz';

const [input, output] = process.argv.slice(2);
if (!input || !output || process.argv.length !== 4) {
  console.error('Usage: node render-pag.mjs INPUT.dot OUTPUT.svg');
  process.exit(2);
}
const viz = await instance();
const dot = await readFile(input, 'utf8');
await writeFile(output, viz.renderString(dot, { format: 'svg', engine: 'dot' }));
