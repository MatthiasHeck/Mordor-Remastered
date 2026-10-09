# Original-source follow-up: transactions, recovery and timers

Reviewed October 9, 2026 for revision **1.3** of the [design document](../Mordor%20Remastered%20Design%20Document.md). This pass revisits `D:\Programming Projects\Mordor`, concentrating on paths left open in revision 1.2: Store, Holding and Confinement, Morgue, town recovery, dungeon waiting, ailments and combat dispatch.

The findings below are **static decompiler evidence**, not executed gameplay or certified authored source. Generated symbols, implicit VB conversions and damaged statements remain. The previous fingerprinted executable remains the baseline candidate; linkage of these routines to it is still F20. No game, installer, decompiler or supplied exporter was run. Original files remain read-only. Existing extracted tables are unchanged.

The [source manifest](original-followup/source-manifest.json) hashes each cited source and records exact anchor lines. The [preservation report](original-followup/source-preservation-check.json) compares every original file's path, size and SHA256 against the preceding immutable inventory. Reproduce with `original-followup-audit.py`; this is a provenance check, not a gameplay test.

## Findings and design impact

| ID | Finding | Design sections |
| --- | --- | --- |
| O01 | Charge bundles use eight explicit subtypes; resale stock is alignment-specific and capped in this path | 13.5 |
| O02 | Combining requires full identification, same definition and alignment; uncurse can separate without removing an inherent curse | 12.10; 13.5 |
| O03 | Sell quotes depend on stock, identification and charges; buy-price output contains a suspicious default index | 13.5; F12 |
| O04 | Store purchase scans indexes 1–39 despite documented forty-slot capacity | 12.5; F22 |
| O05 | Companion purchase/binding and companion raising have distinct limits and outcomes | 7.4; 14.5 |
| O06 | Hired rescue uses supplied coordinates, a depth fee, a survival roll and explicit recovery branches | 15.5 |
| O07 | Waiting for rescue samples elapsed days through a separate depth-dependent loop | 15.5 |
| O08 | Raising another character persists a pending offer; acceptance and resulting HP depend on method | 15.6; 21.3 |
| O09 | Raise failure can lead to costly recovery with complications; novice subsidy uses highest guild level | 15.6 |
| O10 | Town recovery computes individual age from missing HP and heals only living companions | 14.1; 15.7 |
| O11 | Separate combat/ailment callbacks share a minimized-window guard; combat initialization assigns 1,000 ms | 8.7; F09 |
| O12 | Ailment and old-age branches expose possible legacy defects requiring explicit decisions | 9.9; 15.7; F23 |

## Store transactions

[FRMCTYS.cmdSell_Click](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:217>) and [sub2621](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:612>) both select subtype codes **23, 24, 25, 26, 27, 28, 30, 31**. The [local subtype table](local-original/item-subtypes-local.csv) maps these to Potion, Scroll, Tome, Dust, Crystal, Rod, Sphere and Cube. These are subtypes, not the 24 broader equipment classes. Stone (29), Artifact (32) and Guild Crest (34) are not in this list.

For these eight subtypes when base charges B > 0, selling an instance with C charges follows this candidate transition:

| Charge state | Instance after sale | Eligible to add one store unit? |
| --- | --- | --- |
| C < B | Removed | No |
| C = B | Removed | Yes |
| C > B | Retained with C − B | Yes |

For other charged subtypes, or definitions with no positive base-charge count, the sale removes the instance and marks it eligible for stock. The quote is credited before these mutations. Stock eligibility is then filtered: first-level-zero/default-alignment goods do not add stock; intrinsically cursed definitions do not add stock; the selected alignment bucket increments only while below **9**. Therefore a sale can complete without increasing visible stock. [cmdBuy_Click](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:37>) creates purchased instances with the definition's base charges, providing the static path behind recharging through sale and repurchase. Runtime checks must cover whether the sold unit is actually stocked and available.

Combining prechecks every selected item's identification field for **zero**, meaning fully identified in this path, before processing donors. It requires at least two selections, an allowed subtype, the same definition index and alignment. The first selected instance is the destination; accepted donor charges are added and donor identity is cleared. Mismatched donors receive messages within the loop, so atomic implementation must preserve the actual accepted subset, rather than inventing all-or-nothing validation for all mismatches. The output has malformed `Else` indentation. Duplicate selections, signed 16-bit charge overflow and full-pack behavior require original tests; no maximum combined charge count is established here.

