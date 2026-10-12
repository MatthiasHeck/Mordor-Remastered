extends SceneTree
const Catalog = preload("res://core/original_data.gd")
const Campaign = preload("res://core/campaign.gd")
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Money = preload("res://core/currency.gd")
var checks = 0
var failures: Array = []
var directory: String

func _initialize(): run.call_deferred()

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		failures.append(message)
		printerr(message)

func write(path: String, bytes: PackedByteArray):
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(path.get_base_dir()))
	var file = FileAccess.open(path,FileAccess.WRITE)
	file.store_buffer(bytes)
	file.close()

func run():
	directory = "res://tests/tmp/run-%d" % Time.get_ticks_usec()
	var data = Catalog.new()
	check(data.load_all(),"Load original data")
	var original = FileAccess.get_file_as_bytes("res://data/original/MDATA4.MDR")
	var money = Money.new()
	for pair in [["0",0],["1500",15000000],["-0.0001",-1],["900719925474.0993",9007199254740993],["922337203685477.5807",Money.MAX_RAW],["-922337203685477.5808",Money.MIN_RAW]]:
		check(money.parse(pair[0]) == pair[1] and money.error.is_empty(),"Exact Currency parse " + pair[0])
		check(Money.display(pair[1]) == pair[0],"Exact Currency formatting " + pair[0])
	for text in ["","abc","1e4","1,000","1.00001","922337203685477.5808","-922337203685477.5809"]:
		money.parse(text)
		check(not money.error.is_empty(),"Reject invalid Currency " + text)
	var save = Campaign.new()
	check(save.open(directory,data),"Initialize separate campaign: " + save.error)
	check(save.characters.is_empty() and not FileAccess.file_exists(save.path),"Opening empty roster does not write source or save")
	var state = Rules.creation_state(0,data.tables.races[0].raw)
	for i in 6:
		while Rules.adjust_creation_stat(state,data.tables.races[0].raw,i,1): pass
	check(state.points == 0,"Spend legal initial allocation")
	check(save.create_character(state,"Éowyn",1,"secret",46305),"Create binary character: " + save.error)
	if save.characters.is_empty():
		finish()
		return
	var c = save.characters[0].raw
	check(c.M4F2D == 15000000 and c.M58AF == 0,"Original initial 1500 carried gold")
	check(c.M4EAC == 15 and c.M4EB4 == 15 and c.M5584[0].M4E82 == 1,"Initial HP and Nomad level")
	check(c.M5906[6] == 463050000 and c.M583F == 9 and c.M5845 == 11,"VB date and original town coordinates")
	check(c.M5914 == [-1,-1,0,0,0,1] and c.M59B0[9] == -1 and c.M59B0[10] == 0,"Inclusive unused array slots retained")
	check(c.M58CB[0].M4ED4 == -1 and c.M58CB[4].M4ED4 == 0,"Companion initializer retains unused fifth slot")
	var town = Town.new()
	check(c.M5970 == town.next_experience(c,data.tables.guilds[0].raw,data.tables.races[0].raw) and c.M5584[0].M4E82 == 1,"Next XP does not mutate current level")
	# Synthetic independently calculated formula vectors, not original runtime fixtures.
	var fake = c.duplicate(true)
	fake.M5584[0].M4E82 = 2
	check(town.experience_required(fake,{"M557E":1.0},{"M557E":0.0}) == 46,"XP assignment sequence, race factor 1, level 2")
	check(town.training_price(fake,{"M4F2D":1.0}) == 132,"Training loop Long rounding, level 2")
	var before = FileAccess.get_file_as_bytes(save.path)
	check(not save.create_character(state,"éOWYN",0,"",46305),"Duplicate names reject case-insensitively")
	check(not save.create_character(state,"Bad|Name",0,"",46305),"Delimiter in name rejected")
	check(not save.create_character(state,"龍",0,"",46305),"Unencodable name rejected")
	check(not save.create_character(state,"Long password",0,"01234567890",46305),"Password cannot truncate")
	var invalid = state.duplicate(true)
	invalid.M55B5[0] += 1
	check(not save.create_character(invalid,"Cheated",0,"",46305),"Unbalanced stats rejected")
	check(FileAccess.get_file_as_bytes(save.path) == before,"Invalid creation leaves file unchanged")
	var copy = c.duplicate(true)
	check(town.bank_transfer(copy,2500001,true),"Deposit fractional Currency")
	check(copy.M4F2D == 12499999 and copy.M58AF == 2500001,"Exact balanced deposit")
	check(save.update_character(3,copy),"Persist bank operation")
	check(FileAccess.get_file_as_bytes(save.path + ".bak") == before,"Previous complete save retained as backup")
	var reopened = Campaign.new()
	check(reopened.open(directory,data),"Reload saved character")
	check(reopened.characters[0].raw.M58AF == 2500001 and reopened.characters[0].raw.M548B.strip_edges() == "Éowyn","Reload retains gold and CP1252 name")
	var disk = FileAccess.get_file_as_bytes(save.path)
	check(disk.slice(0,2900) == original.slice(0,2900),"Original header record untouched")
	var counts = original.slice(2900,5800)
	counts.encode_s16(0,1)
	check(disk.slice(2900,5800) == counts,"Only count bytes change in record 2")
	copy = reopened.characters[0].raw.duplicate(true)
	check(not town.bank_transfer(copy,3000000,false),"Overdraft rejected")
	check(not town.bank_transfer(copy,-1,true),"Negative deposit rejected")
	check(town.bank_transfer(copy,-10000,false) and copy.M58AF == 2510001,"Recovered negative withdrawal branch retained")
	copy.M4F2D = Money.MAX_RAW
	copy.M58AF = 1
	var snapshot = copy.duplicate(true)
	check(not town.bank_transfer(copy,1,false) and copy == snapshot,"Overflow rejects entire transfer")
	copy.M4F2D = 9007199254740993
	copy.M58AF = 0
	check(save.update_character(3,copy),"Save exact Currency beyond float precision")
	check(not reopened.update_character(3,reopened.characters[0].raw),"Stale second window cannot overwrite newer save")
	check(reopened.open(directory,data) and reopened.characters[0].raw.M4F2D == 9007199254740993,"64-bit Currency survives disk reload")
	check(save.create_character(state,"Second",0,"",46305),"Append second character to partial final record")
	check(save.characters.size() == 2 and save.characters[1].record_index == 4,"Appended physical record index")
	check(FileAccess.get_file_as_bytes(save.path).slice(5800,8687) == disk_character(copy,data),"Appending preserves previous record")
	# Torn/corrupt files must fail closed, never reset to an empty campaign.
	for pair in [["truncated",PackedByteArray([3,0,49])],["bad-count",save.records.bytes.duplicate()]]:
		if pair[0] == "bad-count": pair[1].encode_s16(2900,99)
		var bad_dir = directory.path_join(pair[0])
		write(bad_dir.path_join("MDATA4.MDR"),pair[1])
		var bad = Campaign.new()
		check(not bad.open(bad_dir,data),"Reject " + pair[0])
		check(not bad.create_character(state,"Do not overwrite",0,"",46305),"Failed open cannot be followed by a write")
		check(FileAccess.get_file_as_bytes(bad.path) == pair[1],"Corrupt input left intact")
	var recovery_dir = directory.path_join("recovery")
	write(recovery_dir.path_join("MDATA4.MDR.bak"),save.records.bytes)
	var recovery = Campaign.new()
	check(recovery.open(recovery_dir,data) and recovery.characters.size() == 2,"Recover backup when final rename was interrupted")
	check(recovery.update_character(3,recovery.characters[0].raw),"Recovered state can commit")
	var protected = Campaign.new()
	check(not protected.open("res://data/original",data),"Reject source data as save destination")
	check(FileAccess.get_file_as_bytes("res://data/original/MDATA4.MDR") == original,"Original character bytes unchanged")
	await test_interface()
	finish()

