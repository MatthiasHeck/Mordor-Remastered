# Original Mordor export

Exported October 10, 2026 from the supplied `D:\Programming Projects\Mordor` full-dungeon installation and decompiler files. This package supports design revision **1.4**. Start with the [graphics gallery](graphics-gallery.html), [summary](summary.json), and [source manifest](source-manifest.json).

| Export | Coverage | Read first |
| --- | --- | --- |
| Original graphics | 34 distinct BMPs from 78 occurrences, ten graphics-library sheets, reconstructed application icon, 90 monster grid tiles | [Gallery](graphics-gallery.html), [asset manifest](graphics/manifest.json), [contact sheet](graphics/contact-sheet.png) |
| Combat, Store and recovery code | 46 byte-preserved text files, 691 indexed procedures, 37 selected routine excerpts | [Code guide](code/README.md), [routine index](code/procedures.csv), [selected routines](code/selected-routines.csv) |
| Item prices | 366 physical item records, base values, charge/alignment/curse inputs, literal quote formulas | [Price guide](prices/README.md), [base-price table](prices/item-base-prices.csv), [formula register](prices/formulas.json) |
| Special dungeon squares | All 13,500 cells; 3,965 with special features excluding edge flags and solid rock; 2,328 stored door-edge flags | [Behavior notes](dungeon/behavior-notes.md), [special squares](dungeon/special-squares.csv), [all cells](dungeon/all-cells.csv) |
| Dungeon transitions | 240 allocated teleporter slots with 86 active entries; 150 chute slots with 17 active entries | [Teleporters](dungeon/teleporters.csv), [chutes](dungeon/chutes.csv), [cross-check](dungeon/transition-checks.json) |

These are research exports. File facts, static interpretations and runtime verification remain distinct. The graphics and numeric data were read from the local binaries; code was copied from supplied decompiler output with generated names and damaged statements preserved. The decompiler text has not been certified as authored source or linked to executable addresses. No original program was executed. The code excerpts are references requiring their surrounding constants, structures and helpers, all retained in [code/source](code/files.json).

## Graphics fidelity and coverage

`graphics/bitmaps/` contains exact embedded BMP byte sequences, including their original palettes. `graphics/png/` contains decoded RGB equivalents; the exporter checks pixel equality. PNG copies have no invented transparency. White or grey mask/background pixels remain intact because the original compositing behavior needs separate interpretation. The [occurrence table](graphics/occurrences.csv) records every source location, with offsets in bytes from the beginning of the source file. Identical images embedded in the EXE and forms are deduplicated by SHA256; all aliases remain in the manifest.

The ten named `MG11.DLL` resources are `MAZE`, `MONS`, `MISC`, `DOOR`, `WATR`, `QSND`, `FOG`, `BLNK`, `PICS`, and `ASMO`. The EXE contributes town art, title/credits images, controls and an icon. Supplied binary `.FRM` files independently contain the same BMP art. The export scans the EXE and DLL resource payloads and cross-checks every structurally valid embedded BMP in those two files. It also scans all supplied `POOP/*.FRM` files. The shipped HLP, installer-only material, third-party tools, runtime-generated primitives and masked/composited frames are outside this graphics-completeness claim.

The 600×540 `MONS` sheet is sliced into ninety 60×60 tiles using the coordinates in `FRMLIBRA.bas:93`. [Monster mappings](graphics/monster-picture-map.csv) retain all 401 physical monster records and their raw picture IDs. A separate `fn0C3B` branch draws the 100×100 `ASMO` resource; a grid tile association alone does not prove a monster always uses that tile. Tiles are identified by picture ID rather than an assumed unique monster name.

BMP extraction checks file headers, length, pixel offset, decoder success and resource bounds. See Microsoft's [bitmap storage specification](https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage) for the header/palette layout. [NE resource metadata](graphics/ne-resources.json) retains the final EXE resource's 256-byte allocation with only 17 bytes physically present; the missing 239 bytes are alignment padding and are not fabricated into an asset.

## Reproduce and verify

Run the project-authored exporter with a Python environment containing Pillow:

```powershell
python research/export-original-assets.py
```

It defaults to the sibling `Mordor` folder and accepts `--source PATH`. It writes only into `research/original-export`, never loads the original DLL, and never runs the game, installer, decompiler or supplied exporter. No mutable character, Store stock or automap save is exported as canonical game content. The preceding source inventory must exist at `research/local-original/source-inventory.json`; the final [preservation report](source-preservation-check.json) compares every original file with that immutable baseline.

The item, monster and cell values are also compared with the preceding local exports. The new transition cross-check deliberately records two floor-8 teleporter flags without matching slots, at `(5,6)` and `(6,6)`. It does not invent destinations or drop those cells. Original runtime comparison remains required for pricing, combat, recovery, terrain precedence, and the damaged decompiler branches.

Run `research/check-original-export.py` after editing documentation and rebuilding the main HTML preview. It checks byte copies and source slices, pixel equality, indexes, local links, expected counts, design requirements and the rebuilt HTML. These are extraction and documentation checks, not game parity tests.

Run `node research/check-export-preview.mjs` for headless desktop/narrow rendering checks. The [preview report](preview-validation.json) records image loading, layout overflow and script errors; [design controls](design-controls-preview.png) and [gallery](graphics-gallery-preview.png) screenshots provide visual inspection. Git attributes disable text normalization for original code copies and excerpts so their fingerprints survive checkout on another platform.

Original art and code remain research materials; this export does not establish distribution permission for a production remaster.
