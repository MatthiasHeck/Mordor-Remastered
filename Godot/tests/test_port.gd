extends SceneTree
const Catalog = preload("res://core/original_data.gd")
const Codec = preload("res://core/vb_record.gd")
const Records = preload("res://core/record_file.gd")
const Numeric = preload("res://core/vb_numeric.gd")
const Rules = preload("res://core/original_rules.gd")
const Tape = preload("res://core/draw_tape.gd")
const Audio = preload("res://core/original_audio.gd")
var checks: int = 0
var failures: Array = []
var data = Catalog.new()
const STATS = ["strength","intelligence","wisdom","constitution","charisma","dexterity","unused_7"]
const RESISTS = ["fire","cold","electrical","mind","disease","poison","magic","stone","paralysis","drain","acid","unused_12"]

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		if failures.size() < 50: printerr(message)
		failures.append(message)

func csv_rows(name: String) -> Array:
	var file = FileAccess.open("res://tests/reference/" + name + "-local.csv", FileAccess.READ)
	if file == null:
		check(false, "Missing fixture " + name)
		return []
	var headers = file.get_csv_line()
	var rows = []
	while not file.eof_reached():
		var values = file.get_csv_line()
		if values.size() != headers.size(): continue
		var row = {}
		for index in headers.size(): row[headers[index]] = values[index]
		rows.append(row)
	return rows

func fields_match(raw: Dictionary, expected: Dictionary, mapping: Dictionary, context: String):
	for symbol in mapping:
		var expected_value = expected[mapping[symbol]]
		var actual = raw[symbol]
		if actual is String: check(actual == expected_value, context + "." + symbol)
		elif actual is float: check(is_equal_approx(actual, float(expected_value)), context + "." + symbol)
		else: check(actual == int(expected_value), context + "." + symbol)

func array_matches(raw: Dictionary, symbol: String, expected: Dictionary, prefix: String, labels: Array, context: String):
	for index in labels.size(): check(raw[symbol][index] == int(expected[prefix + labels[index]]), context + "." + symbol + "[%d]" % index)

func _initialize():
	check(data.load_all(), "Load originals: " + data.error)
	if not data.error.is_empty():
		quit(1)
		return
	check(data.schemas.size() == 55, "55 original UDT schemas")
	var counts = {"races":9, "guilds":12, "spells":105, "items":366, "monsters":401}
	for key in counts: check(data.tables[key].size() == counts[key], key + " count")
	check(data.floors.size() == 15, "15 floors")
	check(data.tables.library.monsters.size() == 401, "Library monster allocation")
	check(data.tables.library.items.size() == 366, "Library item allocation")
	check(data.tables.hall.size() == 13, "Hall allocation")
	check_definitions()
	check_items()
	check_monsters()
	check_spells()
	check_dungeon()
	check_binary_roundtrip()
	check_numeric_rules()
	check_audio()
	var report = {"checks":checks, "failures":failures, "typed_records_round_tripped":data.spans.size(),
		"original_game_executed":false, "runtime_parity_verified":false,
		"scope":"Independent CSV comparison, binary record round trips, candidate rule contracts"}
	var result = FileAccess.open("res://tests/results.json", FileAccess.WRITE)
	result.store_string(JSON.stringify(report, "\t") + "\n")
	print("PASS" if failures.is_empty() else "FAIL", ": ", checks, " checks; ", failures.size(), " failures; ", data.spans.size(), " original records round-tripped")
	quit(0 if failures.is_empty() else 1)