[cmdUncurse_Click](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:284>) rejects uncursed or unequipped instances, charges a fee, forces separation, sets identification to zero and updates knowledge. It clears the instance curse only when the **definition** is not intrinsically cursed. Separation is not necessarily permanent purification. [fn274F](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:763>) returns `(.8 × base price) / .5` through a Long result; retain the original conversion rather than assuming an arbitrary percentage service fee.

### Price recovery and remaining uncertainty

[fn273B](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:695>) uses base price V, selected-alignment stock S, identification field I, instance charges C and base charges B. If S is zero but another alignment has stock, S becomes one; S is capped at nine. For the eight bundle subtypes with B > 0, C is capped to B for quoting and the charge-penalty multiplier K is five; otherwise K is one. Ignoring preceding curse guards, the candidate computation is:

```text
T = VB_Long((0.9 × V / (S + 1.15)) / (I + 1))
quote = VB_Long(T − K × ln(abs(C − B) + 1) × (0.05 × T))
```

Fully identified intrinsically cursed goods return zero. An earlier guard can also zero V for an equipped intrinsically cursed item. The click handler independently blocks selling an equipped cursed instance. These distinctions belong in fixtures, not a universal “sale price is half value” rule. `VB_Long` denotes a conversion to reproduce, not a tested emulator. The logarithm intermediate is Single and base price Currency; intermediate precision and out-of-range behavior remain unverified.

[fn271B](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:564>) exposes an identification quote using `.23 × V`, selected-alignment stock capped at nine, and division by I. It must be traced with its eligibility caller; I=0 must not be fed blindly into this expression.

[fn272C](<D:/Programming Projects/Mordor/POOP/FRMCTYS.bas:583>) returns base price directly for first-level-zero definitions. Otherwise it uses stock minus one, a natural logarithm, and a charge adjustment referencing local `l0202`, which is declared but not assigned in the displayed function. Do not silently substitute the selected item index or approve this as a complete purchasing formula. F12 retains this precise blocker.

### Inventory boundary

The purchase handler's first-free search is `For ... = 1 To 40 - 1`, leaving index zero outside that search. This is evidence about **one acquisition path**, not proof that total capacity is 39. Determine whether index zero is reserved, occupied, usable by other acquisition paths, or a decompiler artifact. The current forty-slot statement comes from later help. F22 records the disagreement without changing the capacity specification prematurely.

## Companion services

[FRMCITYC.cmdBuy_Click](<D:/Programming Projects/Mordor/POOP/FRMCITYC.bas:96>) searches four companion slots (0–3), rejecting a full roster before payment. A purchase copies base HP into current/maximum HP, sets identification to zero, and assigns binding `min(10, 5 + monster first-level field)`. This is not a rule for charmed or voluntarily joining creatures.

[cmdBind_Click](<D:/Programming Projects/Mordor/POOP/FRMCITYC.bas:50>) increases binding by **4**, capped at **12**, and rejects an already-at-cap companion. [txtBind_KeyPress](<D:/Programming Projects/Mordor/POOP/FRMCITYC.bas:756>) rejects negative binding values with a message that voluntary companions cannot be bound. The sign is meaningful state, not a value to normalize away. [fn33B9](<D:/Programming Projects/Mordor/POOP/FRMCITYC.bas:602>) has a discontinuous price factor: when `abs(binding)+4 > 12`, it uses `12−abs(binding)`; otherwise it uses `abs(binding)+4`. Retain as a boundary-test lead; do not substitute a uniform price per gained point.

[FRMMORG.cmdCommand_Click](<D:/Programming Projects/Mordor/POOP/FRMMORG.bas:25>) treats companion raising separately. Its fee is assigned to a Long from `max HP × 1244.34 × monster first-level field` in [sub2BDB](<D:/Programming Projects/Mordor/POOP/FRMMORG.bas:254>). After payment, threshold Q is `min(98, 75 + monster CON)`. Failure occurs for `Int(Rnd × 100) > Q`; failure clears the companion identity, success restores maximum HP. The carrying reference is cleared. For a 0–99 integer draw, a threshold of 98 accepts 99 integer outcomes: never relabel the comparison as an exact 98% probability without preserving its domain. Exhaustive RNG distribution remains untested.

## Hired rescue and waiting

