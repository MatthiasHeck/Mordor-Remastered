extends RefCounted
## fn0D4D encounter candidate: primary weighting, secondary groups, chest
## metadata, member HP/gold, identification and offers. Damaged retry labels
## fail explicitly where their control flow cannot yet be established.
const Codec = preload("res://core/vb_record.gd")
const Numeric = preload("res://core/vb_numeric.gd")
const Combat = preload("res://core/combat_rules.gd")
var catalog
var error = ""
var numeric = Numeric.new()

func _init(data): catalog = data

func generate(c: Dictionary, tape, now: float) -> Dictionary:
	error = ""
	numeric.error = ""
	if c.M5470 < 1 or c.M5470 > catalog.floors.size() or c.M59BB < 1 or c.M59BB > 200:
		error = "Invalid encounter generation location."
		return {}
	var area = catalog.floors[c.M5470 - 1].areas[c.M59BB]
	var result = {"groups":[],"meta":Codec.new(PackedByteArray(),catalog.schemas).blank("T4F0B")}
	for _slot in 4:
		var group = Codec.new(PackedByteArray(),catalog.schemas).blank("T4E8B")
		group.M4ED4 = -1
		group.M4EE6 = Numeric.single(now)
		result.groups.append(group)
	if area.M5D45 == 0: return result
	var chosen = -1
	for _attempt in 10000:
		chosen = primary(c,area,tape)
		if not tape.error.is_empty():
			error = tape.error
			return {}
		if chosen != -2: break
	if chosen < 0:
		if error.is_empty(): error = "Original encounter generation retry limit exceeded."
		return {}
	var monster = catalog.tables.monsters[chosen].raw
	tape.draw("fn0D4D.unused_chest_roll")
	var chest_roll = tape.draw("fn0D4D.chest") * 99
	result.meta.M4F24 = chosen
	for index in range(1,3):
		if chest_roll < monster.M5A4A[index] + (25 if area.M5D55 > 0 and monster.M5467 == area.M5D55 and monster.M5A4A[2] > 0 else 0): result.meta.M4F1B = index + 1
	if result.meta.M4F1B > 0 and monster.M5A70 > 0:
		var chance = {1:25,2:75,3:90}[result.meta.M4F1B]
		if floor(tape.draw("fn0D4D.trap_gate") * 100) + 1 < chance:
			for _attempt in 1024:
				var trap = int(floor(tape.draw("fn0D4D.trap") * 12))
				if monster.M5A70 & (1 << trap):
					result.meta.M4F35 = trap
					break
	var terrain = catalog.cell(c.M5470,c.M583F,c.M5845).flags
	if not terrain & ((1 << 18) | (1 << 10)):
		if floor(tape.draw("fn0D4D.locked") * 100) + 1 <= monster.M5A26 and result.meta.M4F1B > 1: result.meta.M4F3D = 1
	var count = int(monster.M5A0E)
	if floor(tape.draw("fn0D4D.group_gate") * 100) < count / 8.0 * 100: count -= int(floor(tape.draw("fn0D4D.group_reduction") * (monster.M5A0E / 2.0 + 1)))
	count = clampi(count,1,4)
	var mood = 0 if monster.M4EBF == 0 and c.M4EBF == 0 else 1
	if monster.M4EBF == 1: mood = 0 if floor(tape.draw("fn0D4D.mood") * 100) < 40 else 1
	var combat = Combat.new(catalog)
	var previous = chosen
	for index in count:
		if index > 0:
			previous = secondary(previous,tape)
			if previous < 0: return {}
		monster = catalog.tables.monsters[previous].raw
		var members = maxi(1,numeric.integer(monster.M5A57 - numeric.integer(tape.draw("fn0D4D.members") * monster.M5A57 / 2.0)))
		var group = combat.fixture_group(previous,members)
		var factor = int(monster.M5A64)
		var gold = numeric.long_integer(factor * pow(10.0,factor - 0.5) / 4.0)
		gold = numeric.long_integer((gold / 4.0 + tape.draw("fn0D4D.gold1") * gold / 2.0 + tape.draw("fn0D4D.gold2") * gold / 2.0) * log((monster.M5693 + 1.0) / log(2.0)))
		if gold < 500: gold = int(floor(tape.draw("fn0D4D.small_gold") * 500)) + 2
		var raw_gold = Numeric.round_even(gold * log(members + 1.0) * log(members + 1.0) / 2.0 * 10000.0)
		result.meta.M4F2D += raw_gold
		combat.replace_member(group,monster,tape)
		group.M4ECC = mood if index == 0 else 0
		group.M4EBF = monster.M4EBF
		group.M4EE6 = Numeric.single(now)
		group.M4EEE = 1 if terrain & (1 << 20) else 0
		identify(c,group,tape)
		# Literal source clears the first group's offer on EACH iteration.
		result.groups[0].M4EF9 = 0
		if group.M4ECC == 0 and (monster.M4EBF == 1 or monster.M4EBF == c.M4EBF) and monster.M5A7C <= c.M5584[c.M58BB].M4E82:
			if floor(tape.draw("fn0D4D.join_offer") * 3000) + 1 <= maxi(0,c.M55B5[4] * 10 - (monster.M5693 - 1) * 10):
				group.M4EF9 = int(floor(tape.draw("fn0D4D.join_members") * mini(members,4))) + 1
		result.groups[index] = group
	var members = 0
	for group in result.groups: members += group.M4EDC
	result.meta.M4F2D = Numeric.round_even(result.meta.M4F2D * members / 2.0)
	if result.meta.M4F3D == 1: result.meta.M4F2D = Numeric.round_even(result.meta.M4F2D * 1.5)
	if not tape.error.is_empty() or not numeric.error.is_empty():
		error = tape.error if not tape.error.is_empty() else numeric.error
		return {}
	return result


