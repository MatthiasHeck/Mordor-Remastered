extends RefCounted
## Recovered combat candidates. Explicit actions and supplied Rnd results;
## caller owns scheduling, persistence and encounter generation.
const Numeric = preload("res://core/vb_numeric.gd")
const Rules = preload("res://core/original_rules.gd")
const Codec = preload("res://core/vb_record.gd")
const Money = preload("res://core/currency.gd")
const Tape = preload("res://core/draw_tape.gd")
var catalog
var numeric = Numeric.new()
var error = ""

func _init(data): catalog = data

func fail(message: String) -> Dictionary:
	error = message
	return {}

func finite_single(value: float) -> float:
	var result = Numeric.single(value)
	if not is_finite(result): error = "VB Single overflow or invalid logarithm in combat."
	return result

# Module6.fn11D4. Selected guild metadata is returned instead of gv141C.
# Room monster context is mandatory for the in-dungeon trap-disarm branch.
func ability(c: Dictionary, kind: int, outside_room: bool = false, room_monster: int = -1) -> Dictionary:
	error = ""
	if kind < 0 or kind > 5: return fail("Invalid guild ability.")
	var best = {"value":0.0,"guild":-1,"level":0,"rating":0.0}
	for index in catalog.tables.guilds.size():
		var level = int(c.M5584[index].M4E82)
		if level <= 0: continue
		var rating = float(catalog.tables.guilds[index].raw.M55BE[kind])
		var value = 0.0
		match kind:
			0:
				var stats = finite_single((c.M55B5[2] + c.M584B[2]) / 4.0)
				stats = finite_single(stats + (c.M55B5[5] + c.M584B[5]) / 2.0)
				var in_room = c.M59BB > -1 and c.M5470 > 0 and not outside_room
				var threat = 2
				if in_room:
					if room_monster < 0 or room_monster >= catalog.tables.monsters.size(): return fail("Trap ability needs the original room monster context.")
					threat = catalog.tables.monsters[room_monster].raw.M5A7C
					if threat <= 0: return fail("Invalid trap-context monster level.")
				var penalty = finite_single(log(threat) * 4.0 * log(c.M5470 + 1.0) * 1.25 * 1.25)
				value = finite_single(stats + (4.5 + exp(log(level + 1.0) / log(15.0))) * rating / 10.0 * 14.0 - penalty * 1.5)
				if in_room: value = clampf(value,5,98)
			1,2,3: value = finite_single(rating * level)
			4: value = finite_single(0.6 + ((log(100.0 + level) / 1.75 - 2.3) * rating * rating) / 2.0)
			5:
				# Original precedence: WIS + modifier/4, not (WIS+modifier)/4.
				var stat = finite_single(c.M55B5[2] + c.M584B[2] / 4.0)
				var growth = finite_single(log(level) / log(1.25))
				value = finite_single((rating + growth) * rating * 0.3 + stat)
				value = clampf(finite_single(value - c.M5470 * 2.0),5,90)
		if not error.is_empty(): return {}
		if value > best.value: best = {"value":value,"guild":index,"level":level,"rating":rating}
	return best

# Module6.fn13A8: guild defensive effect, with Integer assignment.
func defensive_bonus(c: Dictionary) -> int:
	var value = int(c.M56B9[6])
	return numeric.integer(log(value) * log(value) * 3.0) if value > 0 else 0

# Module4.fn0DCD: four allocated groups, positive member counts, first match.
static func active_group(groups: Array, requested: int = -1) -> int:
	if requested >= 0 and requested < mini(4,groups.size()) and groups[requested].M4EDC > 0: return requested
	for index in mini(4,groups.size()):
		if groups[index].M4EDC > 0: return index
	return -1

# Fixture construction is new preview code, NOT fn0D4D generation.
func fixture_group(monster: int, members: int = 1) -> Dictionary:
	if monster < 0 or monster >= catalog.tables.monsters.size() or members < 1 or members > 32767: return fail("Invalid monster fixture.")
	var definition = catalog.tables.monsters[monster].raw
	var group = Codec.new(PackedByteArray(),catalog.schemas).blank("T4E8B")
	group.M4ED4 = monster # Physical table index, not the possibly duplicated ID.
	group.M4E97 = definition.M4E97
	group.M4EA1 = definition.M4EA1
	group.M4EAC = definition.M4EAC
	group.M4EB4 = definition.M4EAC
	group.M4EDC = members
	group.M4F01 = monster
	return group

