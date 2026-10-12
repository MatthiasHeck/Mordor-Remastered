# Item price reference

[item-base-prices.csv](item-base-prices.csv) exports all 366 physical records from local `ORIGINAL_DATA/MDATA3.MDR`, retaining record index, embedded ID, name, base value, first-level, subtype, charge, alignment and curse inputs. Values match the preceding `items-local.csv` export. Record index is the extraction identity; item ID is retained as data.

The base price is the stored definition value. Store quotes also use current stock by alignment, instance identification, current and base charges, subtype and curse guards. The first-level-zero buy branch returns the base value directly; its exported candidate column is blank for all other definitions. A blank means that branch does not apply, not a zero price.

The [formula register](formulas.json) transcribes candidate buy, sell, identify and uncurse equations from the preserved [Store source](../code/source/FRMCTYS.bas). It marks original conversion boundaries and eligibility guards. These are static expressions requiring a VB-compatible implementation and original tests. Prices for changing stock and item state cannot be certified as one universal table.

The buy-price routine references `l0202`, declared but not assigned in the displayed function, while calculating its charge adjustment. Stock zero also reaches a logarithm-domain boundary if the caller allows it. Keep these questions visible. The sell routine has stock fallback/capping, identification divisors, eight-subtype charge penalties and curse exceptions. Uncurse pricing accompanies separation; an intrinsic curse can persist afterward. See the [earlier transaction review](../../original-followup-review.md) for the traced state changes and comparison fixtures.

The package does not treat a mutable saved Store inventory as original canonical stock. Production economy behavior still needs refresh/world-time, caller eligibility, numeric conversions and runtime quote comparison.
