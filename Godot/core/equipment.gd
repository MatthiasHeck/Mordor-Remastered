extends RefCounted
## Town equipment candidates from Module6. Caller commits the returned character.
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Numeric = preload("res://core/vb_numeric.gd")
var catalog
var error = ""

func _init(data): catalog = data

func item_class(item: Dictionary) -> int:
	if item.M5709 < 0 or item.M5709 >= catalog.tables.item_subtypes.size():
		error = "Invalid item subtype."
		return -1
	var kind = catalog.tables.item_subtypes[item.M5709].raw.M54D5
	if kind < 0 or kind >= catalog.tables.item_classes.size():
		error = "Invalid item class."
		return -1
	return kind

# Module6.fn12EF. Identification controls names; don't reveal hidden properties.
func item_name(held: Dictionary) -> String:
	var id = held.M4ED4
	if id < 0 or id >= catalog.tables.items.size(): return "Invalid item"
	var item = catalog.tables.items[id].raw
	if id == 0: return item.M548B
	match held.M4EEE:
		0:
			var name = String(item.M548B)
			if held.M4EBF > 0 and held.M4EBF <= 3: name += " " + ["(u)","(g)","(n)","(e)"][held.M4EBF]
			if held.M56DB > 0 or (item.M56DB > 0 and held.M56DB == 0): name += " [%d]" % held.M56DB
			if item.M572A != 0: name += " (cursed)"
			return name
		1: return item.M548B
		2: return catalog.tables.item_subtypes[item.M5709].name if item_class(item) >= 0 else "Invalid item"
		3:
			var kind = item_class(item)
			return catalog.tables.item_classes[kind].name if kind >= 0 else "Invalid item"
	return "Unidentified Item"

# Module6.sub11B9: only matching/unaligned equipped items grant flags and resists.
func refresh_item_effects(c: Dictionary) -> bool:
	c.M5977 = 0
	for index in 11: c.M5985[index] = 0
	for slot in 40:
		var held = c.M5857[slot]
		if held.M577E != 1: continue
		if held.M4ED4 < 0 or held.M4ED4 >= catalog.tables.items.size():
			error = "Invalid equipped item definition."
			return false
		if held.M4EBF != 0 and held.M4EBF - 1 != c.M4EBF: continue
		var item = catalog.tables.items[held.M4ED4].raw
		if item.M55BE > 0:
			for bit in 6:
				if Rules.has_flag(bit,item.M55BE): c.M5977 |= 1 << bit
		if item.M5548 > 0:
			for bit in 11:
				if Rules.has_flag(bit,item.M5548): c.M5985[bit] = 90
	return true

# Module6.sub13F1 and sub0894, in town (fn0EEF is then zero, no room refresh).
func refresh_effects(c: Dictionary):
	for effect in [3,4,6,5]: c.M56B9[effect] = 0
	for index in 11: c.M5548[index] = catalog.tables.races[c.M5821].raw.M5548[index]
	for bit in 6:
		if Rules.has_flag(bit,c.M5977) or Rules.has_flag(bit,c.M591F):
			match bit:
				0: c.M56B9[3] = -1
				1: c.M56B9[4] = -1
				2: c.M56B9[6] = int(floor(c.M5584[c.M58BB].M4E82 / 2.0)) + 1
				3: c.M56B9[5] = -1
	for index in 11:
		# Original equipment resistance overrides the racial value, not max(race,90).
		if c.M5985[index] > 0: c.M5548[index] = c.M5985[index]
		if c.M592F[index] > c.M5548[index]: c.M5548[index] = c.M592F[index]
	for effect in [3,4,6,5]:
		if Rules.has_flag(effect,c.M591F):
			c.M56B9[effect] = int(floor(c.M5584[c.M58BB].M4E82 / 2.0)) + 1 if effect == 6 else -1

# Module6.sub0F74: complete town stat/item mutation; display callbacks replaced.
# Failed operations are atomic, including the original early intrinsic-curse
# assignment before a failed minimum-stat check. This differs from that failure.
func toggle(character: Dictionary, slot: int, eligibility: Callable, force: bool = false) -> Dictionary:
	error = ""
	if slot < 0:
		slot = absi(slot)
		force = true
	if slot < 0 or slot >= 40 or character.M5470 != 0:
		error = "Choose an inventory slot in town."
		return {}
	var c = character.duplicate(true)
	var held = c.M5857[slot]
	if held.M4ED4 < 0 or held.M4ED4 >= catalog.tables.items.size() or (slot > 0 and held.M4ED4 == 0):
		error = "No valid item in this slot."
		return {}
	var item = catalog.tables.items[held.M4ED4].raw
	var kind = item_class(item)
	if kind < 0: return {}
	if catalog.tables.item_classes[kind].raw.M54F1 == 0:
		error = "This item cannot be equipped."
		return {}
	var removing = held.M577E == 1
	if held.M577E not in [0,1]:
		error = "Unsupported equipment state."
		return {}
	if removing and held.M572A != 0 and not force:
		error = "Cannot unequip a cursed item."
		return {}
	var alignment = 0 # same/unaligned, adjacent, opposite
	if held.M4EBF > 0 and held.M4EBF - 1 != c.M4EBF:
		alignment = 1 if absi(c.M4EBF - (held.M4EBF - 1)) == 1 else 2
	var modifiers = []
	for index in 6:
		var bonus = int(item.M571E[index])
		modifiers.append(-bonus if alignment == 2 else int(floor(bonus / 2.0)) if alignment == 1 else bonus)
	if not removing:
		if not eligibility.call(c,item,false):
			error = "Guild, level, natural stats, free hands, or item limits prevent equipping this item."
			return {}
		for index in 6:
			if c.M55B5[index] + c.M584B[index] + modifiers[index] < catalog.tables.races[c.M5821].raw.M5530[index]:
				error = "Equipping this item would reduce a statistic below its racial minimum."
				return {}
		if item.M572A != 0: held.M572A = item.M572A
		if alignment == 2: held.M572A = 1
	elif held.M572A != 0: held.M572A = 0
	var numeric = Numeric.new()
	var direction = -1 if removing else 1
	for field in ["M4E97","M4EA1"]:
		var amount = numeric.integer(-item[field] if alignment == 2 else floor(item[field]) / 2.0 if alignment == 1 else item[field])
		c[field] = Numeric.single(c[field] + direction * amount)
	held.M577E = 0 if removing else 1
	if not refresh_item_effects(c): return {}
	refresh_effects(c)
	c.M5700 = numeric.integer(c.M5700 + direction * item.M5700)
	c.M586D[kind] = numeric.integer(c.M586D[kind] + direction)
	if kind == 0:
		if removing:
			if c.M5997[0] == held.M4ED4: c.M5997[0] = -1
			else: c.M5997[1] = -1
		else:
			if c.M5997[0] < 0: c.M5997[0] = held.M4ED4
			else: c.M5997[1] = held.M4ED4
	var stat_error = Town.stat_ad(c,true)
	for index in 6: c.M584B[index] = numeric.integer(c.M584B[index] + direction * modifiers[index])
	stat_error += Town.stat_ad(c,false)
	if not numeric.error.is_empty() or not stat_error.is_empty():
		error = numeric.error + stat_error
		return {}
	return c