func physical_limit(monster: int) -> String:
	if monster < 0 or monster >= catalog.tables.monsters.size(): return "Invalid monster index."
	var m = catalog.tables.monsters[monster].raw
	if m.M5A40 != 0: return "Monster spell attacks are still being migrated."
	if m.M5A35 & ~((1 << 10) | (1 << 11)): return "This monster has unported breath, status, item, or other special attacks."
	return ""

func validate(c: Dictionary, groups: Array) -> bool:
	if groups.size() != 4:
		error = "Combat requires four allocated group slots."
		return false
	if c.M5821 < 0 or c.M5821 >= catalog.tables.races.size() or c.M58BB < 0 or c.M58BB >= catalog.tables.guilds.size() or c.M5470 <= 0:
		error = "Invalid combat character or dungeon context."
		return false
	for index in 4:
		var companion = c.M58CB[index]
		if companion.M4ED4 >= 0:
			error = "Companion combat is still being migrated."
			return false
	for group in groups:
		if group.M4EDC < 0 or group.M4EDC > 32767 or group.M4EAC < 0:
			error = "Invalid group count or health."
			return false
		if group.M4EDC > 0 and (group.M4ED4 < 0 or group.M4ED4 >= catalog.tables.monsters.size()):
			error = "Invalid active monster index."
			return false
	return true

# One original attack action, NOT a fabricated player-first combat round.
# Candidate state and Rnd consumption commit together; missing draws roll back.
func action(character: Dictionary, groups: Array, requested: int, actor: String, supplied_tape) -> Dictionary:
	error = ""
	numeric.error = ""
	if not validate(character,groups): return {}
	if character.M4EAC <= 0 or character.M5483 != 0: return fail("The character cannot act after defeat.")
	if not actor in ["player","monster"]: return fail("Unknown combat actor.")
	var target = active_group(groups,requested)
	if target < 0: return fail("No active monster group.")
	var result = {"character":character.duplicate(true),"groups":groups.duplicate(true),"target":target,"messages":[],"attacks":[],"experience":0,"experience_added":0,"kills":0,"status":"combat_action_preview_not_saved"}
	var tape = supplied_tape.fork()
	var ok = player_attack(result,tape) if actor == "player" else monster_attack(result,tape)
	if not tape.error.is_empty(): error = tape.error
	if not numeric.error.is_empty(): error = numeric.error
	if not ok or not error.is_empty(): return {}
	result.target = active_group(result.groups,result.target)
	result.outcome = "victory" if result.target < 0 else "defeat" if result.character.M4EAC <= 0 else "active"
	result.draws_used = tape.position - supplied_tape.position
	result.events = tape.events.slice(supplied_tape.events.size())
	supplied_tape.adopt(tape)
	return result