func primary(c: Dictionary, area: Dictionary, tape) -> int:
	# Special named room monster is an exact logical-ID search, first match.
	var chosen = -1
	if area.M5D55 > 0 and tape.draw("fn0D4D.special") * 100 <= 75:
		for index in catalog.tables.monsters.size():
			if catalog.tables.monsters[index].raw.M5467 == area.M5D55:
				chosen = index
				break
	if chosen < 0:
		var types = {}
		for index in catalog.tables.monsters.size():
			var kind = int(catalog.tables.monsters[index].raw.M4ED4)
			if not types.has(kind): types[kind] = []
			types[kind].append(index)
		var start_area = c.M5470 == 1 and c.M59BB < 18
		var any_type = floor(tape.draw("fn0D4D.any_type") * 100) + 1 < 2 and not start_area
		var type_pool = []
		if any_type:
			type_pool.append(int(floor(tape.draw("fn0D4D.type") * catalog.tables.monster_types.size())))
		else:
			for kind in catalog.tables.monster_types.size():
				if area.M5D45 & (1 << kind) and types.has(kind): type_pool.append(kind)
		if type_pool.is_empty():
			type_pool.append(int(floor(tape.draw("fn0D4D.fallback_type") * catalog.tables.monster_types.size())))
			any_type = true
		var band_roll = int(floor(tape.draw("fn0D4D.level_band") * 100)) + 1
		var band = numeric.integer((1 if band_roll < 50 else 0) + c.M5470 / 5.0) # <30/<10 branches are unreachable in supplied ElseIf order.
		band = mini(band,c.M5470)
		var pools = []
		var total = 0.0
		for kind in type_pool:
			var pool = []
			var weight = 0.0
			for index in types.get(kind,[]):
				var m = catalog.tables.monsters[index].raw
				if m.M5693 >= c.M5470 - band and m.M5693 <= c.M5470 and m.M56A0 > 0:
					pool.append(index)
					weight += m.M56A0
			pools.append({"indices":pool,"weight":weight})
			total += weight
		if total <= 0: return -2
		var pool_index = pools.size() - 1
		if not any_type:
			var type_roll = tape.draw("fn0D4D.weighted_type") * 101
			var running = pools[0].weight
			for index in pools.size():
				if type_roll <= running / total * 100:
					pool_index = index
					break
				running += pools[index].weight # Literal current-index accumulation.
		var selected = pools[pool_index]
		if selected.indices.is_empty(): return -2
		var monster_roll = tape.draw("fn0D4D.weighted_monster") * 100
		var accumulated = 0.0
		for index in selected.indices:
			accumulated += catalog.tables.monsters[index].raw.M56A0 / selected.weight * 100
			if monster_roll <= accumulated:
				chosen = index
				break
		if chosen < 0: chosen = selected.indices[-1]
		if start_area and catalog.tables.monsters[chosen].raw.M5A7C > 2 and chosen != 4: return -2
	return chosen

