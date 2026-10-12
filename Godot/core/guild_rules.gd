extends RefCounted
## Recovered guild rules. Names and assignment boundaries follow the VB source.
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Numeric = preload("res://core/vb_numeric.gd")
const Money = preload("res://core/currency.gd")
const Equipment = preload("res://core/equipment.gd")
var catalog
var error = ""
var titles: Dictionary

func _init(data):
	catalog = data
	titles = JSON.parse_string(FileAccess.get_file_as_string("res://data/guild-titles.json"))

# Module6.fn126E: literal title tiers extracted from its nested Select Case.
func title(character: Dictionary) -> String:
	var level = character.M5584[character.M58BB].M4E82
	for tier in titles.get(str(character.M58BB),[]):
		if tier.below == null or level < tier.below: return tier.title
	return ""

# Module1.fn030F; Integer assignment occurs before minimum clamp.
func equipment_level(item: Dictionary, guild: Dictionary) -> int:
	var numeric = Numeric.new()
	var factor = Numeric.single(guild.M560D)
	var result = numeric.integer((factor + factor * 2.97) * item.M560D)
	if not numeric.error.is_empty(): error = numeric.error
	return maxi(result,1)

# Module6.fn110D with p02A6=1, as called by fn1139 after joining a guild.
# Hands/item-class limits apply only when newly equipping, and are not run here.
func can_keep_equipped(c: Dictionary, item: Dictionary) -> bool:
	return can_use_item(c,item,true)

func can_use_item(c: Dictionary, item: Dictionary, rechecking: bool = false) -> bool:
	error = ""
	var equipment = Equipment.new(catalog)
	var kind = equipment.item_class(item)
	if kind < 0:
		error = equipment.error
		return false
	if not rechecking:
		if c.M5700 + item.M5700 > 2: return false
		var limit = catalog.tables.item_classes[kind].raw.M54F1
		if limit > 0 and c.M586D[kind] == limit: return false
	var guilds = catalog.tables.guilds
	var allowed = false
	if item.M5742 == 0:
		for index in guilds.size():
			if Rules.has_flag(index,item.M56E6) and c.M5584[index].M4E82 > 0: allowed = true
	else:
		allowed = Rules.has_flag(c.M58BB,item.M56E6)
	if not allowed: return false
	allowed = false
	# VB True is -1: preserve the recovered equality, including unusual value 1.
	if item.M5742 == -1:
		allowed = c.M5584[c.M58BB].M4E82 >= equipment_level(item,guilds[c.M58BB].raw)
	else:
		for index in guilds.size():
			if Rules.has_flag(index,item.M56E6) and c.M5584[index].M4E82 > 0 and c.M5584[index].M4E82 >= equipment_level(item,guilds[index].raw): allowed = true
	for stat in 6:
		if c.M55B5[stat] < item.M5712[stat]: return false
	return allowed and error.is_empty()

