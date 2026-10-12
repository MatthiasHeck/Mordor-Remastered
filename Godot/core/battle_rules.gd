extends "res://core/combat_rules.gd"
## Campaign round candidates from Module7.sub155A/sub0A64 and Module4.sub0E85.
## Solo character path; companions, charm, charged items and recovery pending.
const Guild = preload("res://core/guild_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Equipment = preload("res://core/equipment.gd")

func action_failure(tape) -> Dictionary:
	return fail(tape.error if not tape.error.is_empty() else numeric.error if not numeric.error.is_empty() else error if not error.is_empty() else "Combat action could not be completed.")

func round_action(character: Dictionary, room: Dictionary, command: String, requested: int, spell: int, supplied) -> Dictionary:
	error = ""
	numeric.error = ""
	if not validate(character,room.groups): return {}
	if catalog.cell(character.M5470,character.M583F,character.M5845).is_empty(): return fail("Invalid combat square.")
	if character.M5483 != 0 or character.M4EAC <= 0: return fail("This character needs recovery services.")
	if command not in ["attack","defend","wait","spell","escape"]: return fail("Unknown combat command.")
	var tape = supplied.fork()
	var result = {"character":character.duplicate(true),"groups":room.groups.duplicate(true),"meta":room.meta.duplicate(true),"target":active_group(room.groups,requested),"messages":[],"attacks":[],"experience":0,"experience_added":0,"kills":0,"command":command,"death":0,"recovered_gold":0}
	if command == "spell":
		if character.M56B9[2] > 0 and result.target >= 0 and result.groups[0].M4ECC == 1: result.messages.append("Paralysis prevents casting.")
		elif not player_spell(result,spell,tape): return action_failure(tape)
	if command == "attack" and result.target >= 0:
		result.groups[0].M4ECC = 1
		if not player_attack(result,tape): return action_failure(tape)
	if result.target >= 0 and result.groups[0].M4ECC != 1 and result.groups[0].M4EF9 == 0 and command != "escape":
		var alignment = catalog.tables.monsters[result.groups[0].M4ED4].raw.M4EBF
		var hero = result.character.M4EBF
		var base = 0
		match alignment:
			0: base = 15 if hero == 1 else 100 if hero == 2 else 0
			1: base = 15 if hero == 1 else 25
			2: base = 25 if hero == 2 else 35
		if floor(tape.draw("sub155A.hostility") * 100) + 1 < base - numeric.integer(7.5 * log(result.character.M55B5[4])):
			result.groups[0].M4ECC = 1
			result.messages.append("The monsters become hostile.")
	if result.groups[0].M4ECC == 1:
		for index in 4:
			if result.groups[index].M4EDC <= 0: continue
			tape.draw("sub0A64.target") # Still consumed when solo selection always picks character zero.
			if command == "escape":
				var monster = catalog.tables.monsters[result.groups[index].M4ED4].raw
				var chance = clampf(50 + (monster.M55B5[5] - character.M55B5[5]) * 5,5,98)
				if floor(tape.draw("sub0A64.exit_attack") * 100) + 1 >= chance: continue
			result.target = index
			if not monster_attack(result,tape): return action_failure(tape)
			if result.character.M4EAC <= 0 or result.death != 0: break
	result.target = active_group(result.groups,requested)
	if result.character.M4EAC <= 0 or result.death != 0:
		if not record_death(result.character,result.death if result.death != 0 else 1): return {}
		result.messages.append("You have died. This expedition has been saved.")
	result.outcome = "defeat" if result.character.M5483 != 0 else "victory" if result.target < 0 else "active"
	if not tape.error.is_empty(): return fail(tape.error)
	if not numeric.error.is_empty(): return fail(numeric.error)
	if not error.is_empty(): return {}
	result.draws_used = tape.position - supplied.position
	result.events = tape.events.slice(supplied.events.size())
	supplied.adopt(tape)
	return result

func record_death(c: Dictionary, mode: int) -> bool:
	if c.M5483 != 0: return true
	c.M4EAC = 0
	c.M5483 = mode
	var money = Money.new()
	c.M5906[1] = money.add(c.M5906[1],10000)
	if not money.error.is_empty():
		error = money.error
		return false
	for index in 4: c.M58CB[index].M4ED4 = -1
	c.M5943 = -1
	return true

func spell_cost(c: Dictionary, s: Dictionary) -> int:
	var cost = 0
	var minimum = -1
	for index in catalog.tables.guilds.size():
		var guild = catalog.tables.guilds[index].raw
		if s.M4E82 > guild.M55F6[s.M5709 + 19] or c.M5584[index].M4E82 <= 0: continue
		var level = clampi(int(floor(c.M5584[index].M4E82 / 2.0 + 0.5)),1,255)
		var factor = guild.M55F6[s.M5709] if guild.M55F6[s.M5709] != 0 else 1.0
		var scaled = numeric.integer(s.M4E82 * factor)
		var quote = int(floor(scaled / float(level) * s.M556D * factor * 1.9))
		if quote <= cost or cost == 0:
			cost = quote
			if minimum == -1 or scaled < minimum: minimum = scaled
			cost = maxi(cost,minimum)
	return cost

func spell_reason(c: Dictionary, index: int) -> String:
	if index < 0 or index >= catalog.tables.spells.size(): return "Invalid spell."
	var s = catalog.tables.spells[index].raw
	# fn10E5 uses separate knowledge and rounded level loops. Keep them separate;
	# the guild supplying a category cap need not supply the winning level check.
	var known = false
	var level_ok = false
	for index_guild in catalog.tables.guilds.size():
		var guild = catalog.tables.guilds[index_guild].raw
		var level = c.M5584[index_guild].M4E82
		var factor = guild.M55F6[s.M5709]
		if level <= 0 or factor <= 0: continue
		if guild.M55F6[s.M5709 + 19] >= s.M4E82: known = true
		if numeric.integer(s.M4E82 * factor) <= floor(level / 2.0 + 0.5): level_ok = true
	if not known or not level_ok: return "This spell is beyond your guild training."
	for stat in 6:
		if c.M55B5[stat] + c.M584B[stat] < s.M5B4F[stat]: return "Your statistics are too low for this spell."
	if c.M5830 < spell_cost(c,s): return "Not enough spell points."
	if catalog.cell(c.M5470,c.M583F,c.M5845).flags & ((1 << 18) | (1 << 10)): return "Magic is suppressed here."
	var effect = int(s.M56B9) % 200
	if s.M5709 == 7: return "Charm and companion combat are still being migrated."
	if effect not in [0,1,2,3,4,5,6,10,12,13,18,19] and not (effect >= 50 and effect <= 60) and not (effect >= 75 and effect <= 100): return "This spell's effect is still being migrated."
	return ""

func spell_hits(s: Dictionary, level: int, resistance: Array, hp: int, tape, monster: Dictionary = {}) -> int:
	level = clampi(level,1,255)
	var growth = finite_single(log(level + 1.0) / log(5.0))
	var power = finite_single(s.M5B33 + s.M5B33 * growth)
	power = finite_single(power + floor(level / 10.0 * s.M5B41))
	var penalty = finite_single(floor(tape.draw("fn0E5F.power") * (power - (level - 1.0) / pow(level,2)) / 2.0) + 1)
	var damage = numeric.integer(floor(power - penalty))
	if s.M5B5B >= 0: damage = numeric.integer(damage * (1 - resistance[s.M5B5B] / 100.0))
	if not monster.is_empty():
		if monster.M55BE & (1 << 2): damage = 0
		if s.M56B9 >= 75 and s.M56B9 <= 99 and catalog.tables.monster_types[monster.M4ED4].raw.M550A != s.M56B9 - 75: damage = 0
	if s.M56B9 == 100 and hp - damage > 0: damage = 0
	return maxi(0,damage)

func player_spell(result: Dictionary, index: int, tape) -> bool:
	var reason = spell_reason(result.character,index)
	if not reason.is_empty():
		error = reason
		return false
	var c = result.character
	var s = catalog.tables.spells[index].raw
	var effect = int(s.M56B9) % 200
	var casting = Guild.new(catalog).casting_guild(c,s)
	tape.draw("fn1173.unused")
	if s.M5B33 > 0 and s.M5709 != 9:
		if result.target < 0:
			error = "No monster to target."
			return false
		if result.groups[0].M4ECC != 1 and s.M4E82 > 7:
			error = "There is no time to cast that spell at peaceful monsters."
			return false
		result.groups[0].M4ECC = 1
		var initial = result.target
		for offset in mini(4,s.M5B28):
			var group_index = (initial + offset) % 4
			var group = result.groups[group_index]
			if group.M4EDC <= 0: continue
			var monster = catalog.tables.monsters[group.M4ED4].raw
			for _member in mini(s.M5B1D,group.M4EDC):
				var hits = spell_hits(s,casting.level,monster.M5548,group.M4EAC,tape,monster)
				var actual = mini(group.M4EAC,hits)
				group.M4EAC = maxi(0,numeric.integer(group.M4EAC - hits))
				result.attacks.append({"actor":"player_spell","target":group_index,"spell":index,"damage":hits,"actual":actual})
				if not award_experience(result,actual,monster.M5A7C,1.0): return false
				if group.M4EAC > 0: break
				result.kills += 1
				var money = Money.new()
				c.M5906[0] = money.add(c.M5906[0],10000)
				var membership = c.M5584[c.M58BB]
				if membership.M55CB == 1 and membership.M57B2 == 0 and membership.M57A9 == monster.M5467:
					membership.M57B2 = -1
					c.M5906[3] = money.add(c.M5906[3],10000)
				if not money.error.is_empty():
					error = money.error
					return false
				group.M4EDC -= 1
				if group.M4EDC > 0 and not replace_member(group,monster,tape): return false
	else:
		if result.target >= 0 and result.groups[0].M4ECC == 1 and effect != 10:
			error = "This is a non-combat spell."
			return false
		match effect:
			0,18:
				var level = maxi(1,int(floor(c.M5584[c.M58BB].M4E82 / 2.0 + 0.5)))
				var growth = finite_single(log(level) / log(10.0))
				var power = finite_single(s.M5B33 + s.M5B33 * growth)
				power = finite_single(power + floor(level / 10.0 * s.M5B41))
				var penalty = finite_single(floor(tape.draw("fn1173.heal") * (power - (level - 1.0) / pow(level,2)) / 2.0) + 1)
				c.M4EAC = mini(c.M4EB4,numeric.integer(c.M4EAC + floor(power - penalty)))
				if effect == 18:
					c.M56B9[0] = 0
					c.M56B9[1] = 0
			1: c.M56B9[0] = 0
			2: c.M56B9[1] = 0
			10: paralysis(c,0)
			3:
				c.M56B9[3] = 1
				c.M591F |= 1 << 3
			4,5,6:
				var slot = {4:4,5:5,6:6}[effect]
				c.M56B9[slot] = int(floor(casting.level / 2.0)) + 1 if effect == 6 else -1 if effect == 5 else 1
				c.M591F |= 1 << slot
			12: c.M59F4[0] = 0
			13: c.M59F4[2] = 0
			19:
				c.M591F = 0
				for resist in 11: c.M592F[resist] = 0
				Equipment.new(catalog).refresh_effects(c)
			_:
				if effect >= 50 and effect <= 60:
					c.M592F[effect - 50] = maxi(95,c.M592F[effect - 50])
					Equipment.new(catalog).refresh_effects(c)
	c.M5830 = numeric.integer(c.M5830 - spell_cost(c,s))
	result.messages.append("You cast %s." % s.M548B)
	return tape.error.is_empty() and numeric.error.is_empty()

func select_monster_spell(m: Dictionary, tape) -> int:
	var category = -1
	for _attempt in 1001:
		var candidate = int(floor(tape.draw("fn0FF5.category") * 18))
		if m.M5A40 & (1 << candidate):
			category = candidate
			break
	if category < 0: return -1
	var pool = []
	var minimum = maxi(1,numeric.integer(m.M5693 - m.M5693 / 3.0))
	for index in catalog.tables.spells.size():
		var s = catalog.tables.spells[index].raw
		if s.M5709 == category and s.M4E82 >= minimum and s.M4E82 <= m.M5693 + 1: pool.append(index)
	if pool.is_empty(): return -1
	if floor(tape.draw("fn0FF5.skip") * 100) < 10: return -1
	if not "Mage" in catalog.tables.monster_types[m.M4ED4].name and floor(tape.draw("fn0FF5.non_mage") * 100) < 50: return -1
	var index = pool[int(floor(tape.draw("fn0FF5.spell") * pool.size()))]
	var s = catalog.tables.spells[index].raw
	return index if s.M5B33 > 0 and s.M5B41 > 0 else -1

func monster_attack(result: Dictionary, tape) -> bool:
	var c = result.character
	var group = result.groups[result.target]
	var m = catalog.tables.monsters[group.M4ED4].raw
	var flags = int(m.M5A35)
	var highest = 0
	for membership in c.M5584: highest = maxi(highest,membership.M4E82)
	if flags & ((1 << 3) | (1 << 4)):
		if not elemental(result,m,tape,"breath",highest,80,20,0 if flags & (1 << 3) else 1): return false
		if c.M4EAC <= 0: return true
	if flags & (1 << 5):
		if not elemental(result,m,tape,"acid",c.M5584[c.M58BB].M4E82,90,10,10): return false
		if c.M4EAC <= 0: return true
	var combined = 0
	var last_hit = false
	var terrain = catalog.cell(c.M5470,c.M583F,c.M5845).flags
	for member in mini(5,group.M4EDC):
		if m.M5A40 > 0 and not terrain & ((1 << 18) | (1 << 10)):
			var spell = select_monster_spell(m,tape)
			if spell >= 0:
				# Literal assignment replaces earlier physical hits, then exits loop.
				combined = spell_hits(catalog.tables.spells[spell].raw,int(floor(m.M5A7C / 4.0)),c.M5548,c.M4EAC,tape)
				result.attacks.append({"actor":"monster_spell","target":result.target,"spell":spell,"damage":combined})
				break
		var multiplier = finite_single(m.M56F7 if m.M56F7 > 0 else 1.0)
		if c.M56B9[4] == -1 and not m.M55BE & 1: multiplier = finite_single(multiplier - 0.5)
		var marks = 0
		for kind in [10,11]:
			if not flags & (1 << kind): continue
			var chance = finite_single(log(m.M5A7C / (650.0 if kind == 10 else 500.0) + 1) * 100 * log(m.M5693 + 1.0))
			chance = finite_single(chance - log(c.M5584[c.M58BB].M4E82 / 999.0 + 1) * 100)
			chance = clampf(chance,2 if kind == 10 else 4,50 if kind == 10 else 75)
			if floor(tape.draw("sub0E85.critical" if kind == 10 else "sub0E85.backstab") * 100) + 1 <= chance:
				multiplier = finite_single(multiplier + (2 if kind == 10 else 1))
				marks |= 1 << kind
		var difference = absi(catalog.tables.races[c.M5821].raw.M5565 - m.M5565)
		if catalog.tables.races[c.M5821].raw.M5565 < m.M5565: multiplier = finite_single(multiplier + difference / 10.0)
		elif catalog.tables.races[c.M5821].raw.M5565 > m.M5565: multiplier = finite_single(multiplier - difference / 10.0)
		# The early defend bonus is overwritten by this assignment in the source.
		var defense = numeric.integer(c.M4EA1 + defensive_bonus(c))
		var hit = Rules.new().damage(group.M4E97,defense,m.M5A7C,m.M55B5[0],multiplier,tape)
		if hit.has("error"):
			error = hit.error
			return false
		combined = numeric.integer(combined + hit.damage)
		last_hit = hit.damage > 0
		result.attacks.append({"actor":"monster","target":result.target,"member":member + 1,"damage":hit.damage,"marks":marks})
	c.M4EAC = maxi(0,numeric.integer(c.M4EAC - combined))
	result.messages.append("%s hit for %d damage." % [m.M548B,combined] if combined > 0 else "%s missed." % m.M548B)
	if c.M4EAC <= 0: return true
	if flags & (1 << 6) and combined > 0:
		if not elemental(result,m,tape,"electricity",c.M5584[c.M58BB].M4E82,90,10,2): return false
		if c.M4EAC <= 0: return true
	var constitution = c.M55B5[3] + c.M584B[3]
	if flags & (1 << 9) and combined > 0 and last_hit:
		if floor(tape.draw("sub0E85.age_gate") * 100) + 1 > constitution * 2.5 - m.M5693 * 2:
			var years = clampi(numeric.integer(m.M5A7C / 50.0),1,5)
			var days = mini(int(floor(tape.draw("sub0E85.age_days") * 1825)) + 1,years * 365)
			c.M5577 = finite_single(c.M5577 + days)
			result.messages.append("You have aged %d days." % days)
	if flags & (1 << 7) and combined > 0 and last_hit:
		var attempts = int(floor(tape.draw("sub0E85.drain_count") * numeric.integer(m.M5693 / 2.0 + 0.5))) + 1
		for _attempt in attempts:
			if floor(tape.draw("sub0E85.drain_resist") * 100) + 1 <= c.M5548[9]: continue
			if floor(tape.draw("sub0E85.drain_constitution") * 100) + 1 <= (c.M55B5[3] + c.M584B[3]) * 2.5 - m.M5693 * 2: continue
			var stat = int(floor(tape.draw("sub0E85.drain_stat") * 6)) + 1
			if stat < 6:
				if c.M56B9[2] == 0: Town.stat_ad(c,true)
				c.M55B5[stat] = maxi(catalog.tables.races[c.M5821].raw.M5530[stat],c.M55B5[stat] - 1)
				if c.M56B9[2] == 0: Town.stat_ad(c,false)
			else:
				c.M4EB4 = maxi(highest,c.M4EB4 - 2)
				c.M4EAC = mini(c.M4EAC,c.M4EB4)
			result.messages.append("You have been drained.")
		# Item revalidation after natural-stat drain needs the original force path.
		if not revalidate_items(c): return false
	constitution = c.M55B5[3] + c.M584B[3]
	if flags & (1 << 8) and combined > 0:
		if floor(tape.draw("sub0E85.stone_resist") * 100) + 1 > c.M5548[7]:
			var chance = finite_single(constitution * finite_single(log(constitution) / log(2.5)) - m.M5693)
			if floor(tape.draw("sub0E85.stone") * 100) + 1 > minf(95,chance):
				result.death = 2
				c.M4EAC = 0
				result.messages.append("You have been turned to stone.")
				return true
	# These two draws are unconditional, even when neither status bit is set.
	for pair in [[0,5,"poison"],[1,4,"disease"]]:
		var roll = floor(tape.draw("sub0E85." + pair[2]) * 100) + 1
		if flags & (1 << pair[0]) and combined > 0 and last_hit and roll > c.M5548[pair[1]] and c.M56B9[pair[0]] == 0:
			c.M56B9[pair[0]] = m.M5693
			result.messages.append("You have contracted " + pair[2] + ".")
	if flags & (1 << 2) and combined > 0 and last_hit:
		var chance = mini(95,numeric.integer(c.M5548[8] + constitution))
		if floor(tape.draw("sub0E85.paralysis") * 100) + 1 > chance and c.M56B9[2] == 0:
			paralysis(c,m.M5A7C)
			result.messages.append("You have been paralyzed.")
	if flags & (1 << 12) and not destroy_item(result,m,tape): return false
	if flags & (1 << 13) and not steal(result,m,combined,tape): return false
	return tape.error.is_empty() and numeric.error.is_empty() and error.is_empty()

func elemental(result: Dictionary, m: Dictionary, tape, kind: String, hero_level: int, high: int, low: int, resistance: int) -> bool:
	var c = result.character
	var chance = high if hero_level > m.M5A7C * 1.25 else low if hero_level < m.M5A7C * 0.75 else 50
	if floor(tape.draw("sub0E85." + kind + "_gate") * 100) >= chance: return true
	var potency = numeric.integer(m.M5A7C * log(m.M5A7C + 1.0)) if kind == "breath" else numeric.integer(m.M5A7C + 1)
	var bound = int(floor((log(potency) + potency / 15.0) / log(1.08) - c.M5584[c.M58BB].M4E82 / (20.0 if kind == "breath" else 10.0) + 1))
	var damage = numeric.integer((floor((tape.draw("sub0E85." + kind + "_damage") * bound + 1) / 2.0) + bound / (4.0 if kind == "breath" else 2.0)) * 0.7 / (2.0 if kind == "breath" else 1.0))
	if c.M5548[resistance] > 0: damage = numeric.integer(damage - damage * c.M5548[resistance] / 200.0)
	if damage > 0:
		c.M4EAC = maxi(0,numeric.integer(c.M4EAC - damage))
		result.messages.append("%s deals %d damage." % [kind.capitalize(),damage])
	return numeric.error.is_empty() and tape.error.is_empty()

func paralysis(c: Dictionary, severity: int):
	if (severity > 0 and c.M56B9[2] != 0) or (severity == 0 and c.M56B9[2] == 0): return
	var before = [numeric.integer(c.M4E97),numeric.integer(c.M4EA1)]
	Town.stat_ad(c,true)
	var delta = [numeric.integer(before[0] - c.M4E97),numeric.integer(before[1] - c.M4EA1)]
	Town.stat_ad(c,false)
	var sign_value = -1 if severity > 0 else 1
	c.M4E97 = finite_single(c.M4E97 + delta[0] * sign_value)
	c.M4EA1 = finite_single(c.M4EA1 + delta[1] * sign_value)
	c.M56B9[2] = severity

func revalidate_items(c: Dictionary) -> bool:
	for slot in 40:
		var held = c.M5857[slot]
		if held.M577E != 1 or held.M4ED4 <= 0: continue
		var item = catalog.tables.items[held.M4ED4].raw
		if not Guild.new(catalog).can_keep_equipped(c,item):
			if not force_unequip(c,slot): return false
	return true

func force_unequip(c: Dictionary, slot: int) -> bool:
	var level = c.M5470
	c.M5470 = 0 # Arithmetic adapter accepts town context; no location is saved here.
	var equipment = Equipment.new(catalog)
	var changed = equipment.toggle(c,slot,func(_c,_i,_x): return true,true)
	c.M5470 = level
	if changed.is_empty():
		error = equipment.error
		return false
	changed.M5470 = level
	for field in changed: c[field] = changed[field]
	return true

func removable(index: int) -> bool:
	if index <= 0 or index >= catalog.tables.items.size(): return false
	var effect = catalog.tables.items[index].raw.M56B9
	return effect < 500 or effect >= 500 + catalog.tables.guilds.size()

func remove_item(c: Dictionary, slot: int) -> bool:
	if slot < 1 or slot >= 40:
		error = "Original item removal refers to the allocated sentinel slot; runtime verification is required."
		return false
	if c.M5857[slot].M577E == 1 and not force_unequip(c,slot): return false
	c.M5857[slot].M577E = 0
	c.M5857[slot].M572A = 0
	c.M5857[slot].M4ED4 = 0
	c.M5857[slot].M56DB = 0
	c.M5857[slot].M5467 = -1
	# sub0F61 refreshes the slot display; it does not pack inventory records.
	return true

func destroy_item(result: Dictionary, m: Dictionary, tape) -> bool:
	var c = result.character
	var slot = int(floor(tape.draw("sub0E85.destroy_slot") * 39)) + 1
	var id = c.M5857[slot].M4ED4
	if id <= 0: return true
	var dex = c.M55B5[5] + c.M55B5[5] # Literal doubled base stat, not modifier.
	var dodge = clampi(numeric.integer(45 - m.M5693 + dex * (2.0 if c.M56B9[2] == 0 else 0.5) - m.M55B5[5] * 2),25,90)
	if floor(tape.draw("sub0E85.destroy_dodge") * 100) + 1 > dodge and catalog.tables.items[id].raw.M5693 - 2 <= m.M5693 and removable(id):
		result.messages.append("%s destroyed." % catalog.tables.items[id].name)
		return remove_item(c,slot)
	return true

func steal(result: Dictionary, m: Dictionary, physical: int, tape) -> bool:
	var c = result.character
	var score = numeric.integer(floor(tape.draw("sub0E85.steal_gate") * 100))
	var skill = ability(c,0,false,result.meta.M4F24)
	if skill.is_empty(): return false
	score = numeric.integer(score + floor(tape.draw("sub0E85.steal_skill") * skill.level * skill.rating + skill.level / 2.0 * 1.5))
	if result.command == "defend": score = numeric.integer(score + score / 2.0)
	score = numeric.integer(score - physical / float(c.M4EB4) * 100)
	if score - m.M5A7C * 2 >= 50: return true
	var gold = numeric.long_integer(floor(tape.draw("sub0E85.steal_gold") * (c.M5470 + result.groups[result.target].M4E97) * 3353.452 * m.M5A7C / c.M5584[c.M58BB].M4E82))
	gold = mini(gold,numeric.long_integer(c.M4F2D / 10000.0))
	c.M4F2D = maxi(0,c.M4F2D - gold * 10000)
	var stolen = false
	if score - m.M5A7C * 2 <= 10:
		var slot = int(floor(tape.draw("sub0E85.steal_slot") * 39)) + 2
		if removable(c.M5857[slot].M4ED4) and c.M5857[slot].M577E == 0:
			stolen = true
			if not remove_item(c,slot): return false
	if gold > 0 or stolen: result.messages.append("A monster stole your possessions.")
	if (floor(tape.draw("sub0E85.steal_flee") * 100) + 1 > 30 and gold > 0) or stolen:
		var group = result.groups[result.target]
		group.M4EDC -= 1
		if group.M4EDC > 0 and not replace_member(group,m,tape): return false
		result.messages.append("The thief flees.")
	else: result.recovered_gold += gold * 10000
	return true

func ailments(character: Dictionary, groups: Array, supplied) -> Dictionary:
	error = ""
	numeric.error = ""
	var c = character.duplicate(true)
	var tape = supplied.fork()
	var messages = []
	var constitution = c.M55B5[3] + c.M584B[3]
	if c.M56B9[0] > 0:
		if floor(tape.draw("timAilments.poison") * 200) + (constitution - 10) * 2 - c.M56B9[0] * 2 > 185:
			c.M56B9[0] = 0
		else:
			c.M4EAC = maxi(0,c.M4EAC - 2)
			messages.append("Poison deals 2 damage.")
	if c.M56B9[1] != 0:
		# Recovered disease roll references POISON severity.
		if floor(tape.draw("timAilments.disease") * 200) + (constitution - 10) * 2 - c.M56B9[0] * 2 > 195 and c.M56B9[1] > 0:
			c.M56B9[1] = 0
		else:
			c.M4EAC = maxi(0,c.M4EAC - 1)
			messages.append("Disease deals 1 damage.")
	if c.M56B9[2] > 0:
		var severity = c.M56B9[2]
		var level = c.M5584[c.M58BB].M4E82
		var potency = finite_single(log(severity / 2.0 + severity / 10.0) / log(1.02))
		var recovery = finite_single((log(level) + level / 10.0) / log(1.05) / 10.0 + constitution * 1.5 + c.M5548[8])
		var chance = finite_single(potency - recovery)
		if floor(tape.draw("timAilments.paralysis") * 100) + 1 > clampf(chance,5,90) or active_group(groups) < 0:
			paralysis(c,0)
			messages.append("Your paralysis ends.")
	if not tape.error.is_empty(): return fail(tape.error)
	if not numeric.error.is_empty(): return fail(numeric.error)
	if not error.is_empty(): return {}
	supplied.adopt(tape)
	return {"character":c,"messages":messages}
