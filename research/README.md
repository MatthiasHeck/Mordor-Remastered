# Mordor remaster research index

Research assembled October 8–9, 2026 for the original 1995 Mordor game. Read the main [design document](../Mordor%20Remastered%20Design%20Document.md) for the full specification and evidence policy.

## Fidelity restart — October 10, 2026

The previous Godot prototype has been removed at the user's request. The [foundation audit](fidelity-foundations/README.md) starts the outstanding work with executable/source correspondence, Reko byte checks, form timer candidates, original audio and recovered runtime dependencies. It preserves 87 audio files, identifies a missing `FIGHT.WAV` reference and potential music/gameplay RNG coupling, and prepares a disposable original-game comparison copy. See the [sixteen-area work register](fidelity-foundations/work-items.csv), the [complete action-item coverage matrix](fidelity-foundations/action-item-coverage.csv), and the [sixteen controlled runtime cases](fidelity-foundations/action-item-runtime-cases.json). Original runtime behavior remains untested; these are evidence and preparation results, not a new game implementation. The [recreation readiness plan](fidelity-foundations/recreation-readiness.md) defines the runtime gate and implementation order.

## Original graphics, code, prices and square export — revision 1.4

The October 10 [export package](original-export/README.md) provides 34 distinct original BMP assets and 90 monster tiles, all 366 item base prices plus candidate Store expressions, and 46 byte-preserved decompiler text files with 691 indexed procedures and 37 selected combat/Store/recovery/dungeon excerpts. Browse the [graphics gallery](original-export/graphics-gallery.html), [code guide](original-export/code/README.md), [price guide](original-export/prices/README.md) and [special-square reference](original-export/dungeon/behavior-notes.md).

The special-square catalogue contains 3,965 cells across fifteen floors, with all combined flags and source offsets retained. There are 86 active teleporter slots but 88 flagged cells: floor 8 (5,6) and (6,6) lack matching slots. All 17 active chutes match the flags. This discrepancy remains a runtime question. The design also records the user-approved automatic ordinary-door crossing and a single contextual **T** key for stairs, with separate remaster acceptance cases.

[export-original-assets.py](export-original-assets.py) reads original binaries without executing them and writes only into `original-export`. It preserves BMP bytes, checks PNG pixels, copies source bytes, compares preceding item/monster/cell tables and verifies all 1,273 original files against the immutable inventory. After rebuilding HTML with `build-preview.mjs`, run [check-original-export.py](check-original-export.py) for export and document checks. This new validator handles revision 1.4; the prior follow-up audit is specifically pinned to revision 1.3. Static decompiler expressions and field interpretations still require original-game verification.

## Original-source follow-up — revision 1.3

The [follow-up review](original-followup-review.md) traces Store transactions, companion services, hired and waiting rescue, pending raises, complications, town recovery and timer guards. It adds twelve finding groups (O01–O12), with source anchors and unresolved branches, and twelve planned original/remaster comparison families (V17–V28) in the design. It remains static decompiler interpretation, not runtime verification.

The [source manifest](original-followup/source-manifest.json) fingerprints cited files and anchor lines. The [preservation report](original-followup/source-preservation-check.json) checks the complete original tree against the preceding immutable inventory. The [document validation](original-followup/document-validation.json) checks local links, tables, section/case counts and HTML headings. After document edits, rebuild HTML with `build-preview.mjs`, then run `original-followup-audit.py` to reproduce the reports. The audit only reads original files and writes its reports under `research/original-followup`; it neither executes original code nor regenerates the numerical tables.

New discrepancies include a 1,000 ms combat timer versus the documented two-second round, Store purchase skipping item index zero, a disease check reading poison severity, and the natural-age check's exact-98% logarithm boundary. These remain explicit tests and decision points, not silently repaired rules.

## Original-file review — revision 1.2

The [local original-file review](local-original-review.md) documents inspection of the user-supplied `D:\Programming Projects\Mordor` tree, which is read-only. New output is confined to this remaster project. The review separates directly extracted values, static decompiler interpretations and still-required runtime checks.

