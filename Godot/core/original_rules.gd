extends RefCounted
## Transcribed recovered routines. Original symbols are retained in state records.
## Static translations are candidates until compared with the Win16 executable.
const Numeric = preload("res://core/vb_numeric.gd")
var numeric = Numeric.new()
var error: String = ""

# Module1.fn0380. Caller supplies an unscaled flag mask, not raw Currency bytes.
static func has_flag(bit: int, flags: int) -> bool:
	return bit >= 0 and bit < 63 and (flags & (1 << bit)) != 0

# Module3.fn0AE8 / fn0B01; one-based record position inside a floor.
static func cell_number(x: int, y: int, width: int) -> int:
	return x + width * (y - 1)

# Module6.fn115C checks race and alignment ONLY, not statistics or training cost.
static func guild_allows(guild: Dictionary, character: Dictionary) -> bool:
	return has_flag(character.M5821, guild.M5604) and has_flag(character.M4EBF, guild.M5557)

# Module6.fn131D returns a level, not an index. Includes only actual guilds.
static func highest_guild_level(character: Dictionary, guild_count: int) -> int:
	var highest = 0
	for index in guild_count:
		highest = maxi(highest, character.M5584[index].M4E82)
	return highest

# Module6.fn1338, constants mc03E2=1 (INT), mc0352=2 (WIS).
func capacity(character: Dictionary) -> int:
	numeric.error = ""
	var result = numeric.integer(character.M55B5[1] * 5.0 + character.M55B5[2] * 5.0)
	error = numeric.error
	return result

# CHARCREA.cmbRace_Click: minima +5, plus the separate race bonus pool.
static func creation_state(race_index: int, race: Dictionary) -> Dictionary:
	var stats = []
	for index in 6: stats.append(race.M5530[index] + 5)
	stats.append(0) # The unused seventh VB slot is still present.
	var alignments = []
	for index in 3:
		if has_flag(index, race.M5557): alignments.append(index)
	return {"M5821":race_index, "M4EBF":alignments[0] if not alignments.is_empty() else -1,
		"M55B5":stats, "points":race.M556D, "alignments":alignments}

# CHARCREA.cmdAdd_Click/cmdSubtract_Click, including refunded base points.
static func adjust_creation_stat(state: Dictionary, race: Dictionary, index: int, change: int) -> bool:
	if index < 0 or index >= 6 or abs(change) != 1: return false
	if change > 0:
		if state.points <= 0 or state.M55B5[index] >= race.M553C[index]: return false
	else:
		if state.M55B5[index] <= race.M5530[index]: return false
	state.M55B5[index] += change
	state.points -= change
	return true

# CHARCREA.sub1EBA's eligibility computation, separated from font/window changes.
static func eligible_guilds(character: Dictionary, guilds: Array) -> Array:
	var result = []
	for guild in guilds:
		var raw = guild.raw
		if not has_flag(character.M5821, raw.M5604): continue
		var eligible = guild_allows(raw, character)
		for index in 6:
			if character.M55B5[index] < raw.M55B5[index]: eligible = false
		result.append({"name":guild.name, "eligible":eligible})
	return result