[FRMMORG.cmdCommand_Click](<D:/Programming Projects/Mordor/POOP/FRMMORG.bas:25>) requests the target and user-supplied X,Y,floor. It rejects missing components, nonpositive coordinates and floors outside 1–15. The shown path does not check X/Y upper bounds. Its quote is assigned to a Long from `372567.52 × ln(floor + 1) × floor`; payment precedes the search outcome.

Rescuers proceed only when `Rnd × 100 > 4 × supplied floor`. The target must be on that floor and satisfy both `abs(supplied X − actual X) < 8` and `abs(supplied Y − actual Y) < 8`. This is a rectangular, per-axis tolerance, not radial distance. A living target at **at most 20% maximum HP** is moved to town; a healthier living target is reported found but left in place. Rock is reported without retrieval. Other fatal states move to town/Morgue. Failed survival or inaccurate coordinates produce separate messages, with no refund in this handler.

The injured-target message says the rescuers healed the character, but this branch visibly updates location and roster metadata, not HP. Later town recovery may account for the healing. Preserve the distinction between message and state; F23 requires observing before/after-load HP rather than treating text as proof.

[FRMDUNM.cmdWait_Click](<D:/Programming Projects/Mordor/POOP/FRMDUNM.bas:140>) is a different rescue process. Starting with elapsed-day counter d=0 and floor F, each loop chooses denominator 10,000 while `d < 100 × ln(F)^2 + 21`, otherwise 1,000. Floor 1 with stored area ≤18 overrides it to 100. It increments d, sets threshold to `max(0.1, 16−F)`, adds another `16−F` when automap bit 23 is set, then succeeds if `Rnd × denominator <= threshold`. On success it moves the casualty to town, clears the area, adds d days through the age helper, and invokes death/recovery processing. This is a simulated-day loop, not a real-time wait or the paid search algorithm. Bit 23's meaning and counter-overflow behavior need verification; do not guess a named terrain bonus.

## Raising, pending state and complications

[Module6.fn13C0](<D:/Programming Projects/Mordor/POOP/Module6.bas:2736>) rejects an already-pending raise and quotes `2912.32 × (max HP / 1.5)` through a Long. The self-service path in [sub0930](<D:/Programming Projects/Mordor/POOP/Module6.bas:3032>) explicitly applies `Int` instead. The rounding difference must be checked at suitable HP values.

[fn13D7](<D:/Programming Projects/Mordor/POOP/Module6.bas:2752>) derives a threshold from natural CON and recovery method: `35 × (CON / 4.5) + 10 × max(1, method−19)`, stored as Integer and clamped to 10–98. Its saved-character path rejects an incompatible stoning spell and Morgue treatment of Rock; the Rock branch has further method restrictions and a 10 threshold. The Morgue's saved-target invocation passes method −1, while the no-pending self-service branch selects method 23. This produces different pre-clamp bonuses (10 versus 40); do not flatten the entry paths into one assumed chance formula.

Paying to raise another character calls [sub0A7C](<D:/Programming Projects/Mordor/POOP/Module6.bas:6044>), which writes location, pending threshold, initiator name and method into that character's record. It does **not** clear fatal condition or restore HP. Later [fn10A3](<D:/Programming Projects/Mordor/POOP/Module6.bas:5926>) requests acceptance and rolls `Int(Rnd × 100) > stored threshold` for failure. After successful recovery processing it sets fatal condition to zero and restores **1 HP for methods 20/21**, **maximum HP for 22/23**, with default 1 HP. The exact Rock path has additional special handling; this pass does not certify Rock resurrection. Preserve pending data across saves and the opportunity to accept; payment is not equivalent to immediate resurrection.

The self-service Morgue offers a subsidy only when the **highest guild level is ≤5** and carried plus banked funds are below the fee. [fn131D](<D:/Programming Projects/Mordor/POOP/Module6.bas:2639>) establishes the highest-level selection. A wealthy beginner still pays; switching to a low-level guild must not create eligibility.

Failure can call [fn11A1](<D:/Programming Projects/Mordor/POOP/Module6.bas:1655>). Its complications branch is entered if an integer 0–99 roll is below `(age days / 365) / (racial lifespan / 2) × 100`, **or** the character is Rock. It subtracts five from all six natural stats with racial-minimum floors, adds **5,475 days**, reduces maximum HP to `Int(max HP / 1.2)`, fills current HP to that reduced maximum, and rechecks equipped-item eligibility. It returns true, permitting the caller to finish recovery; failure is not always “remain dead.” The other branch adds 54 days, clears pending fields and returns the default false result. Exact save/party handling remains to be traced.

