extends SceneTree
const Catalog = preload("res://core/original_data.gd")
const Campaign = preload("res://core/campaign.gd")
const Dungeon = preload("res://core/dungeon_rules.gd")
const Map = preload("res://core/automap.gd")
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
var data = Catalog.new()
var checks = 0
var failures: Array = []
var directory: String
var originals: Dictionary = {}

class FailedInstall extends "res://core/save_transaction.gd":
	var installed = 0
	func install(path: String, existed: bool) -> bool:
		installed += 1
		if installed == 3:
			error = "Injected log failure after character and map installation"
			return false
		return super.install(path,existed)

class InterruptedInstall extends FailedInstall:
	func recover(_directory: String) -> bool:
		error = "Simulated interruption before rollback"
		return false

func _initialize(): run.call_deferred()

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		failures.append(message)
		printerr(message)

func fixture() -> Dictionary:
	var c = Town.new().new_character(Rules.creation_state(0,data.tables.races[0].raw),"Explorer",0,"",data,46305)
	c.M5470 = 1
	c.M583F = 2
	c.M5845 = 2
	return c

func blank_map():
	var map = Map.new()
	map.load_bytes(originals["MDATA8.MDR"])
	return map

func synthetic():
	var copy = Catalog.new()
	copy.schemas = data.schemas
	copy.tables = data.tables
	copy.floors = data.floors.duplicate(true)
	for floor_data in copy.floors:
		floor_data.teleporters.clear()
		for cell in floor_data.cells:
			cell.flags = 0
			cell.area = 7
	return copy

func set_flags(catalog, level: int, x: int, y: int, flags: int):
	catalog.floors[level - 1].cells[(y - 1) * 30 + x - 1].flags = flags

func write(path: String, bytes: PackedByteArray):
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(path.get_base_dir()))
	var file = FileAccess.open(path,FileAccess.WRITE)
	file.store_buffer(bytes)
	file.close()