# Module4.fn0DEE. Four Rnd calls are retained even when the final result misses.
# Parameter names intentionally remain neutral where original meaning is unknown.
func damage(p03b6: int, p03b8: int, p03ba: int, pv03bc: int, pv03be: float, tape) -> Dictionary:
	numeric.error = ""
	error = ""
	if p03ba <= -5:
		return {"error":"fn0DEE: Log(p03BA + 5) domain error"}
	for value in [p03b6, p03b8, p03ba, pv03bc]: numeric.integer(value)
	if not numeric.error.is_empty(): return {"error":numeric.error}
	var coefficient: float
	if p03b6 == 0 and p03b8 == 0:
		coefficient = Numeric.single(0.5)
	elif p03b6 > p03b8:
		coefficient = Numeric.single(0.5 + 0.5 * (p03b6 - p03b8) / p03b6)
	elif p03b8 == 0:
		coefficient = Numeric.single(0.5 + 0.5 * p03b6)
	else:
		coefficient = Numeric.single(0.5 - 0.5 * (p03b8 - p03b6) / p03b8)
	coefficient = clampf(Numeric.single(coefficient * 100.0), 2.0, 98.0)
	pv03be = Numeric.single(pv03be)
	if pv03be <= 0: pv03be = Numeric.single(0.1)
	if pv03bc < 1: pv03bc = 1
	pv03bc = numeric.integer(numeric.integer(pv03bc - log(pv03bc) * ((log(pv03bc) - 2.4) * 2.25)) + 1)
	if pv03be > 1: pv03be = Numeric.single(pv03be - log(pv03be) * log(pv03be))
	var l03c4 = Numeric.single((log(p03ba + 5.0) + 1.0) / log(1.2))
	var l03c6 = Numeric.single(pv03bc / 30.0)
	var l03c8 = Numeric.single(floor(tape.draw("fn0DEE.base") * ((pv03bc + 10.0) / 2.0) + ((pv03bc + 10.0) / 4.0)) / 10.0)
	var hits = numeric.integer(floor(Numeric.single(Numeric.single(l03c4 * l03c6) * l03c8) * pv03be))
	var correction = Numeric.single(floor((p03b8 - p03b6) / 8.0))
	correction = Numeric.single(correction - floor(tape.draw("fn0DEE.correction") * (correction + 1.0)) + 1.0)
	var rare_roll = int(floor(tape.draw("fn0DEE.rare") * 1000.0)) + 1
	if rare_roll > 1: hits = numeric.integer(hits - correction)
	if hits < 1: hits = 0
	var hit_roll = int(floor(tape.draw("fn0DEE.hit") * 100.0)) + 1
	if hit_roll >= coefficient: hits = 0
	if not tape.error.is_empty(): error = tape.error
	elif not numeric.error.is_empty(): error = numeric.error
	if not error.is_empty(): return {"error":error}
	return {"damage":hits, "coefficient":coefficient, "hit_roll":hit_roll,
		"rare_roll":rare_roll, "transformed_parameter":pv03bc, "correction":correction,
		"events":tape.events.duplicate(true), "status":"static_translation_not_runtime_verified"}

# FRMCTYS.fn271B; I=0 must be excluded by the caller (already identified).
func identify_price(item: Dictionary, instance: Dictionary, stock: int) -> int:
	numeric.error = ""
	error = ""
	if instance.M4EEE <= 0:
		error = "Identification quote requires a positive identification field"
		return 0
	var result = numeric.long_integer((0.23 * item.M5686) / (((mini(stock, 9) / 2.0) + 1.0) * 0.9) / instance.M4EEE + 1.0)
	error = numeric.error
	return result

# FRMCTYS.fn273B, retains bundle penalty and curse/stock/identification branches.
func sell_price(item: Dictionary, instance: Dictionary, alignment_stock: Array) -> int:
	numeric.error = ""
	error = ""
	var alignment = int(instance.M4EBF)
	if alignment_stock.size() < 4 or alignment < 0 or alignment >= alignment_stock.size() or instance.M4EEE < 0:
		error = "Invalid sell-quote state"
		return 0
	var value = int(item.M5686)
	var stock = int(alignment_stock[alignment])
	if item.M572A >= 1 and instance.M577E == 1: value = 0
	if stock == 0:
		for index in 4:
			if alignment_stock[index] > 0:
				stock = 1
				break
	stock = mini(stock, 9)
	var charges = int(instance.M56DB)
	var penalty = 1.0
	if item.M56DB > 0 and item.M5709 in [23,24,25,26,27,28,30,31]:
		penalty = 5.0
		if charges > item.M56DB: charges = item.M56DB
	penalty = Numeric.single(penalty * log(abs(charges - item.M56DB) + 1.0))
	if instance.M4EEE == 0 and item.M572A != 0: return 0
	var intermediate = numeric.long_integer((0.9 * value / (stock + 1.15)) / (instance.M4EEE + 1.0))
	var result = numeric.long_integer(intermediate - penalty * (0.05 * intermediate))
	error = numeric.error
	return result

# FRMCTYS.fn274F is a separation quote, not removal of the definition's curse.
func uncurse_price(item: Dictionary) -> int:
	numeric.error = ""
	var result = numeric.long_integer(0.8 * item.M5686 / 0.5)
	error = numeric.error
	return result

# Module6.fn137E. Preserve inclusive loop and Nomad-specific divisor addition.
func level_boundary(guild_index: int, guild: Dictionary, level: int) -> int:
	numeric.error = ""
	var result = 0.0
	if level > guild.M559A:
		result = Numeric.single(guild.M559A)
		var addition = 3.0 if guild_index == 0 else 0.0
		if guild.M5626 + addition == 0:
			error = "fn137E: division by zero"
			return 0
		for _index in range(guild.M559A, level + 1):
			var increment = numeric.integer((guild.M559A / 2.0 + result / 18.0) / (guild.M5626 + addition))
			result = Numeric.single(result + increment)
			if result > level: break
		if result == guild.M559A: result = Numeric.single(level + 1)
	if level > guild.M561A: result = Numeric.single(result * 1.1)
	var final_value = numeric.integer(result)
	error = numeric.error
	return final_value
