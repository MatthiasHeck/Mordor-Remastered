extends RefCounted
## Static VBRUN300 Rnd candidate, recovered from supplied runtime bytes.
## At file offset 228026: halfword multiply/add keeps a 24-bit seed;
## the stored seed is divided by Single 16777216 at DS:1498.
## Initial seed DS:0E16 is 00000500 (0x50000). Randomize/music scheduling
## is a separate unported concern; this adapter starts at that controlled seed.
const MASK = 0xffffff
var state: int = 0x50000
var position: int = 0
var events: Array = []
var error = ""

func _init(seed: int = 0x50000, draws: int = 0):
	state = seed
	position = draws
	if seed < 0 or seed > MASK or draws < 0: error = "Invalid VB random state."

func draw(site: String) -> float:
	if not error.is_empty(): return 0.0
	state = (state * 0xfd43fd + 0xc39ec3) & MASK
	position += 1
	var value = state / 16777216.0
	events.append({"index":position,"site":site,"value":value})
	return value

func fork():
	var result = get_script().new(state,position)
	result.events = events.duplicate(true)
	result.error = error
	return result

func adopt(other):
	state = other.state
	position = other.position
	events = other.events.duplicate(true)
	error = other.error

func save_state() -> Dictionary: return {"state":state,"draws":position}
