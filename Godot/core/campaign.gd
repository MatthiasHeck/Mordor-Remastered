extends RefCounted
## Separate working MDATA4 file, retaining the VB layout and untouched bytes.
## This transactional adapter is new code, not a claim of fn04ED behavior parity.
const Records = preload("res://core/record_file.gd")
const Codec = preload("res://core/vb_record.gd")
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
const GuildLog = preload("res://core/guild_log.gd")
const Guild = preload("res://core/guild_rules.gd")
const Transaction = preload("res://core/save_transaction.gd")
const Automap = preload("res://core/automap.gd")
const Dungeon = preload("res://core/dungeon_rules.gd")
const World = preload("res://core/world_encounters.gd")
const Generator = preload("res://core/encounter_generator.gd")
const Battle = preload("res://core/battle_rules.gd")
const Rng = preload("res://core/vb_rng.gd")
const SIZE = 2900
const PAYLOAD = 2887
var catalog
var records
var characters: Array = []
var path: String
var error: String = ""
var existed: bool = false
var loaded: bool = false
var baseline = PackedByteArray()
var guild_log = GuildLog.new()
var log_baseline = PackedByteArray()
var log_existed = false
var transaction = Transaction.new()
var automap = Automap.new()
var map_baseline = PackedByteArray()
var map_existed = false
var dungeon_messages: Array = []
var world
var world_baseline = PackedByteArray()
var world_existed = false
var combat_state: Dictionary
var combat_baseline = PackedByteArray()
var combat_existed = false
var last_battle: Dictionary = {}

func open(directory: String, original_catalog) -> bool:
	error = ""
	loaded = false
	dungeon_messages.clear()
	characters.clear()
	catalog = original_catalog
	path = ProjectSettings.globalize_path(directory).simplify_path().path_join("MDATA4.MDR")
	# Source inputs are never a legal save destination, including CLI overrides.
	var manifest = JSON.parse_string(FileAccess.get_file_as_string("res://data/manifest.json"))
	for protected in [ProjectSettings.globalize_path("res://data"),manifest.source_installation.get_base_dir()]:
		var root_path = String(protected).replace("\\","/").simplify_path().to_lower().trim_suffix("/")
		var candidate = path.replace("\\","/").to_lower()
		if candidate == root_path or candidate.begins_with(root_path + "/"):
			error = "The original evidence directory cannot be used for saves."
			return false
	if not transaction.recover(path.get_base_dir()):
		error = transaction.error
		return false
	existed = FileAccess.file_exists(path)
	var source = path if existed else path + ".bak" if FileAccess.file_exists(path + ".bak") else "res://data/original/MDATA4.MDR"
	var input = FileAccess.open(source,FileAccess.READ)
	if input == null:
		error = "Cannot read character file: " + source
		return false
	baseline = input.get_buffer(input.get_length())
	input.close()
	records = Records.new(baseline,SIZE,catalog.schemas)
	if not scan(): return false
	var log_path = path.get_base_dir().path_join("MDATA9.MDR")
	log_existed = FileAccess.file_exists(log_path)
	var log_source = log_path if log_existed else log_path + ".bak" if FileAccess.file_exists(log_path + ".bak") else "res://data/original/MDATA9.MDR"
	var log_input = FileAccess.open(log_source,FileAccess.READ)
	if log_input == null:
		error = "Cannot read guild log."
		return false
	log_baseline = log_input.get_buffer(log_input.get_length())
	log_input.close()
	if not guild_log.load_bytes(log_baseline):
		error = guild_log.error
		return false
	var map_path = path.get_base_dir().path_join("MDATA8.MDR")
	map_existed = FileAccess.file_exists(map_path)
	var map_source = map_path if map_existed else map_path + ".bak" if FileAccess.file_exists(map_path + ".bak") else "res://data/original/MDATA8.MDR"
	var map_input = FileAccess.open(map_source,FileAccess.READ)
	if map_input == null:
		error = "Cannot read automap."
		return false
	map_baseline = map_input.get_buffer(map_input.get_length())
	map_input.close()
	loaded = automap.load_bytes(map_baseline)
	if not loaded: error = automap.error
	if not loaded: return false
	var world_path = path.get_base_dir().path_join("MDATA10.MDR")
	world_existed = FileAccess.file_exists(world_path)
	world_baseline = FileAccess.get_file_as_bytes(world_path if world_existed else "res://data/original/MDATA10.MDR")
	world = World.new(catalog)
	if not world.load_bytes(world_baseline):
		error = world.error
		loaded = false
		return false
	var combat_path = path.get_base_dir().path_join("combat-state.json")
	combat_existed = FileAccess.file_exists(combat_path)
	if world_existed != combat_existed:
		error = "Encounter file and combat state must be present together. Reopen to recover an interrupted transaction."
		loaded = false
		return false
	combat_baseline = FileAccess.get_file_as_bytes(combat_path) if combat_existed else PackedByteArray()
	combat_state = {"format":1,"rng":{"state":0x50000,"draws":0},"rooms":[],"elapsed":0,"recovered":{}}
	if combat_existed:
		var saved = JSON.parse_string(combat_baseline.get_string_from_utf8())
		if not valid_combat_state(saved):
			error = "Invalid combat state; the campaign was not changed."
			loaded = false
			return false
		combat_state = saved
	return loaded