func check_definitions():
	var races = csv_rows("races")
	for index in races.size():
		var raw = data.tables.races[index].raw
		var expected = races[index]
		fields_match(raw, expected, {"M548B":"name","M5557":"alignment_mask_raw","M5565":"size_raw","M556D":"bonus_points","M5577":"max_age","M557E":"experience_parameter"}, "race %d" % index)
		array_matches(raw,"M5530",expected,"min_",STATS,"race")
		array_matches(raw,"M553C",expected,"max_",STATS,"race")
		array_matches(raw,"M5548",expected,"resistance_",RESISTS,"race")
	var guilds = csv_rows("guilds")
	for index in guilds.size():
		var raw = data.tables.guilds[index].raw
		var expected = guilds[index]
		fields_match(raw, expected, {"M548B":"name","M5591":"average_hp","M559A":"hp_breakpoint","M55A4":"post_breakpoint_hp","M557E":"experience_parameter","M5557":"alignment_mask_raw","M5604":"race_mask_raw","M55E6":"quest_parameter","M55AD":"M55AD_raw","M55CB":"M55CB_raw","M55D8":"M55D8_raw","M4F2D":"M4F2D_raw","M560D":"M560D_raw","M4E97":"M4E97_raw","M4EA1":"M4EA1_raw","M561A":"M561A_raw","M5626":"M5626_raw","M5631":"M5631_raw","M563F":"M563F_raw"}, "guild")
		array_matches(raw,"M55B5",expected,"required_",STATS,"guild")
		for ability in 7: check(is_equal_approx(raw.M55BE[ability], float(expected["ability_%d_raw" % ability])), "guild ability")
		for column in 2:
			for category in 19:
				check(is_equal_approx(raw.M55F6[column * 19 + category], float(expected["spell_category_%d_column_%d" % [category,column]])), "VB column-major guild spell matrix")
	for pair in [["item_subtypes","item-subtypes","M54D5","parent_class_raw"],["item_classes","item-classes","M54F1","equippable_raw"],["monster_types","monster-types","M550A","unused_raw"],["monster_subtypes","monster-subtypes","M4E78","parent_type_raw"]]:
		var rows = csv_rows(pair[1])
		check(rows.size() == data.tables[pair[0]].size(), pair[0] + " count")
		for index in rows.size(): fields_match(data.tables[pair[0]][index].raw, rows[index], {"M548B":"name", pair[2]:pair[3]}, pair[0])

func check_items():
	var rows = csv_rows("items")
	for index in rows.size():
		var raw = data.tables.items[index].raw
		var expected = rows[index]
		fields_match(raw,expected,{"M548B":"name","M5467":"item_id","M4E97":"attack","M4EA1":"defense","M5686":"base_price","M5693":"first_level","M56A0":"rarity_raw","M55BE":"ability_flags_raw","M56AF":"extra_swings","M56B9":"special_type_raw","M56C4":"spell_index","M56CD":"spell_id","M56DB":"charges_candidate","M4ED4":"deleted_candidate","M56E6":"guild_flags_raw","M560D":"level_scale_raw","M56F7":"damage_modifier","M5557":"alignment_flags_raw","M5700":"hands","M5709":"type_raw","M5548":"resistance_flags_raw","M572A":"cursed_raw","M5734":"spell_level","M5742":"class_restricted_raw"},"item %d" % index)
		array_matches(raw,"M5712",expected,"required_",STATS,"item")
		array_matches(raw,"M571E",expected,"modifier_",STATS,"item")

func check_monsters():
	var rows = csv_rows("monsters")
	var ids = {}
	for index in rows.size():
		var raw = data.tables.monsters[index].raw
		var expected = rows[index]
		fields_match(raw,expected,{"M548B":"name","M4E97":"attack","M4EA1":"defense","M5467":"monster_id","M4EAC":"average_hits","M5A0E":"group_count","M5A1B":"picture_id","M5A26":"locked_chest_chance","M5693":"first_level","M55BE":"property_flags_raw","M5A35":"attack_flags_raw","M5A40":"spell_flags_raw","M56A0":"spawn_chance","M4EBF":"alignment","M5A57":"members_per_group","M5A64":"gold_factor","M5A70":"trap_flags_raw","M5A7C":"guild_level","M4ED4":"type_raw","M56F7":"damage_modifier","M5A89":"companion_type_raw","M5A96":"companion_spawn_mode_raw","M5AAA":"companion_id","M5ACF":"subtype_raw","M5ADA":"companion_subtype_raw","M5565":"size_raw","M560D":"item_drop_level","M5AEE":"item_chance"},"monster %d" % index)
		array_matches(raw,"M5548",expected,"resistance_",RESISTS,"monster")
		array_matches(raw,"M55B5",expected,"stat_",STATS,"monster")
		array_matches(raw,"M5A4A",expected,"chest_chance_",["1","2","3","unused_4"],"monster")
		for item in 11: check(raw.M5AC3[item] == int(expected["item_%d" % (item+1)]), "monster item slot")
		ids[raw.M5467] = int(ids.get(raw.M5467,0)) + 1
	check(ids[307] == 2, "Duplicate monster ID 307 retained")

func check_spells():
	var rows = csv_rows("spells")
	for index in rows.size():
		var raw = data.tables.spells[index].raw
		fields_match(raw,rows[index],{"M548B":"name","M5467":"spell_id","M5709":"category","M4E82":"base_level","M556D":"M556D_raw","M5B0A":"M5B0A_raw","M5B12":"M5B12_raw","M5B1D":"monsters_parameter","M5B28":"groups_parameter","M5B33":"power_base","M5B41":"power_modifier","M56B9":"special_effect_raw","M5B5B":"resisted_by_raw"},"spell")
		array_matches(raw,"M5B4F",rows[index],"required_",STATS,"spell")