# FRMCTYG.sub2962 + cmdJoin_Click. Existing members need not repeat stat checks.
func join_quote(c: Dictionary, target: int) -> Dictionary:
	error = ""
	var result = {"allowed":false,"reason":"","fee":0,"fee_raw":0,"must_pay":false,"new_member":false,"low_level_warning":false,"unequipped":[]}
	if target < 0 or target >= catalog.tables.guilds.size():
		result.reason = "Unknown guild."
		return result
	if target == c.M58BB:
		result.reason = "This is your active guild."
		return result
	var guild = catalog.tables.guilds[target].raw
	if not Rules.guild_allows(guild,c):
		result.reason = "This guild does not accept your race or alignment."
		return result
	result.new_member = c.M5584[target].M4E82 == 0
	if result.new_member:
		for stat in 6:
			if c.M55B5[stat] < guild.M55B5[stat]:
				result.reason = "Your natural statistics do not meet this guild's requirements."
				return result
		result.low_level_warning = Rules.highest_guild_level(c,catalog.tables.guilds.size()) < 10
		var other_memberships = 0
		for index in catalog.tables.guilds.size():
			if index != c.M58BB and c.M5584[index].M4E82 > 0: other_memberships += 1
		if other_memberships > 0:
			result.must_pay = true
			var town = Town.new()
			var fee = 0.0
			for index in 6:
				if guild.M55BE[index] > 0: fee = town.currency_assignment(fee + (guild.M55BE[index] + 1.0) * 1.25)
			for category in 18:
				# VB first dimension varies fastest: [category,1] = category + 19.
				if guild.M55F6[category + 19] > 0: fee = town.currency_assignment(fee + guild.M55F6[category + 19] / 3.0)
			fee = town.currency_assignment(fee * (fee * 5356.0))
			var numeric = Numeric.new()
			result.fee = numeric.long_integer(fee)
			result.fee_raw = Numeric.round_even(fee * 10000.0)
			if not town.error.is_empty() or not numeric.error.is_empty():
				result.reason = "Guild fee overflow."
				return result
	for slot in 40:
		if c.M5857[slot].M572A != 0 and c.M5857[slot].M577E == 1:
			result.reason = "Your aura is tainted by an equipped cursed item."
			return result
	var candidate = c.duplicate(true)
	candidate.M58BB = target
	if result.new_member: candidate.M5584[target].M4E82 = 1
	for slot in range(1,40): # fn1139 intentionally skips reserved slot zero.
		var held = candidate.M5857[slot]
		if held.M577E != 1: continue
		if held.M4ED4 < 0 or held.M4ED4 >= catalog.tables.items.size():
			result.reason = "An equipped item has an invalid definition."
			return result
		if not can_keep_equipped(candidate,catalog.tables.items[held.M4ED4].raw):
			if not error.is_empty():
				result.reason = error
				return result
			var equipment = Equipment.new(catalog)
			var updated = equipment.toggle(candidate,slot,can_use_item)
			if updated.is_empty():
				result.reason = equipment.error
				return result
			candidate = updated
			result.unequipped.append(slot)
	result.allowed = true
	return result

# Module6.fn114E. Returns the ByRef Long cost, which changes on the bank branch.
# The fractional remainder is rounded to Long even though balances are Currency.
func pay(c: Dictionary, price: int) -> Dictionary:
	error = ""
	if price < -2147483648 or price > 2147483647:
		error = "VB Long payment overflow"
		return {}
	var money = Money.new()
	var numeric = Numeric.new()
	var raw_price = price * 10000
	var carried = c.M4F2D
	var bank = c.M58AF
	var by_ref = price
	if raw_price > carried:
		var total = money.add(carried,bank)
		if not money.error.is_empty():
			error = money.error
			return {}
		if raw_price > total:
			error = "Not enough gold."
			return {}
		var remainder = money.subtract(raw_price,carried)
		if not money.error.is_empty():
			error = money.error
			return {}
		by_ref = numeric.long_integer(remainder / 10000.0)
		carried = 0
		bank = money.subtract(bank,by_ref * 10000)
	else: carried = money.subtract(carried,raw_price)
	if not money.error.is_empty() or not numeric.error.is_empty():
		error = money.error + numeric.error
		return {}
	c.M4F2D = carried
	c.M58AF = bank
	return {"by_ref_price":by_ref}

# Candidate membership transition; input is untouched on every rejected path.
func join(c: Dictionary, target: int) -> Dictionary:
	var quote = join_quote(c,target)
	if not quote.allowed:
		error = quote.reason
		return {}
	var next = c.duplicate(true)
	if quote.must_pay and pay(next,quote.fee).is_empty(): return {}
	next.M5584[next.M58BB].M579B = next.M579B
	next.M58BB = target
	next.M579B = next.M5584[target].M579B
	if quote.new_member: next.M5584[target].M4E82 = 1
	var town = Town.new()
	next.M5970 = town.next_experience(next,catalog.tables.guilds[target].raw,catalog.tables.races[next.M5821].raw)
	if not town.error.is_empty():
		error = town.error
		return {}
	if next.M5584[target].M4E82 >= catalog.tables.guilds[target].raw.M559A:
		var rules = Rules.new()
		next.M59A1 = rules.level_boundary(target,catalog.tables.guilds[target].raw,next.M5584[target].M4E82)
		if not rules.error.is_empty():
			error = rules.error
			return {}
	for slot in quote.unequipped:
		var equipment = Equipment.new(catalog)
		next = equipment.toggle(next,slot,can_use_item)
		if next.is_empty():
			error = equipment.error
			return {}
	return {"character":next,"new_member":quote.new_member,"fee":quote.fee,"unequipped":quote.unequipped}

