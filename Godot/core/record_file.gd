extends RefCounted
## VB Random-file addressing is ONE based. Keep unknown bytes and partial tails.
const Codec = preload("res://core/vb_record.gd")
var bytes = PackedByteArray()
var record_size: int
var schemas: Dictionary
var error: String = ""

func _init(input: PackedByteArray, size: int, types: Dictionary):
	bytes = input.duplicate()
	record_size = size
	schemas = types

func record(number: int):
	var start = (number - 1) * record_size
	if number < 1 or start >= bytes.size():
		error = "Record %d outside file (%d bytes)" % [number, bytes.size()]
		var failed = Codec.new(PackedByteArray(), schemas)
		failed.error = error
		return failed
	return Codec.new(bytes.slice(start, mini(start + record_size, bytes.size())), schemas)

func read_type(number: int, type_name: String) -> Dictionary:
	var reader = record(number)
	var result = reader.read_type(type_name)
	if not reader.error.is_empty():
		error = "Record %d (%s): %s" % [number, type_name, reader.error]
		return {}
	return result

func replace_type(number: int, type_name: String, value: Dictionary) -> bool:
	# Encode completely before mutating; a bad field must leave the file untouched.
	var writer = record(number)
	if not writer.error.is_empty(): return false
	var old_length = writer.data.size()
	writer.write_type(type_name, value)
	if not writer.error.is_empty() or writer.cursor > old_length:
		error = writer.error if not writer.error.is_empty() else "Edited record exceeds its original byte span"
		return false
	var start = (number - 1) * record_size
	for index in old_length: bytes[start + index] = writer.data[index]
	return true
