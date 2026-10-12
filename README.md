# Mordor Remastered — Godot migration

The native Godot 4.6 project is in **[Godot/](Godot/README.md)**. It includes character creation, town banking, guilds and logs, inventory equipment, and solo dungeon exploration with saved combat. Dungeon encounters now advance in one-second rounds: choose Attack, Defend, Wait, a target, or an available spell. Weapon/spell damage, monster special attacks, ailments, experience, quests, loose gold, and death update the campaign. Character records, original binary encounter records, and controlled VB RNG state save together and resume after reload. The separate **Combat preview** remains a supplied-draw research tool that works on copies.

Open `Godot/project.godot` in Godot 4.6 and press F6 on `ui/game.tscn`, or F5 to run the project. On Windows, `./Godot/Run.ps1` uses the cached Godot executable and keeps saves in `Godot/Saves`. Run `./Godot/Run.ps1 -Mode Test` for the automated checks.

**The full game and full combat are not migrated yet.** Companion/party combat, charm, charged-item casting, several spell effects, chests/items, recovery, encounter respawning, and original-executable comparison remain. Ambiguous encounter-generation branches and random dungeon hazards stop safely. Combat uses a static candidate recovered from the supplied VB runtime with a controlled seed; startup Randomize, music draws, and original timer ordering are not reproduced. The procedure register contains 37 candidate translations and 33 partial translations out of 691 recovered procedures. This count describes source coverage, not verified behavioral equivalence.

The earlier exploration prototype was removed at the user's request because it did not reproduce the original faithfully. This conversion uses the supplied installation at `../Mordor/_Original Game Files`, the recovered VB3 procedures at `../Mordor/POOP`, and the original UDT layouts. It does not restore that prototype. Recovered bytes, candidate source translations, and observed runtime behavior remain distinct. The research documents below retain their historical findings and original-runtime test plans.

- [Current findings and next actions](research/fidelity-foundations/README.md)
- [Recreation readiness and next steps](research/fidelity-foundations/recreation-readiness.md)
- [Complete work register](research/fidelity-foundations/work-items.csv)
- [Original-game comparison procedures](research/fidelity-foundations/runtime-cases.json)
- [R01-R16 action-item coverage](research/fidelity-foundations/action-item-coverage.csv)
- [Spell trace specification](research/fidelity-foundations/spell-trace-spec.json)
- [Creation and progression trace specification](research/fidelity-foundations/progression-trace-spec.json)
- [Encounter and loot trace specification](research/fidelity-foundations/encounter-trace-spec.json)
- [Item and equipment trace specification](research/fidelity-foundations/item-trace-spec.json)
- [Economy and world-time trace specification](research/fidelity-foundations/economy-time-trace-spec.json)
- [Party and companion trace specification](research/fidelity-foundations/party-companion-trace-spec.json)
- [Recovery and age trace specification](research/fidelity-foundations/recovery-age-trace-spec.json)
- [Dungeon trace specification](research/fidelity-foundations/dungeon-trace-spec.json)
- [Persistence trace specification](research/fidelity-foundations/persistence-trace-spec.json)
- [Presentation and audio trace specification](research/fidelity-foundations/presentation-audio-trace-spec.json)
- [Defect trace specification](research/fidelity-foundations/defect-trace-spec.json)
- [Research index](research/README.md)
- [Design and evidence specification](Mordor%20Remastered%20Design%20Document.md)

The sibling `D:\Programming Projects\Mordor` directory is a read-only evidence source. The migration copies its inputs into `Godot/`; it never writes saves into the original installation. Run `node Godot/tools/verify-original.mjs` to check the research inventory and imported files.