# FRMCTYG.cmdMake_Click spell-knowledge loops, without presentation side effects.
func knows_spell(c: Dictionary, spell: Dictionary) -> bool:
	for index in catalog.tables.guilds.size():
		var guild = catalog.tables.guilds[index].raw
		var level = c.M5584[index].M4E82
		var factor = guild.M55F6[spell.M5709]
		if level > 0 and factor > 0 and spell.M4E82 <= guild.M55F6[spell.M5709 + 19] and spell.M4E82 * factor <= level / 2.0 + 0.5: return true
	return false

# Module6.fn13FF and fn1417 share the selection loop. Ties keep the first guild.
func casting_guild(c: Dictionary, spell: Dictionary) -> Dictionary:
	var best_level = 0
	var selected = 0
	for index in catalog.tables.guilds.size():
		var guild = catalog.tables.guilds[index].raw
		if guild.M55F6[spell.M5709] > 0 and guild.M55F6[spell.M5709 + 19] >= spell.M4E82 and c.M5584[index].M4E82 > 0:
			var level = int(floor(c.M5584[index].M4E82 / 2.0 + 0.5))
			if level > best_level:
				best_level = level
				selected = index
	return {"guild":selected,"level":best_level}

# Read-only preflight from cmdMake_Click: the train threshold differs from M5970
# (pin cap). Item slot zero does not satisfy the original item-quest check.
func training_requirements(c: Dictionary) -> Dictionary:
	error = ""
	var town = Town.new()
	var guild = catalog.tables.guilds[c.M58BB].raw
	var member = c.M5584[c.M58BB]
	var xp = town.experience_required(c,guild,catalog.tables.races[c.M5821].raw)
	var calculation_error = town.error
	var price = town.training_price(c,guild)
	if not town.error.is_empty(): calculation_error = town.error
	var result = {"experience":xp,"price":price,"ready":true,"reason":"","quest":"No quest assigned.","item_slot":-1,"can_forfeit":false}
	if member.M4E82 >= 999: result.reason = "This guild can teach you no more."
	elif c.M579B < xp * 10000: result.reason = "You need more experience."
	var completed = true
	if member.M55CB in [1,2]:
		var definitions = catalog.tables.monsters if member.M55CB == 1 else catalog.tables.items
		var target_name = "Unknown target #%d" % member.M57A9
		for row in definitions:
			if row.raw.M5467 == member.M57A9:
				target_name = row.name
				break
		if member.M55CB == 1:
			completed = member.M57B2 != 0
			result.quest = "Defeat one " + target_name + (" (completed)." if completed else ".")
		else:
			for slot in 40:
				var id = c.M5857[slot].M4ED4
				if id >= 0 and id < catalog.tables.items.size() and catalog.tables.items[id].raw.M5467 == member.M57A9:
					result.item_slot = slot
					break
			completed = result.item_slot > 0
			result.quest = "Return one " + target_name + (" (carried)." if completed else ".")
		if not completed:
			result.can_forfeit = c.M579B >= c.M5970 * 10000
			if result.reason.is_empty(): result.reason = "Complete your assigned quest first."
	var candidate = c.duplicate(true)
	if pay(candidate,price).is_empty() and result.reason.is_empty(): result.reason = error
	if not error.is_empty() and error != "Not enough gold.": result.reason = error
	if not calculation_error.is_empty(): result.reason = calculation_error
	result.ready = result.reason.is_empty()
	return result

