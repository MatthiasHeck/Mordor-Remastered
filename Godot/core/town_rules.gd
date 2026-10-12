extends RefCounted
## Recovered rule candidates. No original-executable parity claim.
const Rules = preload("res://core/original_rules.gd")
const Numeric = preload("res://core/vb_numeric.gd")
const Money = preload("res://core/currency.gd")
const Codec = preload("res://core/vb_record.gd")
var numeric = Numeric.new()
var error: String = ""

# Module6.fn124B. Currency assignments are rounded separately; the loop does NOT
# accumulate experience. Reject magnitudes beyond exact float integer precision.
func currency_assignment(value: float) -> float:
	if not is_finite(value) or absf(value * 10000.0) > 9007199254740991.0:
		error = "Progression calculation exceeds supported exact Currency precision"
		return 0.0
	return Numeric.round_even(value * 10000.0) / 10000.0

func experience_required(character: Dictionary, guild: Dictionary, race: Dictionary) -> int:
	error = ""
	numeric.error = ""
	var guild_ep = Numeric.single(guild.M557E)
	var race_ep = Numeric.single(race.M557E + 1.0)
	if race_ep <= 0 or race_ep == 0:
		error = "Invalid race experience factor"
		return 0
	var result = 0.0
	for level in range(1,character.M5584[character.M58BB].M4E82 + 1):
		var a = currency_assignment((level + level) * guild_ep)
		var b = currency_assignment((level / 2.0) * 2.0 + (level - 1))
		result = currency_assignment(((a / 12.0) * 500.0 * level + 344.0 * b - 2.0) / 10.0)
		currency_assignment((result + b) * race_ep) # Assigned but unused in original.
	result = currency_assignment(result * (((log(race_ep) / log(race_ep + 1.0)) + 1.0) - 0.7 + race_ep / 25.0))
	var converted = numeric.long_integer(result)
	if not numeric.error.is_empty(): error = numeric.error
	return converted

# Module6.fn1397: temporarily increments level, computes requirement, subtracts 1.
func next_experience(character: Dictionary, guild: Dictionary, race: Dictionary) -> int:
	var temporary = character.duplicate(true)
	if temporary.M5584[temporary.M58BB].M4E82 >= 32767:
		error = "VB Integer overflow"
		return 0
	temporary.M5584[temporary.M58BB].M4E82 += 1
	return experience_required(temporary,guild,race) - 1

# Module6.fn125C; preserve the Long assignment inside each loop iteration.
func training_price(character: Dictionary, guild: Dictionary) -> int:
	error = ""
	numeric.error = ""
	var level = character.M5584[character.M58BB].M4E82
	var total = 0
	for index in range(1,level + 1):
		var factor = numeric.long_integer((index / 2.0) * 2.0 + index - 1)
		total = numeric.long_integer(total + (((level / 2.0) * factor) * 60.2) / level)
	var result = numeric.long_integer(total + total * (guild.M4F2D / 10.0))
	error = numeric.error
	return result

# Module6.sub047C arithmetic. The synchronous caller owns the remove/apply pair;
# original process-global UI reentry state is not represented in character bytes.
static func initial_stat_ad(character: Dictionary):
	stat_ad(character,false)

static func stat_ad(character: Dictionary, remove: bool) -> String:
	var numeric = Numeric.new()
	# Original evaluates all upper-threshold branches before all lower branches.
	for upper in [true,false]:
		for pair in [[0,12,2],[1,14,1],[2,14,1],[5,12,2]]:
			var stat = character.M55B5[pair[0]] + character.M584B[pair[0]]
			if (upper and stat <= pair[1]) or (not upper and stat >= 8): continue
			var difference = numeric.integer(absi(stat - (pair[1] if upper else 8)))
			var bonus = numeric.integer(pair[2] * difference) * (1 if upper else -1) * (-1 if remove else 1)
			character.M4E97 = Numeric.single(character.M4E97 + bonus)
			character.M4EA1 = Numeric.single(character.M4EA1 + bonus)
	return numeric.error

# CHARCREA.sub1F1F: character fields. Campaign writes the guild log; window metadata remains pending.
func new_character(state: Dictionary, name: String, sex: int, password: String, catalog, vb_date: int) -> Dictionary:
	error = ""
	var c = Codec.new(PackedByteArray(),catalog.schemas).blank("T5810")
	c.M548B = name
	c.M594C = password if not password.is_empty() else " "
	c.M5821 = state.M5821
	c.M4EBF = state.M4EBF
	c.M5829 = sex
	c.M55B5 = state.M55B5.duplicate()
	c.M5577 = 16.0 * 365.0
	c.M5899 = 1
	c.M4F2D = 1500 * 10000
	c.M4EB4 = 15
	c.M4EAC = 15
	c.M4E97 = 10.0
	c.M4EA1 = 10.0
	c.M5584[0].M4E82 = 1
	c.M583F = 9
	c.M5845 = 11
	c.M5943 = -1
	c.M59BB = -1
	c.M5914[5] = 1
	c.M5830 = Rules.new().capacity(c)
	c.M5997 = [-1,-1]
	c.M5906[6] = vb_date * 10000
	c.M5914[0] = -1
	c.M5914[1] = -1
	initial_stat_ad(c)
	c.M5970 = next_experience(c,catalog.tables.guilds[0].raw,catalog.tables.races[c.M5821].raw)
	if not error.is_empty(): return {}
	for index in 10: c.M59B0[index] = -1
	for index in 4:
		c.M58CB[index].M548B = " "
		c.M58CB[index].M4ED4 = -1
		c.M58CB[index].M57D4 = -1
	return c

# FRMCITYB.txtAmount_KeyPress. The recovered withdrawal branch accepts negative
# amounts. Retained explicitly; UI parsing and atomic overflow failure are new.
func bank_transfer(character: Dictionary, amount: int, deposit: bool) -> bool:
	error = ""
	if amount == 0:
		error = "Enter a nonzero amount."
		return false
	if deposit and (amount <= 0 or amount > character.M4F2D):
		error = "You cannot deposit that amount."
		return false
	if not deposit and (amount > character.M58AF or character.M58AF < 0):
		error = "You cannot withdraw that amount."
		return false
	var money = Money.new()
	var bank = money.add(character.M58AF,amount) if deposit else money.subtract(character.M58AF,amount)
	var carried = money.subtract(character.M4F2D,amount) if deposit else money.add(character.M4F2D,amount)
	if not money.error.is_empty():
		error = money.error
		return false
	character.M58AF = bank
	character.M4F2D = carried
	return true
