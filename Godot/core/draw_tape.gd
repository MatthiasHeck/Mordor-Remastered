extends RefCounted
## Replay supplied Rnd RESULTS in source order. Deliberately no Godot RNG fallback:
## the original VB3 seed/state algorithm has not yet been measured.
var values: Array
var events: Array = []
var error: String = ""
var position: int = 0

func _init(draws: Array = []):
	values = draws.duplicate()

func fork():
	var result = get_script().new(values)
	result.position = position
	result.events = events.duplicate(true)
	result.error = error
	return result

func adopt(other):
	position = other.position
	events = other.events.duplicate(true)
	error = other.error

func draw(site: String) -> float:
	if position >= values.size():
		error = "Missing Rnd observation at " + site
		return 0.0
	var value = values[position]
	if (not value is float and not value is int) or not is_finite(float(value)) or value < 0.0 or value >= 1.0:
		error = "Rnd result outside [0, 1) at " + site
		return 0.0
	position += 1
	events.append({"index":position, "site":site, "value":value})
	return float(value)