# Module4.sub1019 physical weapon path. Two important literal quirks:
# l0118 gets defense, but unassigned l011C is passed to fn0DEE (zero candidate).
# A miss OR a surviving hit ends that weapon's swing loop; kills can continue.
func player_attack(result: Dictionary, tape) -> bool:
	var c = result.character
	if c.M56B9[2] > 0:
		result.messages.append("The recovered positive paralysis guard blocks this attack.")
		return true
	var attack = numeric.integer(c.M4E97)
	var strength = numeric.integer(c.M55B5[0] + c.M584B[0])
	var power = ability(c,4)
	if power.is_empty(): return false
	var attack_level = power.level
	var total_swings = int(c.M56AF)
	var has_weapon = false
	for weapon in c.M5997:
		if weapon < -1 or weapon >= catalog.tables.items.size():
			error = "Invalid equipped weapon index."
			return false
		if weapon >= 0:
			has_weapon = true
			total_swings = numeric.integer(total_swings + catalog.tables.items[weapon].raw.M56AF)
	if not has_weapon or total_swings < 1:
		result.messages.append("Using no weapon!")
		return true
	for hand in 2:
		var weapon_index = int(c.M5997[hand])
		if weapon_index < 0: continue
		var weapon = catalog.tables.items[weapon_index].raw
		var swings = numeric.integer(c.M56AF + weapon.M56AF)
		if swings > 1000:
			error = "Preview swing limit exceeded."
			return false
		for swing in maxi(0,swings):
			var target = active_group(result.groups,result.target)
			if target < 0: return true
			result.target = target
			var group = result.groups[target]
			var monster = catalog.tables.monsters[group.M4ED4].raw
			if monster.M55BE & (1 << 4) and weapon.M5693 < floor(monster.M5693 / 2.0) or monster.M55BE & (1 << 5):
				result.messages.append("Weapon has no effect!")
				break
			power = ability(c,4)
			if power.is_empty(): return false
			var multiplier = finite_single(power.value * weapon.M56F7)
			var marks = 0
			for kind in [2,1]:
				var skill = ability(c,kind)
				if skill.is_empty(): return false
				if skill.rating <= -1 or weapon.M5693 <= -1 or monster.M5A7C < 0:
					error = "Invalid critical/backstab logarithm."
					return false
				var chance = finite_single(log(skill.level / 999.0 + 1) * 100 * log(skill.rating + 1) / (3.0 if kind == 2 else 2.0))
				chance = finite_single(chance - log(monster.M5A7C / 999.0 + 1) * 100)
				chance = finite_single(chance / 2.0)
				var special_bit = 4 if kind == 2 else 5
				if weapon.M55BE & (1 << special_bit):
					var minimum = log(weapon.M5693 + 1.0) * log(10.0 if kind == 2 else 100.0)
					chance = finite_single(maxf(chance + minimum,minimum))
				var minimum = 1 if kind == 2 else 2
				if chance < minimum and (skill.level > 0 or weapon.M55BE & (1 << special_bit)): chance = minimum
				chance = minf(chance,50 if kind == 2 else 75)
				if floor(tape.draw("sub1019.critical" if kind == 2 else "sub1019.backstab") * 100) < chance:
					marks |= 1 << kind
					multiplier = finite_single(multiplier + (5 if kind == 2 else 2))
				if not tape.error.is_empty(): return false
			if monster.M55BE & 2 and c.M56B9[5] == 0: multiplier = finite_single(multiplier - multiplier / 2.0)
			var difference = absi(catalog.tables.races[c.M5821].raw.M5565 - monster.M5565)
			if catalog.tables.races[c.M5821].raw.M5565 < monster.M5565: multiplier = finite_single(multiplier - difference / 10.0)
			elif catalog.tables.races[c.M5821].raw.M5565 > monster.M5565: multiplier = finite_single(multiplier + difference / 10.0)
			var hit = Rules.new().damage(attack,0,attack_level,strength,multiplier,tape)
			if hit.has("error"):
				error = hit.error
				return false
			var damage = int(hit.damage)
			var before = int(group.M4EAC)
			var actual = mini(before,damage)
			group.M4EAC = maxi(0,numeric.integer(before - damage))
			result.attacks.append({"actor":"player","target":target,"monster":group.M4ED4,"hand":hand,"swing":swing + 1,"damage":damage,"actual":actual,"marks":marks,"arguments":[attack,0,attack_level,strength,multiplier],"assigned_but_unused_defense":group.M4EA1})
			if not award_experience(result,actual,monster.M5A7C,1.0): return false
			if damage == 0:
				result.messages.append("You missed!")
				break
			if group.M4EAC > 0:
				result.messages.append("You hit for %d damage." % damage)
				break
			result.kills += 1
			var money = Money.new()
			c.M5906[0] = money.add(c.M5906[0],10000)
			if not money.error.is_empty():
				error = money.error
				return false
			var membership = c.M5584[c.M58BB]
			if membership.M55CB == 1 and membership.M57B2 == 0 and membership.M57A9 == monster.M5467:
				membership.M57B2 = -1
				c.M5906[3] = money.add(c.M5906[3],10000)
				if not money.error.is_empty():
					error = money.error
					return false
				result.messages.append("You have completed your monster quest.")
			group.M4EDC = numeric.integer(group.M4EDC - 1)
			result.messages.append("You killed one %s." % monster.M548B)
			if group.M4EDC > 0 and not replace_member(group,monster,tape): return false
	return true