func check_dungeon():
	var cells = csv_rows("dungeon-cells")
	check(cells.size() == 13500,"All 13,500 cells")
	for row in cells:
		var cell = data.cell(int(row.floor),int(row.x_candidate),int(row.y_candidate))
		check(cell.flags == int(row.flags_integer),"Cell flags")
		check(cell.area == int(row.area_id),"Cell area")
		check(cell.raw.M5D2C == int(row.flags_currency_raw),"Raw terrain Currency")
	for row in csv_rows("dungeon-floors"):
		fields_match(data.floors[int(row.table_floor)-1].header,row,{"M420C":"width","M4216":"height","M4E82":"stored_floor","M5CF4":"area_count","M5D01":"chute_count","M5D0E":"teleporter_count"},"floor header")
	for row in csv_rows("dungeon-areas"):
		fields_match(data.floors[int(row.floor)-1].areas[int(row.area_index)],row,{"M5D45":"spawn_mask_raw","M5D55":"lair_id_raw"},"area slot")
	for row in csv_rows("dungeon-teleporters"):
		fields_match(data.floors[int(row.floor)-1].teleporters[int(row.slot)],row,{"M5D74":"x","M5D7E":"y","M5D88":"destination_x","M5D90":"destination_y","M5D98":"destination_floor"},"teleporter slot")
	for row in csv_rows("dungeon-chutes"):
		fields_match(data.floors[int(row.floor)-1].chutes[int(row.slot)],row,{"M5D74":"x","M5D7E":"y","M5DB1":"depth"},"chute slot")
	var unmatched = []
	for level in data.floors:
		for y in range(1,level.height+1):
			for x in range(1,level.width+1):
				if not Rules.has_flag(14,data.cell(level.floor,x,y).flags): continue
				var matched = false
				for slot in level.teleporters:
					if slot.M5D74 == x and slot.M5D7E == y: matched = true
				if not matched: unmatched.append([level.floor,x,y])
	check(unmatched == [[8,5,6],[8,6,6]],"Unmatched teleporter cells preserved, not repaired")

func check_binary_roundtrip():
	var before = {}
	for name in data.files: before[name] = data.files[name].bytes.duplicate()
	for span in data.spans:
		check(data.files[span.file].replace_type(span.record,span.type,span.value),"Encode " + span.file + ": " + data.files[span.file].error)
	for name in data.files: check(data.files[name].bytes == before[name],"Whole-file byte-for-byte preservation: " + name)
	# Exercise every declared type, including all character and nested unused slots.
	for type_name in data.schemas:
		var writer = Codec.new(PackedByteArray(),data.schemas)
		var blank = writer.blank(type_name)
		writer.write_type(type_name,blank)
		check(writer.error.is_empty(),"Encode schema " + type_name)
		var reader = Codec.new(writer.data,data.schemas)
		check(reader.read_type(type_name) == blank,"Nested schema roundtrip " + type_name)
	var cp = Codec.new()
	var every_byte = PackedByteArray()
	for index in 256: every_byte.append(index)
	check(cp.encode_text(cp.decode_text(every_byte)) == every_byte,"All Windows-1252 bytes roundtrip")
	var truncated = Codec.new(PackedByteArray([4,0,65]),data.schemas)
	truncated.vb_string()
	check(not truncated.error.is_empty(),"Truncated string rejected")
	var large = Codec.new(PackedByteArray(),data.schemas)
	large.write_field({"name":"currency","type":"Currency"},9223372036854775807)
	large.cursor = 0
	check(large.currency() == 9223372036854775807,"Currency never passes through floating point")
	var file = data.files["MDATA3.MDR"]
	var bad = data.tables.items[0].raw.duplicate(true)
	bad.M4E97 = 32768
	check(not file.replace_type(4,"T567A",bad),"Reject overflowing edit")
	check(file.bytes == before["MDATA3.MDR"],"Failed edit leaves whole file untouched")
	file.error = ""

