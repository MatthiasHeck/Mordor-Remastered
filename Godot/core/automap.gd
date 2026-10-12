extends RefCounted
## Working MDATA8.MDR. Ten-byte Random records; only the Long payload changes.
const Codec = preload("res://core/vb_record.gd")
const VISITED = 1 << 23
var bytes = PackedByteArray()
var error = ""
var deepest: int = 0

func load_bytes(input: PackedByteArray) -> bool:
	error = ""
	if input.size() < 20 + 13499 * 10 + 4 or Codec.new(input).vb_string() != "1.1":
		error = "Automap has a missing or unsupported header, or truncated cells."
		return false
	var depth = input.decode_s16(10)
	if depth < 0 or depth > 15:
		error = "Invalid automap depth."
		return false
	bytes = input.duplicate()
	deepest = depth
	return true

static func offset(level: int, x: int, y: int) -> int:
	if level < 1 or level > 15 or x < 1 or x > 30 or y < 1 or y > 30: return -1
	return 20 + ((level - 1) * 900 + (y - 1) * 30 + x - 1) * 10

# Module3.fn0A34. Invalid coordinates fail closed instead of reading another row.
func flags(level: int, x: int, y: int) -> int:
	var at = offset(level,x,y)
	if at < 0 or bytes.size() < at + 4: return 0
	return bytes.decode_s32(at)

# Module3.fn0ABD: all three lost flags suppress writes, including facing alone.
func put(c: Dictionary, x: int, y: int, value: int) -> bool:
	var at = offset(c.M5470,x,y)
	if at < 0 or bytes.size() < at + 4:
		error = "Invalid automap coordinate."
		return false
	for index in 3:
		if c.M59F4[index] != 0: return true
	bytes.encode_s32(at,value)
	return true

func reach(level: int):
	if level > deepest and level <= 15:
		deepest = level
		bytes.encode_s16(10,level)

func copy():
	var result = get_script().new()
	result.load_bytes(bytes)
	return result

func floor_flags(level: int) -> Array:
	var result = []
	for y in range(1,31):
		for x in range(1,31): result.append(flags(level,x,y))
	return result