static func valid_combat_state(value) -> bool:
	if not value is Dictionary or value.get("format") != 1 or not value.get("rng") is Dictionary or not value.get("rooms") is Array or not value.get("recovered") is Dictionary: return false
	if not value.rng.get("state") is float and not value.rng.get("state") is int: return false
	if not value.rng.get("draws") is float and not value.rng.get("draws") is int: return false
	if value.rng.state != floor(value.rng.state) or value.rng.state < 0 or value.rng.state > Rng.MASK or value.rng.draws != floor(value.rng.draws) or value.rng.draws < 0 or value.rng.draws > 9007199254740991: return false
	if not value.get("elapsed") is float and not value.get("elapsed") is int: return false
	if value.elapsed != floor(value.elapsed) or value.elapsed < 0 or value.elapsed > 9007199254740991: return false
	if value.rooms.size() > 3000: return false
	var seen = {}
	for key in value.rooms:
		if not key is String or not valid_room_key(key): return false
		if seen.has(key): return false
		seen[key] = true
	for key in value.recovered:
		if not key is String or not valid_room_key(key) or not value.recovered[key] is String or not value.recovered[key].is_valid_int(): return false
		var amount = value.recovered[key].to_int()
		if amount < 0 or str(amount) != value.recovered[key]: return false
	return true

static func valid_room_key(key: String) -> bool:
	var parts = key.split(":")
	return parts.size() == 2 and parts[0].is_valid_int() and parts[1].is_valid_int() and key == "%d:%d" % [parts[0].to_int(),parts[1].to_int()] and World.first_record(parts[0].to_int(),parts[1].to_int()) > 0

static func room_key(c: Dictionary) -> String: return "%d:%d" % [c.M5470,c.M59BB]

func character_at(slot: int) -> Dictionary:
	for row in characters:
		if row.record_index == slot: return row.raw
	return {}

func encounter(c: Dictionary) -> Dictionary:
	if c.is_empty() or c.M5470 <= 0 or c.M59BB <= 0: return {}
	return world.room(c.M5470,c.M59BB)

func prepare_room(c: Dictionary, next_world, state: Dictionary, rng) -> bool:
	if c.M5470 <= 0 or c.M59BB <= 0: return true
	var key = room_key(c)
	if key in state.rooms: return true
	var room = next_world.room(c.M5470,c.M59BB)
	if room.is_empty():
		error = next_world.error
		return false
	if Battle.active_group(room.groups) < 0 and room.meta.M4F2D == 0 and room.groups[0].M4ED4 != -1:
		var generator = Generator.new(catalog)
		room = generator.generate(c,rng,state.elapsed)
		if room.is_empty():
			error = generator.error
			return false
		if not next_world.put(c.M5470,c.M59BB,room):
			error = next_world.error
			return false
	state.rooms.append(key)
	state.rng = rng.save_state()
	return true

func resume_combat(slot: int) -> bool:
	var c = character_at(slot)
	if c.is_empty() or not loaded:
		error = "Choose a valid campaign character."
		return false
	if c.M5470 <= 0 or c.M59BB <= 0 or room_key(c) in combat_state.rooms: return true
	var state = combat_state.duplicate(true)
	var next_world = world.copy()
	var rng = Rng.new(int(state.rng.state),int(state.rng.draws))
	if not prepare_room(c,next_world,state,rng): return false
	return commit(records,null,null,next_world,state)

static func name_of(value) -> String:
	if value is String: return value.strip_edges()
	if value is PackedByteArray:
		for byte in value:
			if byte != 0 and byte != 32: return "<invalid name>"
	return ""

