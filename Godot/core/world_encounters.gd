extends RefCounted
## Module4.fn0E38/fn0F88: 28-byte Random records, 4 groups + room metadata.
const Records = preload("res://core/record_file.gd")
const Codec = preload("res://core/vb_record.gd")
var records
var catalog
var error = ""

func _init(data): catalog = data

func load_bytes(input: PackedByteArray) -> bool:
	error = ""
	if input.size() < 420436 or Codec.new(input).i16() != 15:
		error = "Invalid or truncated encounter file."
		return false
	records = Records.new(input,28,catalog.schemas)
	for level in range(1,16):
		if records.record(level + 1).i16() < 0 or records.record(level + 1).i16() > 200:
			error = "Invalid remaining-room count."
			return false
	return true

static func first_record(level: int, area: int) -> int:
	if level < 1 or level > 15 or area < 1 or area > 200: return -1
	return 17 + (level - 1) * 1000 + (area - 1) * 5

func room(level: int, area: int) -> Dictionary:
	error = ""
	var first = first_record(level,area)
	if first < 0:
		error = "Invalid encounter room."
		return {}
	var result = {"groups":[],"meta":{}}
	for slot in 4:
		var group = records.read_type(first + slot,"T4E8B")
		if not records.error.is_empty() or group.M4EDC < 0 or group.M4EDC > 32767 or (group.M4EDC > 0 and (group.M4ED4 < 0 or group.M4ED4 >= catalog.tables.monsters.size() or group.M4EAC < 0)):
			error = "Invalid encounter group record. " + records.error
			return {}
		result.groups.append(group)
	result.meta = records.read_type(first + 4,"T4F0B")
	if not records.error.is_empty():
		error = records.error
		return {}
	return result

func put(level: int, area: int, value: Dictionary) -> bool:
	error = ""
	var first = first_record(level,area)
	if first < 0 or value.groups.size() != 4:
		error = "Invalid encounter update."
		return false
	for group in value.groups:
		if not group is Dictionary or not group.has_all(["M4EDC","M4ED4","M4EAC"]):
			error = "Missing encounter group fields."
			return false
		if group.M4EDC < 0 or group.M4EDC > 32767 or (group.M4EDC > 0 and (group.M4ED4 < 0 or group.M4ED4 >= catalog.tables.monsters.size() or group.M4EAC < 0)):
			error = "Invalid encounter group candidate."
			return false
	var next = Records.new(records.bytes,28,catalog.schemas)
	for slot in 4:
		if not next.replace_type(first + slot,"T4E8B",value.groups[slot]):
			error = next.error
			return false
	if not next.replace_type(first + 4,"T4F0B",value.meta):
		error = next.error
		return false
	records = next
	return true

func copy():
	var result = get_script().new(catalog)
	result.load_bytes(records.bytes)
	return result

func cleared(level: int) -> bool:
	if level < 1 or level > 15:
		error = "Invalid cleared-room floor."
		return false
	var count = records.record(level + 1).i16()
	if count <= 0:
		error = "Remaining-room counter cannot be decremented."
		return false
	records.bytes.encode_s16(level * 28,count - 1)
	return true
