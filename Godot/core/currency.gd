extends RefCounted
## Exact signed VB Currency storage. The UI accepts decimal text, not VB expressions.
const MAX_RAW: int = 9223372036854775807
const MIN_RAW: int = -9223372036854775807 - 1
var error: String = ""

func parse(text: String) -> int:
	error = ""
	var value = text.strip_edges()
	var negative = value.begins_with("-")
	if negative or value.begins_with("+"): value = value.substr(1)
	var parts = value.split(".")
	if parts.size() > 2 or parts[0].is_empty(): return invalid()
	var fraction = parts[1] if parts.size() == 2 else ""
	if fraction.length() > 4: return invalid()
	var digits = parts[0] + fraction.rpad(4,"0")
	for ch in digits:
		if ch < "0" or ch > "9": return invalid()
	while digits.length() > 1 and digits.begins_with("0"): digits = digits.substr(1)
	var limit = "9223372036854775808" if negative else "9223372036854775807"
	if digits.length() > limit.length() or (digits.length() == limit.length() and digits.casecmp_to(limit) > 0):
		error = "Currency overflow"
		return 0
	return (("-" if negative else "") + digits).to_int()

func invalid() -> int:
	error = "Enter a decimal amount with at most four fractional digits."
	return 0

static func display(raw: int) -> String:
	@warning_ignore("integer_division")
	var whole: int = raw / 10000
	var fraction = absi(raw % 10000)
	var result = ("-" if raw < 0 else "") + str(absi(whole))
	if fraction != 0: result += "." + str(fraction).lpad(4,"0").trim_suffix("0").trim_suffix("0").trim_suffix("0")
	return result

func add(left: int, right: int) -> int:
	if (right > 0 and left > MAX_RAW - right) or (right < 0 and left < MIN_RAW - right):
		error = "Currency overflow"
		return 0
	return left + right

func subtract(left: int, right: int) -> int:
	if (right > 0 and left < MIN_RAW + right) or (right < 0 and left > MAX_RAW + right):
		error = "Currency overflow"
		return 0
	return left - right
