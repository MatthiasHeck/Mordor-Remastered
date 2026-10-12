extends RefCounted
## VB3 UDT codec, based on POOP/main.txt and CodeFiles/RecordReader.h.
## Currency stays a signed int64 scaled by 10,000. No float/JSON conversion.
## Arrays retain all slots and use declaration order (first dimension fastest).

const CP1252 = [0x20ac,0x81,0x201a,0x192,0x201e,0x2026,0x2020,0x2021,
	0x2c6,0x2030,0x160,0x2039,0x152,0x8d,0x17d,0x8f,
	0x90,0x2018,0x2019,0x201c,0x201d,0x2022,0x2013,0x2014,
	0x2dc,0x2122,0x161,0x203a,0x153,0x9d,0x17e,0x178]

var data = PackedByteArray()
var cursor: int = 0
var error: String = ""
var schemas: Dictionary = {}

func _init(bytes: PackedByteArray = PackedByteArray(), type_schemas: Dictionary = {}):
	data = bytes.duplicate()
	schemas = type_schemas

func need(length: int) -> bool:
	if not error.is_empty():
		return false
	if length < 0 or cursor + length > data.size():
		error = "Truncated record at byte %d: need %d, have %d" % [cursor, length, data.size() - cursor]
		return false
	return true

func i16() -> int:
	if not need(2): return 0
	var result = data.decode_s16(cursor)
	cursor += 2
	return result

func i32() -> int:
	if not need(4): return 0
	var result = data.decode_s32(cursor)
	cursor += 4
	return result

func currency() -> int:
	if not need(8): return 0
	var result = data.decode_s64(cursor)
	cursor += 8
	return result

func single() -> float:
	if not need(4): return 0.0
	var result = data.decode_float(cursor)
	cursor += 4
	return result

func vb_string(length: int = -1):
	if length < 0:
		if not need(2): return ""
		length = data.decode_u16(cursor)
		cursor += 2
	if not need(length): return ""
	var result = decode_text(data.slice(cursor, cursor + length))
	cursor += length
	return result

static func decode_text(bytes: PackedByteArray):
	# Godot Strings cannot contain NUL. VB Strings can; retain binary strings
	# losslessly instead of silently replacing a byte with a Unicode character.
	if bytes.has(0): return bytes.duplicate()
	var result = ""
	for byte in bytes:
		result += String.chr(CP1252[byte - 128] if byte >= 128 and byte <= 159 else byte)
	return result

func encode_text(value) -> PackedByteArray:
	if value is PackedByteArray: return value.duplicate()
	if not value is String:
		error = "Expected text or raw bytes for VB String"
		return PackedByteArray()
	var result = PackedByteArray()
	for character in value:
		var cp = character.unicode_at(0)
		if cp >= 0x80 and cp <= 0x9f or cp > 0xff:
			var index = CP1252.find(cp)
			if index < 0:
				error = "Character U+%04X is not representable in Windows-1252" % cp
				return PackedByteArray()
			cp = index + 128
		result.append(cp)
	return result

func read_type(type_name: String) -> Dictionary:
	if not schemas.has(type_name):
		error = "Unknown VB type: " + type_name
		return {}
	var result = {}
	for field in schemas[type_name]:
		if field.has("dimensions"):
			var values = []
			for _index in element_count(field):
				values.append(read_field(field))
				if not error.is_empty(): return {}
			result[field.name] = values
		else:
			result[field.name] = read_field(field)
		if not error.is_empty(): return {}
	return result

func read_field(field: Dictionary):
	match field.type:
		"Integer": return i16()
		"Long": return i32()
		"Currency": return currency()
		"Single": return single()
		"Double":
			if not need(8): return 0.0
			var result = data.decode_double(cursor)
			cursor += 8
			return result
		"String": return vb_string(int(field.get("length", -1)))
		_: return read_type(field.type)

static func element_count(field: Dictionary) -> int:
	var result = 1
	for dimension in field.get("dimensions", []): result *= int(dimension)
	return result

func write_type(type_name: String, value: Dictionary) -> void:
	if not schemas.has(type_name):
		error = "Unknown VB type: " + type_name
		return
	for field in schemas[type_name]:
		if not value.has(field.name):
			error = "Missing field " + type_name + "." + field.name
			return
		if field.has("dimensions"):
			var values = value[field.name]
			if not values is Array or values.size() != element_count(field):
				error = "Incorrect array size for " + type_name + "." + field.name
				return
			for item in values:
				write_field(field, item)
				if not error.is_empty(): return
		else:
			write_field(field, value[field.name])
		if not error.is_empty(): return

func write_field(field: Dictionary, value) -> void:
	if not error.is_empty(): return
	match field.type:
		"Integer", "Long", "Currency":
			if not value is int:
				error = field.name + " requires an integer (Currency is raw int64)"
				return
			var width = {"Integer":2, "Long":4, "Currency":8}[field.type]
			if (width == 2 and (value < -32768 or value > 32767)) or (width == 4 and (value < -2147483648 or value > 2147483647)):
				error = "Overflow in " + field.name
				return
			grow(width)
			match width:
				2: data.encode_s16(cursor, value)
				4: data.encode_s32(cursor, value)
				8: data.encode_s64(cursor, value)
			cursor += width
		"Single", "Double":
			var width = 4 if field.type == "Single" else 8
			grow(width)
			if width == 4: data.encode_float(cursor, value)
			else: data.encode_double(cursor, value)
			cursor += width
		"String":
			var bytes = encode_text(value)
			if not error.is_empty(): return
			var length = int(field.get("length", bytes.size()))
			if bytes.size() > length or length > 65535:
				error = "String too long: " + field.name
				return
			if not field.has("length"):
				grow(2)
				data.encode_u16(cursor, length)
				cursor += 2
			grow(length)
			for index in length: data[cursor + index] = bytes[index] if index < bytes.size() else 32
			cursor += length
		_:
			if not value is Dictionary:
				error = "Expected a record for " + field.name
				return
			write_type(field.type, value)

func grow(length: int) -> void:
	if cursor + length > data.size(): data.resize(cursor + length)

func blank(type_name: String) -> Dictionary:
	var result = {}
	for field in schemas[type_name]:
		if field.has("dimensions"):
			var values = []
			for _index in element_count(field): values.append(blank_field(field))
			result[field.name] = values
		else: result[field.name] = blank_field(field)
	return result

func blank_field(field: Dictionary):
	match field.type:
		"String": return " ".repeat(int(field.get("length", 0)))
		"Single", "Double": return 0.0
		"Integer", "Long", "Currency": return 0
		_: return blank(field.type)