# Module4.sub0D08: next member resets AD and receives two HP draws.
func replace_member(group: Dictionary, monster: Dictionary, tape) -> bool:
	group.M4E97 = monster.M4E97
	group.M4EA1 = monster.M4EA1
	var sign_draw = int(floor(tape.draw("sub0D08.sign") * 2))
	if not tape.error.is_empty(): return false
	var amount = numeric.integer(floor(tape.draw("sub0D08.health") * (monster.M4EAC * 0.5) / 2.0) + 1)
	group.M4EAC = numeric.integer(monster.M4EAC + (-amount if sign_draw == 0 else amount))
	group.M4EB4 = group.M4EAC
	return numeric.error.is_empty() and tape.error.is_empty()

# Module4.sub0CDF and Module6.sub0F11, solo XP path with exact Currency debit.
func award_experience(result: Dictionary, damage: int, monster_level: int, multiplier: float) -> bool:
	if damage <= 0: return true
	var c = result.character
	var divisor = finite_single(1.0 + c.M5584[c.M58BB].M4E82 / 999.0 * 3.0)
	var xp = numeric.long_integer(damage * (0.9 - log(damage + 1.0) / 10.0) * (5 + monster_level / 10.0) * (2 - log(damage) / 10.0) * multiplier / divisor)
	var money = Money.new()
	var next = money.add(c.M579B,xp * 10000)
	if not money.error.is_empty():
		error = money.error
		return false
	var prior_xp = int(c.M579B)
	c.M579B = mini(next,int(c.M5970) * 10000)
	result.experience += xp
	result.experience_added += c.M579B - prior_xp
	return numeric.error.is_empty() and error.is_empty()

# Module4.sub0E85 physical solo path. Reject dependent attack branches rather
# than silently skipping them. Damage is accumulated BEFORE the HP debit.
func monster_attack(result: Dictionary, tape) -> bool:
	var c = result.character
	var group = result.groups[result.target]
	var limitation = physical_limit(group.M4ED4)
	if not limitation.is_empty():
		error = limitation
		return false
	var monster = catalog.tables.monsters[group.M4ED4].raw
	var combined = 0
	for member in mini(5,group.M4EDC):
		var multiplier = finite_single(monster.M56F7 if monster.M56F7 > 0 else 1.0)
		if c.M56B9[4] == -1 and not monster.M55BE & 1: multiplier = finite_single(multiplier - 0.5)
		var marks = 0
		for kind in [10,11]:
			if not monster.M5A35 & (1 << kind): continue
			if monster.M5693 <= -1:
				fail("Invalid monster critical logarithm.")
				return false
			var chance = finite_single(log(monster.M5A7C / (650.0 if kind == 10 else 500.0) + 1) * 100 * log(monster.M5693 + 1.0))
			chance = finite_single(chance - log(c.M5584[c.M58BB].M4E82 / 999.0 + 1) * 100)
			chance = clampf(chance,2 if kind == 10 else 4,50 if kind == 10 else 75)
			if floor(tape.draw("sub0E85.critical" if kind == 10 else "sub0E85.backstab") * 100) + 1 <= chance:
				multiplier = finite_single(multiplier + (2 if kind == 10 else 1))
				marks |= 1 << kind
			if not tape.error.is_empty(): return false
		var difference = absi(catalog.tables.races[c.M5821].raw.M5565 - monster.M5565)
		if catalog.tables.races[c.M5821].raw.M5565 < monster.M5565: multiplier = finite_single(multiplier + difference / 10.0)
		elif catalog.tables.races[c.M5821].raw.M5565 > monster.M5565: multiplier = finite_single(multiplier - difference / 10.0)
		var defense = numeric.integer(c.M4EA1 + defensive_bonus(c))
		var hit = Rules.new().damage(group.M4E97,defense,monster.M5A7C,monster.M55B5[0],multiplier,tape)
		if hit.has("error"):
			error = hit.error
			return false
		combined = numeric.integer(combined + hit.damage)
		result.attacks.append({"actor":"monster","target":result.target,"monster":group.M4ED4,"member":member + 1,"damage":hit.damage,"marks":marks,"arguments":[group.M4E97,defense,monster.M5A7C,monster.M55B5[0],multiplier]})
	c.M4EAC = maxi(0,numeric.integer(c.M4EAC - combined))
	result.messages.append("Monsters hit for %d damage." % combined if combined > 0 else "Monsters missed.")
	return numeric.error.is_empty() and error.is_empty()