# FRMCTYG.sub29D0. Only the highest accumulated guild bonus contributes to A/D.
func adjust_guild_ad(c: Dictionary, guild_index: int, demotion: bool = false):
	var guild = catalog.tables.guilds[guild_index].raw
	for field in ["M4E97","M4EA1"]:
		var highest = 0.0
		for index in catalog.tables.guilds.size():
			if demotion and index == guild_index: continue
			highest = maxf(highest,c.M5584[index][field])
		var member = c.M5584[guild_index]
		if demotion:
			if member[field] > highest:
				var difference = Numeric.single(member[field] - highest)
				c[field] = Numeric.single(c[field] - minf(difference,guild[field]))
			member[field] = Numeric.single(member[field] - guild[field])
		else:
			member[field] = Numeric.single(member[field] + guild[field])
			if member[field] > highest:
				c[field] = Numeric.single(c[field] + Numeric.single(member[field] - highest))

# FRMCTYG.cmdMake_Click growth segment only, for supplied-draw research replay.
# Never used to save a trained character: quest generation, item identification,
# guildmaster awards, and the original RNG state are still required downstream.
func growth_preview(c: Dictionary, tape) -> Dictionary:
	error = ""
	var next = c.duplicate(true)
	var numeric = Numeric.new()
	var index = next.M58BB
	var guild = catalog.tables.guilds[index].raw
	var old_level = next.M5584[index].M4E82
	if old_level < 1 or old_level >= 999:
		return {"error":"Growth replay requires a guild level from 1 through 998."}
	var level = old_level + 1
	next.M5584[index].M4E82 = level
	var highest = true
	for other in catalog.tables.guilds.size():
		if other != index and next.M5584[other].M4E82 >= level: highest = false
	if level > guild.M559A or not highest:
		if highest: next.M4EB4 = numeric.integer(next.M4EB4 + guild.M55A4)
	else:
		var branch = int(floor(tape.draw("cmdMake.hp_branch") * 3.0)) + 1
		if branch in [1,2]:
			next.M4EB4 = numeric.integer(next.M4EB4 + floor(tape.draw("cmdMake.hp_bonus") * guild.M5591 / 5.0) + 1)
		next.M4EB4 = numeric.integer(next.M4EB4 + guild.M5591)
		if next.M55B5[3] > 16 and level < guild.M559A:
			next.M4EB4 = numeric.integer(next.M4EB4 + floor(tape.draw("cmdMake.constitution_bonus") * (next.M55B5[3] - 16)) + 1)
	next.M4EB4 = mini(next.M4EB4,999)
	next.M4EAC = next.M4EB4
	if level <= guild.M561A:
		var rules = Rules.new()
		var boundary: int
		if level <= guild.M559A:
			boundary = int(floor(guild.M5626))
		else:
			if next.M59A1 < level: next.M59A1 = rules.level_boundary(index,guild,level)
			boundary = next.M59A1
		if boundary == 0: return {"error":"Original growth modulo divisor is zero."}
		if level % boundary == 0:
			adjust_guild_ad(next,index)
			if level >= guild.M559A: next.M59A1 = rules.level_boundary(index,guild,level)
		next.M59A1 = rules.level_boundary(index,guild,level)
		if not rules.error.is_empty(): return {"error":rules.error}
	if guild.M55BE[3] > 0:
		if guild.M55BE[3] >= 11: return {"error":"Critical ability logarithm domain error."}
		var coefficient = log(11.0 - guild.M55BE[3])
		var threshold = numeric.integer(coefficient * 50.0)
		var critical = 0
		for step in range(1,level + 1):
			if step > threshold:
				critical = numeric.integer(critical + 1)
				threshold = numeric.integer(coefficient * (threshold * 2.0))
		next.M56AF = maxi(next.M56AF,critical)
	if not tape.error.is_empty(): return {"error":tape.error}
	if not numeric.error.is_empty(): return {"error":numeric.error}
	var learned = []
	for spell in catalog.tables.spells:
		if knows_spell(next,spell.raw) and not knows_spell(c,spell.raw): learned.append(spell.name)
	return {"status":"growth_segment_only_not_saved","old_level":old_level,"level":level,"highest_level":highest,
		"hp_gain":next.M4EB4 - c.M4EB4,"hp":next.M4EB4,"attack":next.M4E97,"defense":next.M4EA1,
		"critical":next.M56AF,"learned_spells":learned,"events":tape.events.duplicate(true),"character":next}