The [local-original directory](local-original/extraction-summary.json) contains 9 races, 12 guilds, 105 spell records (103 distinct embedded IDs), 366 items, 401 monster records, and all fifteen 30×30 floors. It also includes raw taxonomy tables, 205 derived guild/spell relations, item/spell links, help and public-data comparisons, and source manifests. The [spell reference](local-original/spell-reference.md) is readable without opening CSV files. The earlier tables below remain unmodified source transcriptions.

The supplied decompiler output supports creation pools, SP and stat adjustments, random HP advancement with a 999 cap, active-guild healing with an explicit-level override, carried-gold-first payment and conditional quest assignment. These findings are source interpretations, not executed original-game tests. The [whole-tree preservation check](local-original/source-preservation-check.json) compares source paths, sizes and hashes before/after review.

`local-original-audit.py` reads source files and writes only to this research directory. Use `--snapshot` once before inspection, ordinary invocation for exports, and `--verify` afterward. It does not run source executables, import the supplied exporters or copy mutable character saves into the design datasets.

## Reference datasets

| Files | Contents | Evidence status |
| --- | --- | --- |
| `race-statistics.csv`, `race-resistances.csv`, `race-guild-eligibility.csv` | Nine races and their printed numerical restrictions | Original PlayGuide; visually checked |
| `guild-statistics.csv`, `guild-abilities.csv` | Twelve guilds, entry requirements, growth and abilities | Original PlayGuide; visually checked |
| `spell-statistics-updated-help.csv` | 100 extracted spell-category records | Later official M1/legacy help; original-build equivalence unverified |
| `spell-guild-levels-updated-help.csv` | 205 spellbook assignments | Same later help; literal naming discrepancies retained |
| `monster-candidate-shareware.csv` | 401 physical records and 64 fields | Matching public shareware archives; anomalies unresolved |
| `item-candidate-shareware.csv` | 366 records and 41 fields | Same archives; field semantics need validation |
| `monster-reference.md`, `item-reference.md` | Readable subsets of the full numeric CSV tables | Same candidate status |
| `bestiary-provenance.json` | SHA256 fingerprints, distribution comparison and limitations | Reproducible input evidence |

## Interpretation

Printed numbers are not proof of runtime formulas. Later official help is not automatically identical to shipped 1995 help. A successful binary parse is not proof that a field has the intended meaning. Two matching archived packages establish identical bytes, not registered-retail parity.

Do not use the candidate tables as production defaults until the selected original build has been compared. In particular, do not correct GOBLIE, remove duplicate ID 307, assume monster IDs equal record positions, or interpret the stored first-level field as a verified spawn rule. Do not treat absent spell costs or power values as zero.

## Notes and reproduction

The [second-pass review](second-pass-review.md) documents version 1.1, including revision-pinned research into the user-supplied remake. See the [source manifest](second-pass-sources.json), [structural data audit](second-pass-data-audit.json), and [technical appendix](second-pass-appendix.md). Original runtime verification remains outstanding; the new comparison scenarios are specifications, not executed tests.

Read [character rules](character-rules.md), [world rules](world-rules.md), and [bestiary research](bestiary-data.md). The scripts are research tools, not game implementation:

- `character-extract.py` extracts numeric spell fields from the downloaded official help HTML using the Python standard library.
- `bestiary-extract.py` parses the publicly archived `MORDOR11.ZIP` in memory and writes candidate CSVs. Its initial provenance is conservative; `finish-document.py` adds the independent archive comparison.
- `finish-document.py` builds the document appendices and readable bestiary/item references. It expects the independent archive in the research session's temporary folder.
- `build-preview.mjs` generates the standalone HTML reading edition of the document from Markdown.
- `second-pass-audit.py` checks table structure and writes the source manifest and technical appendix using previously downloaded, revision-pinned help pages in temporary storage. It does not change the numerical CSVs.

The original PDFs, extracted help, and page images are research inputs and internal verification materials. They are not proposed redistributable game assets. No original game or installer was executed. Production rights and a full registered reference build remain separate requirements.
