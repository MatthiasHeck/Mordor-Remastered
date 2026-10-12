extends RefCounted
## Deterministic, solo exploration slice of the recovered dungeon dispatcher.
## Encounters/timers and random perception/hazards are NOT simulated here.
const Map = preload("res://core/automap.gd")
const Equipment = preload("res://core/equipment.gd")
const DIRECTIONS = [Vector2i(0,1),Vector2i(1,0),Vector2i(0,-1),Vector2i(-1,0)]
const FACING_NAMES = ["North","East","South","West"]
const RANDOM_TERRAIN = {11:"Pit",15:"Water",16:"Quicksand",17:"Rotator",21:"Chute"}
var catalog
var error = ""

func _init(data): catalog = data

func position(c: Dictionary) -> Vector2i: return Vector2i(c.M583F,c.M5845)

func valid(c: Dictionary, town: bool = false) -> bool:
	if c.M4EAC <= 0 or c.M5483 != 0:
		error = "This character needs recovery services."
		return false
	if c.M56B9[2] != 0:
		error = "You cannot move while paralyzed."
		return false
	if c.M5899 < 1 or c.M5899 > 4:
		error = "Invalid saved facing."
		return false
	if town and c.M5470 == 0: return true
	if catalog.cell(c.M5470,c.M583F,c.M5845).is_empty():
		error = "Invalid saved dungeon position."
		return false
	return true

# Module3.fn0B1B. 1=wall, 2=door, 4=secret; south/west use the adjacent record.
func edge(level: int, at: Vector2i, facing: int) -> Dictionary:
	var result = {"mask":1,"x":at.x,"y":at.y,"axis":1 if facing in [1,3] else 0,"boundary":true}
	if facing < 1 or facing > 4 or catalog.cell(level,at.x,at.y).is_empty(): return result
	var target = at + DIRECTIONS[facing - 1]
	if catalog.cell(level,target.x,target.y).is_empty(): return result
	if facing == 3: result.y -= 1
	if facing == 4: result.x -= 1
	var flags = int(catalog.cell(level,result.x,result.y).flags)
	result.mask = 0
	for bit in 3:
		if flags & (1 << (result.axis + bit * 2)): result.mask |= 1 << bit
	result.boundary = false
	return result

func fail(message: String) -> Dictionary:
	error = message
	return {}

# FRMCTYM.imgPicture_Click and Module6.fn14CB (solo movement/Take branches).
# Returns copies for a single character+automap+log transaction.
func act(character: Dictionary, automap, action: String) -> Dictionary:
	error = ""
	if not valid(character,action == "enter"): return {}
	var c = character.duplicate(true)
	var map = automap.copy()
	var result = {"character":c,"automap":map,"messages":[],"new_depths":[]}
	if action == "enter":
		if c.M5470 != 0: return fail("This character is already in the dungeon.")
		c.M5470 = 1
		c.M583F = 9
		c.M5845 = 11
		c.M5899 = 1
		result.messages.append("You descend into the Depths of Dejenol.")
		return result if enter_square(result) else {}
	if c.M5470 == 0: return fail("Enter the dungeon from town first.")
	match action:
		"left", "right", "around":
			c.M5899 = posmod(c.M5899 - 1 + {"left":-1,"right":1,"around":2}[action],4) + 1
			result.messages.append("You face " + FACING_NAMES[c.M5899 - 1].to_lower() + "." if c.M59F4[2] == 0 else "You turn.")
			return result
		"forward":
			var border = edge(c.M5470,position(c),c.M5899)
			if border.mask & 1: return fail("A wall blocks your way.")
			# Crossing a secret edge explicitly discovers it; walking never requires
			# a separate open-door action in the recovered dispatcher.
			if border.mask & 6:
				var known = map.flags(c.M5470,border.x,border.y)
				known &= ~(1 << border.axis)
				known |= 1 << (border.axis + (4 if border.mask & 4 else 2))
				map.put(c,border.x,border.y,known)
				result.messages.append("You pass through a secret door." if border.mask & 4 else "You pass through a door.")
			var next = position(c) + DIRECTIONS[c.M5899 - 1]
			c.M583F = next.x
			c.M5845 = next.y
			return result if enter_square(result) else {}
		"take":
			var flags = catalog.cell(c.M5470,c.M583F,c.M5845).flags
			if flags & (1 << 12):
				c.M5470 -= 1 # Stairs up have priority when both bits are set.
				if c.M5470 == 0:
					c.M59BB = -1
					result.messages.append("You return to Dejenol.")
					return result
				result.messages.append("You climb the stairs.")
			elif flags & (1 << 13):
				if c.M5470 >= catalog.floors.size(): return fail("There is no deeper floor.")
				c.M5470 += 1
				result.messages.append("You descend the stairs.")
			elif flags & (1 << 21): return fail("Chute traversal is still being migrated.")
			else: return fail("There are no stairs here to take.")
			return result if enter_square(result) else {}
	return fail("Unknown dungeon action.")

