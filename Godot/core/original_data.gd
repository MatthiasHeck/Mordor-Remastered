extends RefCounted
## Native MDR readers. No CSV-to-game shortcuts. The original physical record
## index remains separate from logical IDs; duplicate IDs are never collapsed.
const Records = preload("res://core/record_file.gd")
const Codec = preload("res://core/vb_record.gd")

var schemas: Dictionary = {}
var tables: Dictionary = {}
var files: Dictionary = {}
var spans: Array = []
var floors: Array = []
var error: String = ""

func load_all(directory: String = "res://data/original") -> bool:
	schemas = JSON.parse_string(FileAccess.get_file_as_string("res://data/types.json"))
	tables.clear()
	files.clear()
	spans.clear()
	floors.clear()
	error = ""
	load_definitions(directory)
	load_table(directory, "spells", 2, 75, 2, 3, "T5AFD")
	load_table(directory, "items", 3, 125, 3, 4, "T567A")
	load_table(directory, "monsters", 5, 160, 3, 4, "T59FF")
	load_table(directory, "item_stock", 6, 16, 3, 4, "T5755")
	load_table(directory, "companion_stock", 15, 16, 3, 4, "T5755")
	load_guildmasters(directory)
	load_guild_log(directory)
	load_dungeon(directory)
	load_characters(directory)
	load_automap(directory)
	load_library(directory)
	load_hall(directory)
	return error.is_empty()

func open_records(directory: String, id: int, size: int):
	var name = "MDATA%d.MDR" % id
	var input = FileAccess.open(directory.path_join(name), FileAccess.READ)
	if input == null:
		fail("Cannot open %s (error %d)" % [name, FileAccess.get_open_error()])
		return null
	var result = Records.new(input.get_buffer(input.get_length()), size, schemas)
	files[name] = result
	return result

func fail(message: String) -> void:
	if error.is_empty(): error = message

func version_ok(file) -> bool:
	var header = file.record(1)
	var version = header.vb_string()
	if not header.error.is_empty() or version != "1.1":
		fail("Expected version 1.1 header; got '%s': %s" % [version, header.error])
		return false
	return true

func count_at(file, record_number: int, maximum: int = 32767) -> int:
	var reader = file.record(record_number)
	var count = reader.i16()
	if not reader.error.is_empty() or count < 0 or count > maximum:
		fail("Invalid count at record %d: %d %s" % [record_number, count, reader.error])
		return 0
	return count

func read(file_name: String, number: int, type_name: String) -> Dictionary:
	var value = files[file_name].read_type(number, type_name)
	if not files[file_name].error.is_empty():
		fail(file_name + ": " + files[file_name].error)
		return {}
	spans.append({"file":file_name, "record":number, "type":type_name, "value":value})
	return value

func entry(raw: Dictionary, number: int) -> Dictionary:
	var name = raw.get("M548B", "")
	return {"record_index": number, "name": name.strip_edges() if name is String else "<binary string>", "raw":raw}

func load_definitions(directory: String) -> void:
	var file = open_records(directory, 1, 260)
	if file == null or not version_ok(file): return
	var groups = ["races", "guilds", "item_subtypes", "item_classes", "monster_types", "monster_subtypes"]
	var types = ["T5524", "T5584", "T54C8", "T54E1", "T54FE", "T5515"]
	var position = 8
	for group in groups.size():
		var rows = []
		for index in count_at(file, group + 2, 500):
			var raw = read("MDATA1.MDR", position, types[group])
			position += 1
			if not error.is_empty(): return
			var row = entry(raw, index)
			rows.append(row)
		tables[groups[group]] = rows

func load_table(directory: String, key: String, id: int, size: int, count_record: int, start: int, type_name: String) -> void:
	var file = open_records(directory, id, size)
	if file == null or not version_ok(file): return
	var rows = []
	var count = count_at(file, count_record, 2000)
	for index in count:
		var raw = read("MDATA%d.MDR" % id, index + start, type_name)
		if not error.is_empty(): return
		rows.append(entry(raw, index + 1))
	tables[key] = rows