func check_numeric_rules():
	var numbers = Numeric.new()
	for pair in [[-2.5,-2],[-1.5,-2],[-0.5,0],[0.5,0],[1.5,2],[2.5,2]]:
		check(numbers.integer(pair[0]) == pair[1],"Candidate ties-to-even contract")
	numbers.integer(32767.5)
	check(not numbers.error.is_empty(),"Integer overflow contract")
	check(Numeric.single(16777217.0) == 16777216.0,"IEEE Single precision boundary")
	var rules = Rules.new()
	var hit = rules.damage(20,20,15,20,1.0,Tape.new([0.5,0.5,0.5,0.0]))
	check(not hit.has("error") and hit.damage > 0,"Candidate damage hit")
	var miss = rules.damage(20,20,15,20,1.0,Tape.new([0.5,0.5,0.5,0.49]))
	check(not miss.has("error") and miss.damage == 0 and miss.hit_roll == 50,"Hit boundary >= coefficient misses")
	check(miss.events.size() == 4,"Miss consumes all four draws")
	check(rules.damage(20,20,15,20,1.0,Tape.new([0.5])).has("error"),"No invented RNG draws on exhausted tape")
	check(rules.damage(20,20,-5,20,1.0,Tape.new()).has("error"),"Reject logarithm domain error")
	check(rules.damage(20,20,15,20,1.0,Tape.new([1.0,0.5,0.5,0.1])).has("error"),"Reject out-of-range RNG results")
	var race = data.tables.races[0].raw
	var state = Rules.creation_state(0,race)
	check(state.M55B5 == [9,9,9,11,10,11,0] and state.points == 5,"Human creation uses minima+5 and bonus 5")
	var budget = state.points
	for value in state.M55B5: budget += value
	for _index in 100: Rules.adjust_creation_stat(state,race,0,1)
	check(state.points == 0 and state.M55B5[0] == 14,"Creation stops at available points")
	for _index in 100: Rules.adjust_creation_stat(state,race,0,-1)
	check(state.M55B5[0] == race.M5530[0],"Creation cannot subtract below race minimum")
	var new_budget = state.points
	for value in state.M55B5: new_budget += value
	check(budget == new_budget,"Stat edits conserve point pool")
	var giant = Rules.creation_state(2,data.tables.races[2].raw)
	check(giant.alignments == [1],"Local Giant neutral-only alignment retained")
	check(Rules.cell_number(30,30,30) == 900,"One-based cell addressing")
	check(not Rules.guild_allows(data.tables.guilds[2].raw,giant),"Race/alignment rejection")
	var item = {"M5686":1000,"M572A":0,"M56DB":0,"M5709":0}
	var instance = {"M4EBF":0,"M4EEE":0,"M56DB":0,"M577E":0}
	check(rules.uncurse_price(item) == 1600,"Uncurse quote 1.6x base")
	check(rules.sell_price(item,instance,[0,1,0,0]) == rules.sell_price(item,instance,[1,0,0,0]),"Cross-alignment stock fallback")
	item.M572A = 1
	check(rules.sell_price(item,instance,[1,0,0,0]) == 0,"Identified inherently cursed item quote")
	rules.identify_price(item,instance,1)
	check(not rules.error.is_empty(),"Already identified item cannot divide by zero")

func check_audio():
	var decoder = Audio.new()
	var audio_manifest = JSON.parse_string(FileAccess.get_file_as_string("res://tests/reference/audio-manifest.json"))
	for entry in audio_manifest:
		if not entry.name.ends_with(".WAV"): continue
		var bytes = FileAccess.get_file_as_bytes("res://assets/audio/" + entry.name + ".bin")
		var stream = decoder.decode(bytes)
		check(stream != null,"Decode original audio " + entry.name + ": " + decoder.error)
		if stream == null: continue
		check(stream.mix_rate == int(entry.sample_rate),"Original sample rate")
		check(stream.stereo == (int(entry.channels) == 2),"Original channel count")
		check(stream.data.size() == int(entry.frames) * int(entry.channels) * int(entry.bits_per_sample) / 8,"Original PCM length")
		check(is_equal_approx(stream.get_length(),float(entry.duration_seconds)),"Original sample duration")
		# Reverse the signed/unsigned adaptation and compare every original sample.
		var pcm = stream.data
		if int(entry.bits_per_sample) == 8:
			for index in pcm.size(): pcm[index] = (int(pcm[index]) + 128) & 255
		var position = 12
		while position + 8 <= bytes.size():
			var length = bytes.decode_u32(position+4)
			if bytes.slice(position,position+4).get_string_from_ascii() == "data":
				check(pcm == bytes.slice(position+8,position+8+length),"Every PCM byte preserved: " + entry.name)
				break
			position += 8 + length + length % 2
	check(decoder.decode(PackedByteArray([0,1,2])) == null,"Malformed audio fails without looping")