func scan() -> bool:
	characters.clear()
	if records.bytes.size() < SIZE + 2 or records.record(1).vb_string() != "1.1":
		error = "Character file has a missing or unsupported header."
		return false
	var expected = records.record(2).i16()
	if expected < 0 or records.bytes.size() > 32767 * SIZE:
		error = "Invalid character count or file size."
		return false
	var slot = 3
	# The original count is authoritative. The supplied count-zero file still
	# contains a named BONK record; fn04B9/04CD ignore it and fn04ED replaces it.
	while characters.size() < expected and (slot - 1) * SIZE < records.bytes.size():
		var raw = records.read_type(slot,"T5810")
		if not records.error.is_empty():
			error = records.error
			return false
		var name = name_of(raw.M548B)
		if not name.is_empty():
			if name == "<invalid name>" or raw.M5821 < 0 or raw.M5821 >= catalog.tables.races.size() or raw.M58BB < 0 or raw.M58BB >= catalog.tables.guilds.size():
				error = "Invalid character fields in record %d." % slot
				return false
			raw.M5962 = slot # Original fn04CD assigns physical location when loading.
			characters.append({"record_index":slot,"name":name,"raw":raw})
		slot += 1
	if expected != characters.size():
		error = "Character count mismatch: header %d, records %d. Save was not changed." % [expected,characters.size()]
		return false
	return true

func validate_text(text: String, maximum: int, field: String) -> bool:
	var codec = Codec.new()
	var bytes = codec.encode_text(text)
	if not codec.error.is_empty() or bytes.size() > maximum:
		error = "%s must fit %d Windows-1252 characters. %s" % [field,maximum,codec.error]
		return false
	for byte in bytes:
		if byte < 32:
			error = field + " cannot contain control characters."
			return false
	return true

func create_character(state: Dictionary, requested_name: String, sex: int, password: String, vb_date: int) -> bool:
	error = ""
	if not loaded:
		error = "Open a valid campaign before creating a character."
		return false
	var name = requested_name.strip_edges()
	if name.is_empty() or "|" in name or '"' in name:
		error = "Enter a name without quotation marks or |."
		return false
	if not validate_text(name,30,"Name") or not validate_text(password,10,"Password"): return false
	for row in characters:
		if row.name.nocasecmp_to(name) == 0:
			error = "That character name already exists."
			return false
	if not sex in [0,1] or not state.has_all(["M5821","M4EBF","M55B5","points"]) or state.M5821 < 0 or state.M5821 >= catalog.tables.races.size():
		error = "Choose a valid race, sex, and alignment."
		return false
	var race = catalog.tables.races[state.M5821].raw
	var pool = int(race.M556D) + 30
	if not Rules.has_flag(state.M4EBF,race.M5557) or state.M55B5.size() != 7 or state.points < 0:
		error = "Invalid creation state."
		return false
	for index in 6:
		if not state.M55B5[index] is int or state.M55B5[index] < race.M5530[index] or state.M55B5[index] > race.M553C[index]:
			error = "A statistic is outside its racial limits."
			return false
		pool -= state.M55B5[index] - race.M5530[index]
	if pool != state.points or state.M55B5[6] != 0:
		error = "Character allocation does not balance."
		return false
	var town = Town.new()
	var raw = town.new_character(state,name,sex,password,catalog,vb_date)
	if not town.error.is_empty():
		error = town.error
		return false
	var next = Records.new(records.bytes,SIZE,catalog.schemas)
	var slot = 3
	var used = {}
	for row in characters: used[row.record_index] = true
	while used.has(slot): slot += 1
	if slot > 32767:
		error = "Character file is full."
		return false
	var required = (slot - 1) * SIZE + PAYLOAD
	if next.bytes.size() < required: next.bytes.resize(required)
	raw.M5962 = slot
	if not next.replace_type(slot,"T5810",raw):
		error = next.error
		return false
	next.bytes.encode_s16(SIZE,characters.size() + 1)
	var next_log = GuildLog.new()
	if not next_log.load_bytes(guild_log.bytes) or not next_log.append(0,vb_date,'"' + name + '" joined our guild.'):
		error = next_log.error
		return false
	return commit(next,next_log)

func update_character(slot: int, raw: Dictionary, next_log = null, next_map = null, next_world = null, next_combat = null) -> bool:
	error = ""
	if not loaded:
		error = "Open a valid campaign before updating a character."
		return false
	var found = false
	for row in characters:
		if row.record_index == slot: found = true
	if not found or raw.M5962 != slot:
		error = "Unknown character record."
		return false
	var next = Records.new(records.bytes,SIZE,catalog.schemas)
	if not next.replace_type(slot,"T5810",raw):
		error = next.error
		return false
	return commit(next,next_log,next_map,next_world,next_combat)