func load_dungeon(directory: String) -> void:
	var file = open_records(directory, 11, 20)
	if file == null: return
	for floor_index in count_at(file, 1, 100):
		var start = count_at(file, floor_index + 2)
		var header = read("MDATA11.MDR", start, "T5CE8")
		if not error.is_empty(): return
		var width = int(header.M420C)
		var height = int(header.M4216)
		if width < 1 or height < 1 or width * height > 10000:
			fail("Invalid dungeon dimensions")
			return
		var floor_data = {"floor":floor_index + 1, "width":width, "height":height, "header":header, "cells":[], "areas":[], "teleporters":[], "chutes":[]}
		var position = start + 1
		for index in width * height:
			var raw = read("MDATA11.MDR", position, "T5D20")
			position += 1
			if not error.is_empty(): return
			if raw.M5D2C % 10000 != 0:
				fail("Terrain Currency is not an integer mask")
				return
			@warning_ignore("integer_division")
			var flags = raw.M5D2C / 10000
			floor_data.cells.append({"area":raw.M547A, "flags":flags, "raw":raw})
		if count_at(file, position) != int(header.M5CF4): fail("Area count header mismatch")
		position += 1
		# Exactly 201 physical area slots, irrespective of active area count.
		for _index in 201:
			floor_data.areas.append(read("MDATA11.MDR", position, "T5D38"))
			position += 1
		if count_at(file, position) != int(header.M5D0E): fail("Teleporter count header mismatch")
		position += 1
		for _index in int(header.M5D0E):
			floor_data.teleporters.append(read("MDATA11.MDR", position, "T5D64"))
			position += 1
		if count_at(file, position) != int(header.M5D01): fail("Chute count header mismatch")
		position += 1
		for _index in int(header.M5D01):
			floor_data.chutes.append(read("MDATA11.MDR", position, "T5DA4"))
			position += 1
		if not error.is_empty(): return
		floors.append(floor_data)

func cell(floor_number: int, x: int, y: int) -> Dictionary:
	if floor_number < 1 or floor_number > floors.size(): return {}
	var level = floors[floor_number - 1]
	if x < 1 or y < 1 or x > level.width or y > level.height: return {}
	return level.cells[(y - 1) * level.width + x - 1]

func load_characters(directory: String) -> void:
	# Module2.fn04B9/04CD: active count skips blank character records.
	var file = open_records(directory, 4, 2900)
	if file == null or not version_ok(file): return
	var rows = []
	var count = count_at(file, 2, 10000)
	var position = 3
	while rows.size() < count and error.is_empty():
		var raw = read("MDATA4.MDR", position, "T5810")
		if not error.is_empty(): return
		if raw.M548B is String and not raw.M548B.strip_edges().is_empty(): rows.append(entry(raw, position))
		position += 1
	tables.characters = rows

func load_automap(directory: String) -> void:
	var file = open_records(directory, 8, 10)
	if file == null or not version_ok(file): return
	var deepest = count_at(file, 2, 15)
	var maps = []
	for level in 15:
		var flags = []
		for index in 900:
			var reader = file.record(3 + level * 900 + index)
			flags.append(reader.i32())
			if not reader.error.is_empty():
				fail("Automap: " + reader.error)
				return
		maps.append(flags)
	tables.automap = {"deepest_floor":deepest, "floors":maps}

func load_library(directory: String) -> void:
	var file = open_records(directory, 13, 100)
	if file == null or not version_ok(file): return
	var monster_count = count_at(file, 2, 2000)
	var item_count = count_at(file, 3, 2000)
	var library = {"monsters_found":count_at(file, 4), "items_found":count_at(file, 5), "monsters":[], "items":[]}
	for index in monster_count + item_count:
		var raw = read("MDATA13.MDR", index + 6, "T5BF1")
		if not error.is_empty(): return
		if index < monster_count: library.monsters.append(raw)
		else: library.items.append(raw)
	tables.library = library

func load_hall(directory: String) -> void:
	var file = open_records(directory, 14, 45)
	if file == null: return
	var rows = []
	for index in 13:
		var reader = file.record(index + 1)
		rows.append({"value_currency_raw":reader.currency(), "name":reader.vb_string(30), "date":reader.i32()})
		if not reader.error.is_empty():
			fail("Hall: " + reader.error)
			return
	tables.hall = rows

func load_guildmasters(directory: String) -> void:
	# Module1.fn03F4 / Module2.sub0565: version + one 128-byte record per guild.
	var file = open_records(directory, 7, 128)
	if file == null or not version_ok(file): return
	var rows = []
	for index in tables.get("guilds", []).size():
		var raw = read("MDATA7.MDR", index + 2, "T564C")
		if not error.is_empty(): return
		rows.append(entry(raw,index))
	tables.guildmasters = rows

func load_guild_log(directory: String) -> void:
	# CodeFiles/MLoader.cpp::loadGuildLogs. Sequential (not Random) records.
	var path = directory.path_join("MDATA9.MDR")
	var input = FileAccess.open(path,FileAccess.READ)
	if input == null:
		fail("Cannot open MDATA9.MDR")
		return
	var reader = Codec.new(input.get_buffer(input.get_length()),schemas)
	var count = reader.i16()
	if count < 0:
		fail("Invalid guild log count")
		return
	var rows = []
	for _index in count:
		rows.append({"guild_id":reader.i16(),"date":reader.i32(),"message":reader.vb_string()})
		if not reader.error.is_empty():
			fail("Guild log: " + reader.error)
			return
	tables.guild_log = rows
