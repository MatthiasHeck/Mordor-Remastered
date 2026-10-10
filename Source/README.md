# Mordor Remastered — Godot application

A runnable desktop **reference and exploration prototype** based on revision 1.3 of the design document. It includes the full extracted catalogue, a separate C# rules library, and a Godot .NET client. It is not the completed remaster or a claim of original-game parity.

## Run on this machine

Double-click **`Launch.cmd`** in this folder. The launcher builds the client and runs it with the portable Godot 4.6 .NET editor downloaded into the workspace's ignored `.tools` directory.

Alternatively, from PowerShell in this folder:

```powershell
.\Start.ps1
.\Start.ps1 -Editor
.\Start.ps1 -Test
.\Start.ps1 -SmokeTest -Headless
```

To open the project manually, import `project.godot` into **Godot 4.6 .NET**, build the C# project and press F5. The standard Godot editor cannot load this C# application.

On another machine, install a [.NET SDK 8 or later](https://dotnet.microsoft.com/download) and [Godot 4.6 .NET](https://godotengine.org/download/archive/4.6-stable/), then run:

```powershell
.\Start.ps1 -GodotPath 'C:\Tools\Godot\Godot_v4.6-stable_mono_win64_console.exe'
```

First-time restore requires access to NuGet. The game itself is offline. Godot's C# setup requirements are documented [here](https://docs.godotengine.org/en/4.6/tutorials/scripting/c_sharp/c_sharp_basics.html).

## Included

- Nine-race character creation with extracted stat limits, pools and alignment masks; names, sex, explicit unused-point confirmation, Nomad membership and documented starting resources.
- Roster, compatible parties of up to four, member selection and character sheets.
- Town hub, personal gold deposits/withdrawals, twelve guild eligibility views, inventory and knowledge-filtered library.
- First-person grid navigation over the original cell tables, shared walls, ordinary doors, reciprocal stairs, return to town, discovery maps and editable notes.
- All fifteen floors in the development atlas, plus searchable raw races, guilds, 105 spells, 366 items and 401 monster records. Duplicate embedded IDs and unknown fields are retained.
- Atomic whole-world saves with checksums, a previous-snapshot recovery copy, validation and rollback when a command cannot be saved.
- Keyboard controls and rebinding, scalable text, contrast setting, fullscreen, explicit pause, instant movement, persistent logs and newly drawn procedural town/corridor art.

## Begin

Choose **Create character**, allocate points (or explicitly accept unused points), then **Begin in Marlith**. The first recruit joins the party automatically. Use the roster to add more members. **Enter Dejenol** starts at the extracted first-floor entrance, 9 east / 11 north.

| Action | Default key |
| --- | --- |
| Forward / backward | W / S or Up / Down |
| Turn left / right | A / D or Left / Right |
| Sidestep left / right | Q / E |
| Open visible door ahead | O |
| Expand map / add note | M |
| Pause / resume | P |
| Help / fullscreen | F1 / F11 |
| Close dialog | Esc |

Use **Stairs up** on the entrance cell to return to town. Movement into terrain whose effects remain unresolved is rejected with an explanation. Secret doors look like walls. The full reference atlas is a separate development view and does not add map discoveries.

## Scope still open

Combat, encounters, loot, active spell effects, guild joining/training, quests, equipment transactions, shop prices, companions, recovery services, legacy saves, audio and full controller/accessibility validation remain unimplemented. The design explicitly prohibits filling unresolved formulas with invented rules. Affected services explain their status and do not consume resources. No M0–M6 fidelity exit gate has been certified.

Navigation orientation, shared-edge interpretation, reciprocal stair destinations, starting facing, door persistence, party behavior and the implemented static rules remain candidates for comparison against the reference executable. Names are currently capped at 24 Unicode characters as a prototype UI decision; historical length validation is still open. See [implementation and evidence](docs/IMPLEMENTATION.md).

## Saves

Normal saves: `%APPDATA%\MordorRemasteredPrototype\world.json` on Windows with a standard Godot environment. `world.json.bak` is the preceding valid snapshot. Corruption recovery preserves the damaged input in a `.corrupt-*` file. Incompatible rulesets fail visibly instead of being silently converted. Settings are separate in `settings.cfg`.

Smoke tests use **`Source/Artifacts/smoke/world.json`** and never open normal saves. No original Mordor data or save is modified. There is no offline clock and no save import/export to the original game.

## Project layout

| Path | Responsibility |
| --- | --- |
| `Core/` | Engine-independent catalogue, state, commands, geometry, knowledge and persistence |
| `Client/` | Godot UI, input, procedural presentation and integration smoke test |
| `Data/` | Byte-preserved reference CSVs, keep-import metadata and source/hash manifest |
| `Tests/` | Package-free executable regression suite |
| `Tools/Import-Reference.ps1` | Reproducible, read-only import from the existing research exports |
| `docs/IMPLEMENTATION.md` | Evidence map, decisions, implemented scope and remaining gates |
| `Artifacts/` | Ignored test saves, logs and graphical smoke-test captures |

Build outputs, package caches and the portable engine are ignored by Git. Reference CSVs are kept as raw files rather than imported as Godot translations.

A Windows Desktop export preset is included. Exporting additionally requires the matching Godot 4.6 .NET export templates; a standalone exported executable has not been validated. The tested launch path builds and runs the project with the editor executable.

The original game is by David Allen. This project does not bundle original executable code, artwork or audio, and does not establish redistribution permission for the original reference data.