func disk_character(character: Dictionary, data) -> PackedByteArray:
	var codec = preload("res://core/vb_record.gd").new(PackedByteArray(),data.schemas)
	codec.write_type("T5810",character)
	return codec.data

func test_interface():
	var app = load("res://ui/game.tscn").instantiate()
	app.save_directory = directory.path_join("ui")
	root.add_child(app)
	await process_frame
	check(app.find_child("Roster",true,false).item_count == 0,"New app opens empty roster")
	app.find_child("NewCharacter",true,false).pressed.emit()
	check(app.creation.M5821 == 0,"New-character button opens allocation")
	app.name_input.text = "UI Adventurer"
	app.password_input.text = "gate"
	app.password_again.text = "different"
	app.request_create()
	check(app.status.text == "Passwords do not match.","Password confirmation validation")
	app.password_again.text = "gate"
	for i in 6:
		while app.creation.points > 0 and app.creation.M55B5[i] < app.catalog.tables.races[0].raw.M553C[i]: app.adjust_stat(i,1)
	await capture(app,"creation")
	app.find_child("SaveCharacter",true,false).pressed.emit()
	check(app.campaign.characters.size() == 1,"Native create signal saves character")
	await capture(app,"roster")
	app.find_child("EnterTown",true,false).pressed.emit()
	check(app.status.text == "Incorrect character password.","Town entry requires stored password")
	app.password_input.text = "gate"
	app.find_child("EnterTown",true,false).pressed.emit()
	check(app.active_slot == 3,"Town entry uses selected character")
	await capture(app,"town")
	app.find_child("Bank",true,false).pressed.emit()
	app.amount_input.text = "250.25"
	app.find_child("Deposit",true,false).pressed.emit()
	check(app.active_character().M58AF == 2502500,"Native deposit saves bank balance")
	check(app.status.text == "Transaction saved.","Deposit confirms committed result")
	await capture(app,"bank")
	app.amount_input.text = "9999"
	app.find_child("Withdraw",true,false).pressed.emit()
	check(app.active_character().M58AF == 2502500,"Rejected native withdraw leaves balance intact")
	app.show_roster()
	app.password_input.text = "gate"
	app.enter_town()
	app.show_guilds()
	await capture(app,"guilds")
	app.queue_free()
	await process_frame
	var reopened = load("res://ui/game.tscn").instantiate()
	reopened.save_directory = directory.path_join("ui")
	root.add_child(reopened)
	await process_frame
	check(reopened.campaign.characters[0].raw.M58AF == 2502500,"Restart application retains bank transaction")
	reopened.queue_free()
	await process_frame

func capture(app, name: String):
	if not "--capture-game" in OS.get_cmdline_user_args(): return
	await process_frame
	await process_frame
	await RenderingServer.frame_post_draw
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
	app.get_viewport().get_texture().get_image().save_png("res://tests/screenshots/game-" + name + ".png")

func finish():
	var file = FileAccess.open("res://tests/campaign-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify({"checks":checks,"failures":failures,"scope":"Candidate town rules, transactional binary saves, native application flows"},"\t") + "\n")
	print("CAMPAIGN PASS" if failures.is_empty() else "CAMPAIGN FAIL", ": ",checks," checks; ",failures.size()," failures")
	quit(0 if failures.is_empty() else 1)