# Deterministic subset of Module3.sub0835. Unsupported hazards stop the entire
# action BEFORE saving; never grant a harmless crossing of a damaging square.
func enter_square(result: Dictionary) -> bool:
	var c = result.character
	var map = result.automap
	var seen = {}
	for _hop in 64:
		var key = Vector3i(c.M583F,c.M5845,c.M5470)
		if seen.has(key):
			fail("A teleporter cycle was found. The move was not saved.")
			return false
		seen[key] = true
		var square = catalog.cell(c.M5470,c.M583F,c.M5845)
		if square.is_empty() or square.flags & (1 << 19):
			fail("The destination is outside the dungeon or inside solid rock.")
			return false
		var flags = int(square.flags)
		for bit in RANDOM_TERRAIN:
			if flags & (1 << bit):
				fail(RANDOM_TERRAIN[bit] + " effects are still being migrated. This move was not saved.")
				return false
		c.M59BB = square.area
		# Known visited squares restore orientation, as in sub0835. Random
		# recovery checks on unknown squares are omitted in this partial port.
		if map.flags(c.M5470,c.M583F,c.M5845) & Map.VISITED:
			for index in 3: c.M59F4[index] = 0
		if c.M59F4[0] == 0 and c.M5470 > map.deepest:
			map.reach(c.M5470)
			result.new_depths.append(c.M5470)
		observe(c,map)
		for bit in range(6,10):
			if flags & (1 << bit): c.M5899 = bit - 5
		if flags & (1 << 10):
			c.M591F = 0
			for index in 11: c.M592F[index] = 0
			Equipment.new(catalog).refresh_effects(c)
			result.messages.append("The square extinguishes your temporary magical effects.")
		if not flags & (1 << 14): return true
		var destination = {}
		for slot in catalog.floors[c.M5470 - 1].teleporters:
			if slot.M5D74 == c.M583F and slot.M5D7E == c.M5845:
				destination = slot
				break
		map.put(c,c.M583F,c.M5845,map.flags(c.M5470,c.M583F,c.M5845) | (1 << 14))
		if destination.is_empty():
			# Supplied floor-8 cells (5,6)/(6,6) have no matching slot. The
			# recovered loop makes no coordinate change; do not invent a target.
			result.messages.append("The teleporter has no matching destination.")
			return true
		if destination.M5D88 == 0 or destination.M5D90 == 0:
			fail("Random teleport destinations are still being migrated. This move was not saved.")
			return false
		c.M583F = destination.M5D88
		c.M5845 = destination.M5D90
		if destination.M5D98 > 0: c.M5470 = destination.M5D98
		if map.flags(c.M5470,c.M583F,c.M5845) == 0:
			for index in 3: c.M59F4[index] = -1
		result.messages.append("You step into a teleporter.")
	fail("Too many chained teleporters. The move was not saved.")
	return false

# Conservative partial automapping: visible ordinary edges, stairs, fog and
# visited cells. Random secret-door discovery/perception is deferred; secrets
# stay walls until traversed. Neighbor edge records do not reveal neighbor floors.
func observe(c: Dictionary, map):
	var square = catalog.cell(c.M5470,c.M583F,c.M5845)
	var flags = int(square.flags)
	var known = map.flags(c.M5470,c.M583F,c.M5845)
	if not flags & (1 << 20):
		known = reveal_edges(known,flags,3)
		var floor_data = catalog.floors[c.M5470 - 1]
		if c.M583F == floor_data.width: known |= 1
		if c.M5845 == floor_data.height: known |= 2
		for border in [Vector3i(-1,0,1),Vector3i(0,-1,2)]:
			var x = c.M583F + border.x
			var y = c.M5845 + border.y
			var neighbor = catalog.cell(c.M5470,x,y)
			if not neighbor.is_empty(): map.put(c,x,y,reveal_edges(map.flags(c.M5470,x,y),neighbor.flags,border.z))
	known |= flags & ((1 << 12) | (1 << 13) | (1 << 20))
	map.put(c,c.M583F,c.M5845,known | Map.VISITED)

static func reveal_edges(known: int, flags: int, axes: int) -> int:
	for axis in 2:
		if not axes & (1 << axis): continue
		known |= flags & ((1 << axis) | (1 << (axis + 2)))
		if flags & (1 << (axis + 4)) and not known & (1 << (axis + 4)): known |= 1 << axis
	return known