func join_guild(slot: int, target: int, vb_date: int) -> bool:
	error = ""
	if not loaded:
		error = "Open a valid campaign before joining a guild."
		return false
	var character = {}
	for row in characters:
		if row.record_index == slot: character = row.raw
	if character.is_empty():
		error = "Unknown character record."
		return false
	var rules = Guild.new(catalog)
	var result = rules.join(character,target)
	if result.is_empty():
		error = rules.error
		return false
	var next_log = null
	if result.new_member:
		next_log = GuildLog.new()
		if not next_log.load_bytes(guild_log.bytes) or not next_log.append(target,vb_date,'"' + name_of(character.M548B) + '" joined our guild.'):
			error = next_log.error
			return false
	return update_character(slot,result.character,next_log)

func dungeon_action(slot: int, action: String, vb_date: int) -> bool:
	error = ""
	dungeon_messages.clear()
	if not loaded:
		error = "Open a valid campaign before exploring."
		return false
	var character = {}
	for row in characters:
		if row.record_index == slot: character = row.raw
	if character.is_empty():
		error = "Unknown character record."
		return false
	var rules = Dungeon.new(catalog)
	var result = rules.act(character,automap,action)
	if result.is_empty():
		error = rules.error
		return false
	var next_world = world.copy()
	var state = combat_state.duplicate(true)
	var rng = Rng.new(int(state.rng.state),int(state.rng.draws))
	# Crossing an area/floor exposes the character to the recovered exit attacks.
	if character.M5470 > 0 and character.M59BB > 0 and (character.M5470 != result.character.M5470 or character.M59BB != result.character.M59BB):
		var old_room = encounter(character)
		if not old_room.is_empty() and Battle.active_group(old_room.groups) >= 0 and old_room.groups[0].M4ECC == 1:
			var battle = Battle.new(catalog)
			var escape = battle.round_action(character,old_room,"escape",-1,-1,rng)
			if escape.is_empty():
				error = battle.error
				return false
			var old_key = room_key(character)
			var currency = preload("res://core/currency.gd").new()
			state.recovered[old_key] = str(currency.add(state.recovered.get(old_key,"0").to_int(),escape.recovered_gold))
			if not currency.error.is_empty():
				error = currency.error
				return false
			if not settle_victory(escape,character,old_room,state,next_world): return false
			if not next_world.put(character.M5470,character.M59BB,{"groups":escape.groups,"meta":escape.meta}):
				error = next_world.error
				return false
			result.messages.append_array(escape.messages)
			if escape.outcome == "defeat":
				result.character = escape.character
				result.automap = automap.copy()
				result.new_depths.clear()
			else:
				# Keep dungeon destination and flags, but retain damage/ailments/items.
				for field in ["M5470","M583F","M5845","M5899","M59BB","M59F4","M591F","M592F"]: escape.character[field] = result.character[field]
				preload("res://core/equipment.gd").new(catalog).refresh_effects(escape.character)
				result.character = escape.character
	if result.character.M5483 == 0 and not prepare_room(result.character,next_world,state,rng): return false
	state.rng = rng.save_state()
	var next_log = null
	if not result.new_depths.is_empty():
		next_log = GuildLog.new()
		if not next_log.load_bytes(guild_log.bytes):
			error = next_log.error
			return false
		for depth in result.new_depths:
			if not next_log.append(character.M58BB,vb_date,'"' + name_of(character.M548B) + '" was the first to go to level ' + str(depth) + '.'):
				error = next_log.error
				return false
	if result.character.M5483 != 0:
		next_log = death_log(result.character,vb_date)
		if next_log == null: return false
	if not update_character(slot,result.character,next_log,result.automap,next_world,state): return false
	dungeon_messages = result.messages
	return true

func commit(next, next_log = null, next_map = null, next_world = null, next_combat = null) -> bool:
	# Validate the candidate before disk I/O. Roll back in-memory state on failure.
	var previous = records
	records = next
	if not scan():
		var failure = error
		records = previous
		scan()
		error = failure
		return false
	records = previous
	scan()
	var changes = [{"name":"MDATA4.MDR","bytes":next.bytes,"baseline":baseline,"existed":existed}]
	if next_map != null:
		changes.append({"name":"MDATA8.MDR","bytes":next_map.bytes,"baseline":map_baseline,"existed":map_existed})
	if next_log != null:
		changes.append({"name":"MDATA9.MDR","bytes":next_log.bytes,"baseline":log_baseline,"existed":log_existed})
	if next_world != null:
		changes.append({"name":"MDATA10.MDR","bytes":next_world.records.bytes,"baseline":world_baseline,"existed":world_existed})
	var combat_bytes = PackedByteArray()
	if next_combat != null:
		if not valid_combat_state(next_combat):
			error = "Invalid candidate combat state."
			return false
		combat_bytes = (JSON.stringify(next_combat,"\t") + "\n").to_utf8_buffer()
		changes.append({"name":"combat-state.json","bytes":combat_bytes,"baseline":combat_baseline,"existed":combat_existed})
	if not transaction.commit(path.get_base_dir(),changes):
		error = transaction.error
		if FileAccess.file_exists(path.get_base_dir().path_join(Transaction.JOURNAL)): loaded = false
		return false
	existed = true
	baseline = next.bytes.duplicate()
	records = next
	if next_map != null:
		automap = next_map
		map_baseline = next_map.bytes.duplicate()
		map_existed = true
	if next_log != null:
		guild_log = next_log
		log_baseline = next_log.bytes.duplicate()
		log_existed = true
	if next_world != null:
		world = next_world
		world_baseline = next_world.records.bytes.duplicate()
		world_existed = true
	if next_combat != null:
		combat_state = next_combat
		combat_baseline = combat_bytes
		combat_existed = true
	return scan()