Ordinary recovery adds 54 days in these callers; stoning selects 84 days and loses one CON. Morgue method 23 also has a separate CON-loss check `Rnd × 100 < 50 − 2 × CON`. The immediate Morgue path floors CON at the racial minimum afterward; the pending path does not visibly contain the same final clamp. Complications and ordinary recovery can both add time in one call chain. Retain call order, do not total them into one generic resurrection penalty. Boundaries and differences are part of F10/F23.

## Town recovery and age

[FRMCTYM.Form_Load](<D:/Programming Projects/Mordor/POOP/FRMCTYM.bas:66>) loops over current party members, calls the age/healing helper, refills SP through the natural-stat capacity routine, and clears poison, disease and paralysis. It heals only companions with current HP >0, so a dead companion is not revived by town entry. It also updates a carried character's saved location and drops the carrying reference.

[Module6.sub0EAE](<D:/Programming Projects/Mordor/POOP/Module6.bas:322>) computes rest days when called with the rest flag and zero explicit days: `(100 − current HP / maximum HP × 100) / 3.25`, assigned to an Integer; it then fills HP and adds those days to age. Explicit-day calls instead add the provided duration. World-update helpers are called for party index zero in the rest path; this is not evidence that the world advances by the sum or maximum of all members' recovery times. Test party order, unequal injury, rounding, and full-HP/empty-SP entry before adopting an elapsed-world-time rule.

## Combat, ailments and pause boundaries

[Module3.sub0A49](<D:/Programming Projects/Mordor/POOP/Module3.bas:732>) assigns combat timer interval **1,000 ms** when in the dungeon, with its constant declared at [line 29](<D:/Programming Projects/Mordor/POOP/Module3.bas:29>). [FRMDUNM.Form_Load](<D:/Programming Projects/Mordor/POOP/FRMDUNM.bas:240>) calls it. [timCombat_Timer](<D:/Programming Projects/Mordor/POOP/FRMDUNM.bas:612>) invokes [Module7.sub155A](<D:/Programming Projects/Mordor/POOP/Module7.bas:492>), whose error label identifies combat-round initiation. The dispatcher contains actor/state guards; timer interval alone still does not prove effective attack cadence. Compare against the later-help two-second claim, including command-triggered calls and cooldowns.

[FRMMAIN.MDIForm_Resize](<D:/Programming Projects/Mordor/POOP/FRMMAIN.bas:198>) sets shared `M602F` when minimized and clears it in the maximized branch. Both the combat and [ailment timer](<D:/Programming Projects/Mordor/POOP/FRMDUNM.bas:391>) return while this flag is true and have independent reentrancy guards. Do not generalize this to every focus loss, ordinary resize or modal dialog. Normal-window restoration needs explicit testing.

The ailment callback attempts poison and disease recovery separately using effective CON. Poison's draw is `Int(Rnd × 200) + 2 × (effective CON−10) − 2 × poison severity`; greater than 185 clears poison, otherwise HP falls by two. Disease uses a greater-than-195 threshold and otherwise loses one HP, but its displayed expression also subtracts **poison severity**, not disease severity. This is a potential original defect or decompiler defect, not authorization to correct it silently. Separate RNG draws and the callback's surrounding identification/hazard processing matter. Do not infer ticks per second from the combat interval.

The same callback begins natural-death checks when `relative age percent >= 98`, using `Int(Rnd × 100) < 5 + ln(relative age percent−98)`. At exactly 98 the shown logarithm is undefined; the function has an error exit, not a displayed positive epsilon clamp. Recover original numeric behavior before approving a smooth replacement curve. F23 covers this boundary and the disease-severity discrepancy.

## Remaining verification

This pass narrows F09–F12 and F17, and adds F22 (inventory index zero) and F23 (suspicious branch behavior). It does not resolve combat damage, companion obedience/caster arbitration, complete shop pricing, natural death distribution, lossless save import, or decompiler-to-executable provenance. Section 23.8 supplies targeted runtime cases; none has been executed. Preserve suspected defects as test questions until the reference behavior is established and a change decision is recorded.
