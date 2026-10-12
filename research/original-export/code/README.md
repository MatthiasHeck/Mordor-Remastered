# Recovered code guide

The [file manifest](files.json) fingerprints 46 complete supplied text files, including `main.txt` declarations. [procedures.csv](procedures.csv) and [procedures.json](procedures.json) index 691 procedures by source filename, generated symbol, inclusive original line numbers and signature. The JSON includes text-matched generated-symbol references; these are search aids, not a resolved call graph. Original bytes and line breaks are retained in `source/`. Selected excerpts retain their exact source bytes without editorial headers.

The [selected-routine index](selected-routines.csv) contains 37 excerpts. Every excerpt needs the constants, global types, state, external calls and helper routines in the complete source set. A function's displayed signature may disagree with its callers; generated identifiers, malformed VB, implicit defaults and conversion behavior must be investigated before creating compiled replacement code.

## Combat entry points

| Reference | Static role or lead |
| --- | --- |
| [FRMDUNM.timCombat_Timer](combat/FRMDUNM--timCombat_Timer.bas) | Callback guards and combat dispatch |
| [Module3.sub0A49](combat/Module3--sub0A49.bas) | Initializes the dungeon combat timer to 1,000 ms |
| [Module7.sub155A](combat/Module7--sub155A.bas) | Processes party state, character actions, companion actions and encounter progression |
| [Module7.sub0A64](combat/Module7--sub0A64.bas) | Monster-round dispatch lead |
| [Module4.sub1019](combat/Module4--sub1019.bas) | Character attack/cast path; target, weapon, swing and special-hit branches |
| [Module4.sub0C8A](combat/Module4--sub0C8A.bas) | Companion attack path, including friendly-fire branches |
| [Module4.sub0E85](combat/Module4--sub0E85.bas) | Monster action path, breath/acid/cast branches |
| [Module4.sub0F01](combat/Module4--sub0F01.bas) | Treasure/chest outcome processing lead |
| [Module4.fn0DEE](combat/Module4--fn0DEE.bas) | Shared candidate hit/damage routine with logarithms, bounds, conversions and multiple RNG draws |
| [Module4.fn0E4A](combat/Module4--fn0E4A.bas), [fn0E5F](combat/Module4--fn0E5F.bas) | Additional effect/attack helpers; caller arguments and field meanings require tracing |
| [Module6.fn1173](combat/Module6--fn1173.bas) | Spell dispatcher, including healing, attacks, effects and target selection |

`fn0DEE` computes a comparison coefficient from its first two integer arguments, using 0.5 when both are zero, then clamps the percentage to 2–98. It uses separate random draws for base damage, an attack/defense correction, a 1–1000 branch and a final 1–100 hit check. The final comparison is `roll >= coefficient`, which returns zero damage. Consequently the clamped coefficient is not itself a certified percentage chance. The fourth argument is transformed through logarithms and `CInt`; a positive modifier above one is also transformed. Do not replace this with a single attack-minus-defense formula or collapse the draws. Names and complete argument semantics remain unverified.

The earlier [combat/timer review](../../original-followup-review.md) records the mismatch between the later-help two-second description and this one-second callback initialization. Dispatcher guards and command-triggered calls mean timer interval alone does not establish actual attack cadence. This export recovers code references; it does not certify combat parity.

## Store

The eight [Store excerpts](selected-routines.csv) cover purchase, sale, uncurse/separation, identification quote, buy quote, sell quote, uncurse quote and combining. Full source is in [FRMCTYS.bas](source/FRMCTYS.bas). Read the [price guide](../prices/README.md) before using the 366-item table. Instance identification and charges, definition charges, alignment stock and curse guards affect transaction quotes. Inventory index zero, overflow, an unassigned buy-price local and malformed combining branches remain explicit verification cases.

## Recovery

The nine recovery excerpts cover [Morgue commands](recovery/FRMMORG--cmdCommand_Click.bas), [companion raise quote](recovery/FRMMORG--sub2BDB.bas), [waiting rescue](recovery/FRMDUNM--cmdWait_Click.bas), [town entry](recovery/FRMCTYM--Form_Load.bas), [rest/age helper](recovery/Module6--sub0EAE.bas), [complications](recovery/Module6--fn11A1.bas), [pending raise acceptance](recovery/Module6--fn10A3.bas), [saved raise offer](recovery/Module6--sub0A7C.bas), and [highest-guild selection](recovery/Module6--fn131D.bas).

Preserve these distinct paths: hired search, simulated-day waiting, carried-body return, paid pending raise, self-service Morgue recovery, companion recovery and town healing. Payment may create a saved offer before the casualty accepts; it is not universally immediate resurrection. Failure can invoke complications, and more than one caller can add age. The [previous recovery review](../../original-followup-review.md) explains method-specific HP, subsidy, age and permanent losses, with original source anchors. It remains a static interpretation.

## Dungeon

Eight dungeon excerpts cover the square handler, chute traversal, ahead/square perception, command dispatch, teleportation validation, spell eligibility/Anti-Magic and the ailment/hazard callback. Read [special-square behavior notes](../dungeon/behavior-notes.md). The source [Module6.fn14CB](dungeon/Module6--fn14CB.bas) includes one contextual Take branch with stairs-up handling before stairs-down and then chutes. Remaster default **T** selects this action. The user-approved automatic ordinary-door crossing is a new input convenience with its own design acceptance cases.