func death_log(c: Dictionary, vb_date: int):
	var next_log = GuildLog.new()
	var where = " on level %d." % c.M5470 if c.M59F4[0] == 0 else " somewhere in dungeon."
	if not next_log.load_bytes(guild_log.bytes) or not next_log.append(c.M58BB,vb_date,'"' + name_of(c.M548B) + '" died' + where):
		error = next_log.error
		return null
	return next_log

func combat_tick(slot: int, command: String, target: int, spell: int, vb_date: int) -> bool:
	error = ""
	last_battle = {}
	if not loaded: return false
	var c = character_at(slot)
	var room = encounter(c)
	if room.is_empty() or c.M5483 != 0:
		error = "No living character in an encounter room."
		return false
	var state = combat_state.duplicate(true)
	var rng = Rng.new(int(state.rng.state),int(state.rng.draws))
	var battle = Battle.new(catalog)
	var result = battle.round_action(c,room,command,target,spell,rng)
	if result.is_empty():
		error = battle.error
		return false
	state.elapsed += 1
	if int(state.elapsed) % 4 == 0 and result.character.M5483 == 0:
		var ailments = battle.ailments(result.character,result.groups,rng)
		if ailments.is_empty():
			error = battle.error
			return false
		result.character = ailments.character
		result.messages.append_array(ailments.messages)
		if result.character.M4EAC <= 0:
			if not battle.record_death(result.character,1):
				error = battle.error
				return false
			result.messages.append("You died from your ailments.")
			result.outcome = "defeat"
	var key = room_key(c)
	var money = preload("res://core/currency.gd").new()
	state.recovered[key] = str(money.add(state.recovered.get(key,"0").to_int(),result.recovered_gold))
	if not money.error.is_empty():
		error = money.error
		return false
	var next_world = world.copy()
	if not settle_victory(result,c,room,state,next_world): return false
	if not next_world.put(c.M5470,c.M59BB,{"groups":result.groups,"meta":result.meta}):
		error = next_world.error
		return false
	state.rng = rng.save_state()
	var next_log = death_log(result.character,vb_date) if result.outcome == "defeat" else null
	if result.outcome == "defeat" and next_log == null: return false
	if not update_character(slot,result.character,next_log,null,next_world,state): return false
	last_battle = result
	return true

func settle_victory(result: Dictionary, c: Dictionary, prior: Dictionary, state: Dictionary, next_world) -> bool:
	if result.outcome != "victory": return true
	if Battle.active_group(prior.groups) >= 0:
		result.groups[0].M4ED4 = -1
		result.groups[0].M4EF9 = 0
		result.groups[0].M4EE6 = preload("res://core/vb_numeric.gd").single(state.elapsed)
		if not next_world.cleared(c.M5470):
			error = next_world.error
			return false
	# Source auto-collects loose gold; chest gold awaits chest handling.
	var key = room_key(c)
	if result.meta.M4F1B == 0 and (result.meta.M4F2D > 0 or state.recovered.get(key,"0") != "0"):
		var numeric = preload("res://core/vb_numeric.gd").new()
		var gold = numeric.long_integer(result.meta.M4F2D / 10000.0)
		gold = numeric.long_integer(gold * 0.5 + state.recovered.get(key,"0").to_int() / 10000.0)
		if not numeric.error.is_empty():
			error = numeric.error
			return false
		var money = preload("res://core/currency.gd").new()
		result.character.M4F2D = money.add(result.character.M4F2D,gold * 10000)
		if not money.error.is_empty():
			error = money.error
			return false
		result.meta.M4F2D = 0
		state.recovered[key] = "0"
		result.messages.append("You found %d gold." % gold)
	return true
