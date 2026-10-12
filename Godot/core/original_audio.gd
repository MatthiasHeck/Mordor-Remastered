extends RefCounted
## Bounded RIFF reader for original PCM WAVs, including odd-length final data
## chunks without padding. Raw files remain unchanged. No resampling/compression.
## AudioStreamWAV's 8-bit buffer is signed:
## https://docs.godotengine.org/en/stable/classes/class_audiostreamwav.html#class-audiostreamwav-property-data
var error: String = ""

func decode(bytes: PackedByteArray) -> AudioStreamWAV:
	error = ""
	if bytes.size() < 12 or bytes.slice(0,4).get_string_from_ascii() != "RIFF" or bytes.slice(8,12).get_string_from_ascii() != "WAVE":
		error = "Not a RIFF/WAVE file"
		return null
	var end = int(bytes.decode_u32(4)) + 8
	if end > bytes.size():
		error = "Truncated RIFF container"
		return null
	var position = 12
	var format_data = PackedByteArray()
	var pcm = PackedByteArray()
	while position + 8 <= end:
		var kind = bytes.slice(position,position+4).get_string_from_ascii()
		var length = int(bytes.decode_u32(position+4))
		position += 8
		if length > end - position:
			error = "Truncated WAV chunk: " + kind
			return null
		if kind == "fmt ": format_data = bytes.slice(position,position+length)
		elif kind == "data": pcm = bytes.slice(position,position+length)
		position += length + (length % 2)
		# Two supplied files have malformed trailing LIST metadata. Playback needs
		# only fmt + data. Stop once both are complete; retain the raw file verbatim.
		if not format_data.is_empty() and not pcm.is_empty(): break
	if format_data.size() < 16 or pcm.is_empty():
		error = "Missing PCM format or data chunk"
		return null
	var channels = format_data.decode_u16(2)
	var bits = format_data.decode_u16(14)
	var rate = format_data.decode_u32(4)
	if format_data.decode_u16(0) != 1 or channels not in [1,2] or bits not in [8,16] or rate == 0:
		error = "Unsupported WAV format"
		return null
	@warning_ignore("integer_division")
	var frame_size = channels * bits / 8
	if format_data.decode_u16(12) != frame_size or pcm.size() % frame_size != 0:
		error = "Incomplete PCM frame"
		return null
	if bits == 8:
		for index in pcm.size(): pcm[index] = (int(pcm[index]) - 128) & 255
	var stream = AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_8_BITS if bits == 8 else AudioStreamWAV.FORMAT_16_BITS
	stream.stereo = channels == 2
	stream.mix_rate = rate
	stream.data = pcm
	return stream