func run():
	directory = "res://tests/tmp/dungeon-%d" % Time.get_ticks_usec()
	check(data.load_all(),"Load original dungeon records")
	for name in ["MDATA4.MDR","MDATA8.MDR","MDATA9.MDR","MDATA11.MDR"]:
		originals[name] = FileAccess.get_file_as_bytes("res://data/original/" + name)
	test_map()
	test_edges()
	test_actions()
	test_teleporters()
	test_persistence()
	await test_ui()
	for name in originals:
		check(FileAccess.get_file_as_bytes("res://data/original/" + name) == originals[name],"Original unchanged: " + name)
	var file = FileAccess.open("res://tests/dungeon-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify({"checks":checks,"failures":failures,"scope":"Deterministic solo exploration; independent CSV edge sweep, lossless automap, transitions, recovery and native UI. No original-runtime parity claim."},"\t") + "\n")
	print("DUNGEON PASS" if failures.is_empty() else "DUNGEON FAIL", ": ",checks," checks; ",failures.size()," failures")
	quit(0 if failures.is_empty() else 1)

func test_map():
	var map = blank_map()
	check(map.bytes == originals["MDATA8.MDR"] and map.deepest == 1,"Load automap without changing header, gaps or extra trailing bytes")
	check(map.floor_flags(1).count(0) == 900,"Original first floor starts unexplored")
	check(Map.offset(1,1,1) == 20 and Map.offset(15,30,30) == 135010,"Automap one-based Random record boundaries")
	check(Map.offset(1,31,1) == -1 and Map.offset(0,1,1) == -1,"Out-of-range coordinates cannot alias another record")
	var c = fixture()
	check(map.put(c,2,2,Map.VISITED | 8),"Write discovered square")
	check(map.flags(1,2,2) == Map.VISITED | 8 and map.flags(1,3,2) == 0,"Write changes only the selected square")
	var expected = originals["MDATA8.MDR"].duplicate()
	expected.encode_s32(330,Map.VISITED | 8)
	check(map.bytes == expected,"Exact automap byte mutation preserves unused payload and file tail")
	map.reach(3)
	check(map.deepest == 3 and map.bytes.decode_s16(10) == 3,"Deepest floor uses original record 2")
	map.reach(2)
	check(map.deepest == 3,"Returning upstairs does not lower deepest floor")
	for index in 3:
		c.M59F4[index] = -1
		var before = map.bytes.duplicate()
		check(map.put(c,2,2,123) and map.bytes == before,"Lost flag %d suppresses map writes" % index)
		c.M59F4[index] = 0
	check(not map.put(c,0,1,1),"Invalid map writes fail")
	check(not Map.new().load_bytes(expected.slice(0,135013)),"Truncated final automap payload rejected")
	expected.encode_s16(10,16)
	check(not Map.new().load_bytes(expected),"Invalid automap depth rejected")

func test_edges():
	# Independent research CSV, independent coordinate/bit expectations. One
	# aggregate per floor checks every cell and all four orientations (54k edges).
	var csv = FileAccess.open("res://tests/reference/dungeon-cells-local.csv",FileAccess.READ)
	csv.get_csv_line()
	var flags = []
	while not csv.eof_reached():
		var row = csv.get_csv_line()
		if row.size() == 7: flags.append(int(row[6]))
	check(flags.size() == 13500,"Load independent geometry fixture")
	var rules = Dungeon.new(data)
	for level in range(1,16):
		var matches = true
		for y in range(1,31):
			for x in range(1,31):
				for face in range(1,5):
					var index = (level - 1) * 900 + (y - 1) * 30 + x - 1
					var boundary = (face == 1 and y == 30) or (face == 2 and x == 30) or (face == 3 and y == 1) or (face == 4 and x == 1)
					if face == 3: index -= 30
					if face == 4: index -= 1
					var mask = 1
					if not boundary:
						var value = flags[index]
						mask = ((value & 2) >> 1) | ((value & 8) >> 2) | ((value & 32) >> 3) if face in [1,3] else (value & 1) | ((value & 4) >> 1) | ((value & 16) >> 2)
					if rules.edge(level,Vector2i(x,y),face).mask != mask: matches = false
		check(matches,"All 3,600 directional edges match independent CSV on floor %d" % level)

func test_actions():
	var catalog = synthetic()
	var rules = Dungeon.new(catalog)
	var map = blank_map()
	var c = fixture()
	c.M5470 = 0
	var result = rules.act(c,map,"enter")
	check(not result.is_empty(),"Enter dungeon from town")
	if result.is_empty(): return
	check(result.character.M5470 == 1 and result.character.M583F == 9 and result.character.M5845 == 11 and result.character.M5899 == 1,"Original entrance (9,11,1), facing north")
	check(c.M5470 == 0 and map.flags(1,9,11) == 0,"Successful rules return copies without mutating inputs")
	check(result.character.M59BB == 7 and result.automap.flags(1,9,11) & Map.VISITED,"Entry assigns area and records discovery")
	c = fixture()
	for pair in [["left",4],["right",2],["around",3]]:
		result = rules.act(c,map,pair[0])
		check(result.character.M5899 == pair[1] and result.character.M583F == 2 and result.character.M5845 == 2,"Turn in place: " + pair[0])
	for pair in [[1,2,3],[2,3,2],[3,2,1],[4,1,2]]:
		c.M5899 = pair[0]
		result = rules.act(c,map,"forward")
		check(result.character.M583F == pair[1] and result.character.M5845 == pair[2],"Forward orientation %d" % pair[0])
	c.M5899 = 1
	set_flags(catalog,1,2,2,2)
	check(rules.act(c,map,"forward").is_empty() and "wall" in rules.error,"North wall blocks movement")
	set_flags(catalog,1,2,2,8)
	result = rules.act(c,map,"forward")
	check(result.character.M5845 == 3 and result.automap.flags(1,2,2) & 8,"Door traversal uses same forward action")
	set_flags(catalog,1,2,2,32)
	result = rules.act(c,map,"forward")
	check(result.character.M5845 == 3 and result.automap.flags(1,2,2) & 32 and not result.automap.flags(1,2,2) & 2,"Crossing a secret door records it and clears apparent wall")
	set_flags(catalog,1,2,2,0)
	for bit in [11,15,16,17,21,19]:
		set_flags(catalog,1,2,3,1 << bit)
		check(rules.act(c,map,"forward").is_empty() and c.M5845 == 2 and map.flags(1,2,3) == 0,"Unsupported hazard/rock %d rejects entire move" % bit)
	set_flags(catalog,1,2,3,(1 << 6) | (1 << 9))
	result = rules.act(c,map,"forward")
	check(result.character.M5899 == 4,"Combined compass flags apply in source order, west last")
	set_flags(catalog,1,2,3,(1 << 10))
	c.M591F = 1
	c.M592F[0] = 80
	result = rules.act(c,map,"forward")
	check(result.character.M591F == 0 and result.character.M592F[0] == 0 and c.M591F == 1,"Extinguish clears temporary effects on candidate copy")
	set_flags(catalog,1,2,3,(1 << 20) | 2 | 8)
	result = rules.act(c,map,"forward")
	check(result.automap.flags(1,2,3) == Map.VISITED | (1 << 20),"Fog records visit without revealing edges")
	set_flags(catalog,1,2,2,(1 << 13))
	result = rules.act(c,map,"take")
	check(result.character.M5470 == 2 and result.character.M583F == 2 and result.character.M5845 == 2,"Stairs retain coordinates on adjacent floor")
	check(result.new_depths == [2] and result.automap.deepest == 2,"New depth offered for atomic guild logging")
	set_flags(catalog,1,2,2,(1 << 12) | (1 << 13))
	check(rules.act(c,map,"take").character.M5470 == 0,"Up stairs take priority and floor one exits to town")
	c.M5470 = 15
	set_flags(catalog,15,2,2,1 << 13)
	check(rules.act(c,map,"take").is_empty(),"Floor fifteen cannot descend outside catalog")
	c = fixture()
	c.M583F = 1
	c.M5899 = 4
	check(rules.act(c,map,"forward").is_empty(),"Outer boundary cannot wrap into another row")
	c.M56B9[2] = -1
	check(rules.act(c,map,"right").is_empty(),"Paralysis blocks turning")
	c.M56B9[2] = 0
	c.M4EAC = 0
	check(rules.act(c,map,"forward").is_empty(),"Dead characters cannot move")
	c = fixture()
	c.M5899 = 0
	check(rules.act(c,map,"forward").is_empty(),"Invalid facing rejected")
	c.M5899 = 1
	check(rules.act(c,map,"cheat").is_empty(),"Unknown action rejected")
	# Visit exposes only ordinary edges. Unknown secrets remain apparent walls.
	set_flags(catalog,1,2,2,32)
	rules.observe(c,map)
	check(map.flags(1,2,2) & 2 and not map.flags(1,2,2) & 32,"Secret door not revealed without crossing or a future perception roll")
	check(not map.flags(1,2,1) & Map.VISITED,"Adjacent edge observations do not mark neighboring cells visited")

func test_teleporters():
	var catalog = synthetic()
	var rules = Dungeon.new(catalog)
	var map = blank_map()
	var c = fixture()
	set_flags(catalog,1,2,3,1 << 14)
	catalog.floors[0].teleporters.append({"M5D74":2,"M5D7E":3,"M5D88":4,"M5D90":5,"M5D98":2})
	var result = rules.act(c,map,"forward")
	check(result.character.M5470 == 2 and result.character.M583F == 4 and result.character.M5845 == 5,"Fixed teleporter uses original destination coordinate/floor fields")
	check(result.character.M59F4.slice(0,3) == [-1,-1,-1] and result.character.M5899 == 1,"Unmapped teleporter destination loses bearings and retains facing")
	check(result.automap.flags(2,4,5) == 0,"Unknown destination does not reveal map while lost")
	var known = fixture()
	known.M5470 = 2
	map.put(known,4,5,Map.VISITED)
	result = rules.act(c,map,"forward")
	check(result.character.M59F4.slice(0,3) == [0,0,0],"Mapped destination restores bearings")
	catalog.floors[0].teleporters[0].M5D88 = 0
	check(rules.act(c,map,"forward").is_empty() and "Random teleport" in rules.error,"Random destination requires original RNG and does not move")
	catalog.floors[0].teleporters[0].M5D88 = 4
	set_flags(catalog,2,4,5,1 << 14)
	catalog.floors[1].teleporters.append({"M5D74":4,"M5D7E":5,"M5D88":2,"M5D90":3,"M5D98":1})
	check(rules.act(c,map,"forward").is_empty() and "cycle" in rules.error,"Chained cycle rejected without recursion or partial saves")
	set_flags(catalog,2,4,5,1 << 19)
	check(rules.act(c,map,"forward").is_empty() and "solid rock" in rules.error,"Invalid fixed destination rejects whole action")
	catalog.floors[0].teleporters.clear()
	result = rules.act(c,map,"forward")
	check(result.character.M5845 == 3 and result.character.M5470 == 1,"Unmatched teleporter leaves position at the source square")
	# Preserve the actual source anomaly, not just a synthetic missing slot.
	for at in [Vector2i(5,6),Vector2i(6,6)]:
		check(data.cell(8,at.x,at.y).flags & (1 << 14),"Original unmatched teleporter flagged: " + str(at))
		var matches = 0
		for slot in data.floors[7].teleporters:
			if slot.M5D74 == at.x and slot.M5D7E == at.y: matches += 1
		check(matches == 0,"No invented slot for original floor-eight anomaly")

func test_persistence():
	var catalog = synthetic()
	set_flags(catalog,1,9,11,(1 << 13))
	set_flags(catalog,2,9,11,(1 << 12))
	var save = Campaign.new()
	var path = directory.path_join("saves")
	check(save.open(path,catalog),"Open exploration save")
	check(save.create_character(Rules.creation_state(0,data.tables.races[0].raw),"Explorer",0,"",46305),"Create exploration character")
	check(save.dungeon_action(3,"enter",46305),"Persist entry and discovery together")
	var reopened = Campaign.new()
	check(reopened.open(path,catalog) and reopened.characters[0].raw.M5470 == 1 and reopened.automap.flags(1,9,11) & Map.VISITED,"Reload restores character and automap")
	check(save.dungeon_action(3,"take",46305),"Persist descent with new-depth log")
	check(save.guild_log.entries[-1].message == '"Explorer" was the first to go to level 2.',"Original first-depth guild log text")
	check(not reopened.dungeon_action(3,"right",46305),"Stale campaign cannot overwrite newer exploration")
	check(reopened.open(path,catalog) and reopened.automap.deepest == 2 and reopened.characters[0].raw.M5470 == 2,"Reload retains depth and location together")
	var count = save.guild_log.entries.size()
	check(save.dungeon_action(3,"take",46305),"Persist return upstairs")
	check(save.dungeon_action(3,"take",46305) and save.guild_log.entries.size() == count,"Revisiting depth does not duplicate guild log")
	# Now floor 2 has down stairs, causing a 3-file change and new log entry.
	set_flags(catalog,2,9,11,(1 << 13))
	for injected in [FailedInstall.new(),InterruptedInstall.new()]:
		var before = {}
		for name in ["MDATA4.MDR","MDATA8.MDR","MDATA9.MDR"]:
			before[name] = FileAccess.get_file_as_bytes(path.path_join(name))
		var old_character = save.characters[0].raw.duplicate(true)
		var old_map = save.automap.bytes.duplicate()
		var old_log = save.guild_log.bytes.duplicate()
		save.transaction = injected
		check(not save.dungeon_action(3,"take",46305),"Injected third-file failure rejects descent")
		check(save.characters[0].raw == old_character and save.automap.bytes == old_map and save.guild_log.bytes == old_log,"Failed three-file save preserves memory")
		var recovered = Campaign.new()
		check(recovered.open(path,catalog),"Reopen recovers interrupted three-file transaction")
		for name in before: check(FileAccess.get_file_as_bytes(path.path_join(name)) == before[name],"Recovery restores " + name)
		check(recovered.automap.deepest == 2 and recovered.characters[0].raw.M5470 == 2,"Recovered depth matches recovered position")
		save = recovered
	var map_path = path.path_join("MDATA8.MDR")
	var tampered = save.automap.bytes.duplicate()
	tampered.encode_s32(Map.offset(1,1,1),Map.VISITED)
	write(map_path,tampered)
	check(not save.dungeon_action(3,"right",46305) and "another window" in save.error,"Automap-only external changes also trigger stale-save protection")
	write(map_path,PackedByteArray([1,2,3]))
	check(not Campaign.new().open(path,catalog),"Corrupt existing automap fails closed")
	check(FileAccess.get_file_as_bytes(map_path) == PackedByteArray([1,2,3]),"Corrupt map is preserved for diagnosis")

func test_ui():
	var path = directory.path_join("ui")
	var save = Campaign.new()
	check(save.open(path,data),"Open native dungeon UI fixture")
	check(save.create_character(Rules.creation_state(0,data.tables.races[0].raw),"Pathfinder",0,"secret",46305),"Create native dungeon UI character")
	var app = load("res://ui/game.tscn").instantiate()
	app.save_directory = path
	root.add_child(app)
	await process_frame
	app.password_input.text = "secret"
	app.find_child("EnterTown",true,false).pressed.emit()
	app.find_child("EnterDungeon",true,false).pressed.emit()
	check(app.dungeon_page and app.active_character().M5470 == 1,"Town button enters actual original dungeon")
	check(app.find_child("DungeonView",true,false) != null and app.find_child("ExploredMap",true,false) != null,"Native perspective and explored map controls exist")
	check(app.campaign.automap.flags(1,9,11) & Map.VISITED and app.campaign.automap.flags(1,30,30) == 0,"UI exploration never reveals full atlas")
	await capture(app,"entrance")
	app.find_child("DungeonRight",true,false).pressed.emit()
	check(app.active_character().M5899 == 2,"Turn button persists facing")
	var key = InputEventKey.new()
	key.keycode = KEY_A
	key.pressed = true
	app._unhandled_key_input(key)
	check(app.active_character().M5899 == 1,"Keyboard turn uses same action")
	key.echo = true
	app._unhandled_key_input(key)
	check(app.active_character().M5899 == 1,"Held-key echo cannot spam moves")
	app.find_child("DungeonForward",true,false).pressed.emit()
	check(app.active_character().M5845 == 12,"Forward button walks original entrance corridor")
	await capture(app,"corridor")
	app.find_child("LeaveDungeon",true,false).pressed.emit()
	check(not app.dungeon_page and app.find_child("EnterTown",true,false).text == "Resume dungeon","Leaving preserves expedition and offers resume")
	app.password_input.text = "wrong"
	app.find_child("EnterTown",true,false).pressed.emit()
	check(not app.dungeon_page and "Incorrect" in app.status.text,"Dungeon resume requires password")
	app.password_input.text = "secret"
	app.find_child("EnterTown",true,false).pressed.emit()
	check(app.dungeon_page and app.active_character().M5845 == 12,"Resume does not reset to entrance")
	app.find_child("DungeonAround",true,false).pressed.emit()
	app.find_child("DungeonForward",true,false).pressed.emit()
	app.find_child("DungeonTake",true,false).pressed.emit()
	check(not app.dungeon_page and app.active_character().M5470 == 0 and app.find_child("Bank",true,false) != null,"Taking actual entrance stairs returns to town services")
	check(save.open(path,data) and save.characters[0].raw.M5470 == 0 and save.automap.flags(1,9,12) & Map.VISITED,"Restart retains completed expedition discoveries")
	app.find_child("EnterDungeon",true,false).pressed.emit()
	# Fixed independent path from the CSV fixture to the near down staircase.
	# Exercise real movement/doors and the multi-file commit for every step.
	var route_ok = true
	for facing in [1,4,4,3,3,3,3,2,2,2,3,3,4,4,4]:
		for _turn in 4:
			if app.active_character().M5899 == facing: break
			app.find_child("DungeonRight",true,false).pressed.emit()
		var before = Vector2i(app.active_character().M583F,app.active_character().M5845)
		app.find_child("DungeonForward",true,false).pressed.emit()
		if Vector2i(app.active_character().M583F,app.active_character().M5845) != before + Dungeon.DIRECTIONS[facing - 1]: route_ok = false
	check(route_ok and app.active_character().M583F == 7 and app.active_character().M5845 == 6,"Walk original fifteen-step route through doors to floor-one down stairs")
	await capture(app,"mapped-route")
	app.find_child("DungeonTake",true,false).pressed.emit()
	check(app.active_character().M5470 == 2 and app.campaign.automap.deepest == 2,"Actual staircase descends to floor two and updates deepest floor")
	check(app.campaign.guild_log.entries[-1].message == '"Pathfinder" was the first to go to level 2.',"Actual descent saves discovery log")
	await capture(app,"floor-two")
	# Send through Godot's input pipeline as well as the direct handler checks.
	key.echo = false
	key.keycode = KEY_D
	var previous_facing = app.active_character().M5899
	Input.parse_input_event(key)
	await process_frame
	check(app.active_character().M5899 == previous_facing % 4 + 1,"Godot input pipeline delivers dungeon hotkeys")
	key.pressed = false
	Input.parse_input_event(key)
	app.find_child("DungeonTake",true,false).pressed.emit()
	check(app.active_character().M5470 == 1 and app.active_character().M583F == 7 and app.active_character().M5845 == 6,"Actual floor-two up stairs return to matching first-floor coordinates")
	app.queue_free()
	await process_frame

func capture(app, name: String):
	if not "--capture-dungeon" in OS.get_cmdline_user_args(): return
	await process_frame
	await process_frame
	await RenderingServer.frame_post_draw
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
	app.get_viewport().get_texture().get_image().save_png("res://tests/screenshots/dungeon-" + name + ".png")
