# Bestiary and item data research

**October 9 update:** the [original-file review](local-original-review.md) compares the supplied local files with the public data below. MDATA3 item bytes match exactly. The sole compared monster-field difference is Dark Shape record 266, item_1: local 33 versus public 34. Local spell data resolves the Crest of Thief's ID-zero reference to Charm of Opening. Earlier candidate CSVs remain unchanged; local exports and taxonomy tables are separate.

## Inputs and result

Two public distributions were read without executing their original software:

1. The [MORDOR11.ZIP fixture](https://github.com/matteo-prosperi/DungeonsOfDejremake/tree/main/tests/fixtures) mirrored by a contemporary project.
2. The [Internet Archive Mordor 1.1 package](https://archive.org/details/MordorTheDepthsofDejenol_1020), independently hosted and catalogued as a 1995 release.

Both downloaded archives are 2,555,532 bytes and have identical SHA256 fingerprints. Their `MORDOR.WIP` file is a ZIP payload. `MDATA5.MDR` and `MDATA3.MDR` contain monster and item records respectively. Full fingerprints and limitations are in [bestiary-provenance.json](bestiary-provenance.json).

The research parser exported 401 physical monster records with 64 columns and 366 item records with 41 columns. The monster export includes 400 unique embedded IDs. Parsed factual data is available in [monster-candidate-shareware.csv](monster-candidate-shareware.csv) and [item-candidate-shareware.csv](item-candidate-shareware.csv). Compact reading tables are [monster-reference.md](monster-reference.md) and [item-reference.md](item-reference.md).

## Interpretation and anomalies

This is corroborated **public shareware data**, not an approved registered-game catalogue. Identical copies can share an earlier common source. The header says 1.1, but a header alone does not establish pristine retail provenance.

- Physical record 1 contains the name `GOBLIE` exactly. Do not silently rename it to Goblin.
- Embedded monster ID 307 appears for both Morgul and Shadow Ninja. Record index and ID must remain separate.
- Some records use first-level parameters above the documented fifteen-floor dungeon. Preserve them without inventing an additional floor or deleting the records.
- Monster HP is exported as an average-hits parameter; the actual runtime distribution remains unverified.
- Some item fields are ambiguous in the community format research. In particular, the charges/deleted area is retained as two candidate 16-bit fields and as one raw 32-bit value.

These anomalies do not by themselves prove corruption or an error in the original game. They are evidence to resolve against a known registered distribution and its behavior.

## Parser basis

[libDejenol](https://github.com/JKaniarz/libDejenol) is community-authored technical research into original data files. Its `MTypes.h`, `MLoader.cpp`, and `RecordReader.h` informed the independently written Python reader. It describes 160-byte monster and 125-byte item record slots with length-prefixed strings and little-endian numeric fields. Some structures are explicitly work in progress.

The export preserves raw masks and uninterpreted fields instead of guessing flag meanings. Structural checks verify printable names, record boundaries, and unique item IDs. Duplicate monster IDs are reported and preserved, not repaired. Data extraction does not validate combat, drop, encounter, pricing, or control formulas.

## Other acquisition attempts

The [official product page](https://www.decklinsdemise.com/mordor.htm) links a modern installer for the original demo. It was downloaded and inspected as an archive without being run. Its installer payload was not recovered with the available archive reader. Historical official disk ZIP links returned not-found responses. A separate historical CD mirror timed out. These attempts did not produce additional approved data.

## Production gate

Obtain and fingerprint the selected registered 1.1 build, compare every byte and logical field, validate all references, enumerate accessible and special records, and check representative monster/item behavior in the original executable. Preserve unknowns until resolved. These candidate CSVs must not become production data merely because they parse successfully.
