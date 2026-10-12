extends RefCounted
## Explicit candidate conversions. These tests establish this implementation's
## contract, NOT measured VBRUN300 behavior. No seed-compatible RNG is assumed.
var error: String = ""

static func single(value: float) -> float:
	var bytes = PackedByteArray()
	bytes.resize(4)
	bytes.encode_float(0, value)
	return bytes.decode_float(0)

static func round_even(value: float) -> int:
	var lower = floor(value)
	var fraction = value - lower
	if fraction < 0.5: return int(lower)
	if fraction > 0.5: return int(lower + 1.0)
	return int(lower) if int(lower) % 2 == 0 else int(lower + 1.0)

func integer(value: float) -> int:
	if not is_finite(value) or value < -32768.5 or value >= 32767.5:
		error = "VB Integer overflow"
		return 0
	return round_even(value)

func long_integer(value: float) -> int:
	if not is_finite(value) or value < -2147483648.5 or value >= 2147483647.5:
		error = "VB Long overflow"
		return 0
	return round_even(value)
