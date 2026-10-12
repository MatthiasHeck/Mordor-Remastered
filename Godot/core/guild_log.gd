extends RefCounted
## MDATA9: signed i16 count, then i16 guild, i32 VB date, u16 length, CP1252 bytes.
const Codec = preload("res://core/vb_record.gd")
var bytes = PackedByteArray()
var entries: Array = []
var error = ""

func load_bytes(input: PackedByteArray) -> bool:
	error = ""
	bytes = input.duplicate()
	entries.clear()
	var reader = Codec.new(bytes)
	var count = reader.i16()
	if count < 0:
		error = "Invalid guild log count."
		return false
	for _index in count:
		var entry = {"guild_id":reader.i16(),"date":reader.i32(),"message":reader.vb_string()}
		if not reader.error.is_empty(): break
		entries.append(entry)
	if not reader.error.is_empty():
		error = reader.error
		return false
	if reader.cursor != bytes.size():
		error = "Unaccounted trailing guild-log bytes; log was not changed."
		return false
	return true

# Module11.sub0578 data operation; atomic multi-file saving is a new adapter.
func append(guild_id: int, date: int, message: String) -> bool:
	error = ""
	var codec = Codec.new()
	var text = codec.encode_text(message)
	if not codec.error.is_empty() or text.size() > 32767 or entries.size() >= 32767 or guild_id < 0 or guild_id > 32767 or date < -2147483648 or date > 2147483647:
		error = "Guild log field overflow or unsupported text. " + codec.error
		return false
	var extra = PackedByteArray()
	extra.resize(8)
	extra.encode_s16(0,guild_id)
	extra.encode_s32(2,date)
	extra.encode_u16(6,text.size())
	extra.append_array(text)
	bytes.append_array(extra)
	entries.append({"guild_id":guild_id,"date":date,"message":message})
	bytes.encode_s16(0,entries.size())
	return true