func secondary(previous: int, tape) -> int:
	var m = catalog.tables.monsters[previous].raw
	match int(m.M5A96):
		3: return previous
		4,6: return 4
		5: return 5
	if m.M5A96 > 7: return int(m.M5A96) - 7
	if not m.M5A96 in [0,1,2]:
		error = "Invalid secondary encounter mode."
		return -1
	var lower = int(m.M5693) - (0 if m.M5A96 == 2 else 3)
	var upper = int(m.M5693) - (1 if m.M5A96 == 0 and m.M5693 > 1 else 0)
	var pool = []
	var total = 0.0
	for index in catalog.tables.monsters.size():
		var candidate = catalog.tables.monsters[index].raw
		if candidate.M4ED4 == m.M5A89 and candidate.M5693 >= lower and candidate.M5693 <= upper and candidate.M5A57 != 1 and index != previous and (m.M5ADA == 0 or candidate.M5ACF == m.M5ADA):
			pool.append(index)
			total += candidate.M56A0
	if total <= 0:
		# Source jumps back into the primary selection loop. Keep this ambiguous
		# decompiler branch explicit rather than fabricate a secondary monster.
		error = "Encounter secondary pool is empty; original retry label requires runtime verification."
		return -1
	var roll = tape.draw("fn0D4D.secondary") * 99
	var weight = 0.0
	for index in range(pool.size() - 1,-1,-1):
		weight += catalog.tables.monsters[pool[index]].raw.M56A0 / total * 100
		if roll <= weight: return pool[index]
	return pool[0]

func identify(c: Dictionary, group: Dictionary, tape):
	var m = catalog.tables.monsters[group.M4ED4].raw
	var highest = 0
	for guild in c.M5584: highest = maxi(highest,guild.M4E82)
	var skill = Numeric.single((c.M55B5[1] + c.M55B5[2] + c.M584B[1] + c.M584B[2]) / 2.0)
	skill = Numeric.single(skill * log((highest + 5.0) / 10.0 + 1))
	var threat = Numeric.single(log(m.M5A7C) * (m.M5693 + 1))
	var chance = clampf(Numeric.single(50 + Numeric.single(skill - threat) * 10),5,95)
	var roll = floor(tape.draw("fn0D4D.identify") * 100) + 1
	var relatives = []
	var at = 0
	for index in catalog.tables.monsters.size():
		if catalog.tables.monsters[index].raw.M5ACF == m.M5ACF:
			if index == group.M4ED4: at = relatives.size()
			relatives.append(index)
	if roll <= chance or relatives.size() <= 1: return
	var distance = Numeric.single(tape.draw("fn0D4D.identify_distance") * (log(m.M5693) + 2.5))
	for _attempt in 101:
		var direction = 1 if floor(tape.draw("fn0D4D.identify_direction") * 100) + 1 < chance else -1
		var delta = int(floor(tape.draw("fn0D4D.identify_offset") * (distance + 1.5)))
		var offset = at + direction * delta
		if offset >= 0 and offset < relatives.size() and catalog.tables.monsters[relatives[offset]].raw.M4ED4 == m.M4ED4:
			group.M4F01 = relatives[offset]
			return
