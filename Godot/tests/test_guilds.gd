extends SceneTree
const Catalog = preload("res://core/original_data.gd")
const Campaign = preload("res://core/campaign.gd")
const Guild = preload("res://core/guild_rules.gd")
const Rules = preload("res://core/original_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Log = preload("res://core/guild_log.gd")
const Transaction = preload("res://core/save_transaction.gd")
const Tape = preload("res://core/draw_tape.gd")
const Money = preload("res://core/currency.gd")
const Equipment = preload("res://core/equipment.gd")
var checks = 0
var failures: Array = []
var data = Catalog.new()
var directory: String
var original_log_bytes = PackedByteArray()

# Inject a disk failure AFTER installing the first file, not a mirrored rule test.
class FailedInstall extends "res://core/save_transaction.gd":
	var installed = 0
	func install(path: String, existed: bool) -> bool:
		installed += 1
		if installed == 2:
			error = "Injected second-file failure"
			return false
		return super.install(path,existed)

class InterruptedInstall extends FailedInstall:
	func recover(_directory: String) -> bool:
		error = "Simulated process interruption before rollback"
		return false

func _initialize(): run.call_deferred()

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		failures.append(message)
		printerr(message)

func fixture() -> Dictionary:
	var state = Rules.creation_state(0,data.tables.races[0].raw)
	var c = Town.new().new_character(state,"Guild fixture",0,"",data,46305)
	for stat in 6: c.M55B5[stat] = data.tables.races[0].raw.M553C[stat]
	return c

func run():
	directory = "res://tests/tmp/guilds-%d" % Time.get_ticks_usec()
	check(data.load_all(),"Load originals")
	original_log_bytes = FileAccess.get_file_as_bytes("res://data/original/MDATA9.MDR")
	test_log()
	test_membership()
	test_payments()
	test_knowledge_and_growth()
	test_equipment()
	test_persistence()
	await test_ui()
	var file = FileAccess.open("res://tests/guild-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify({"checks":checks,"failures":failures,"runtime_parity_verified":false,"scope":"Guild transitions, growth segments, supplied draw order, native UI and multi-file failure recovery"},"\t") + "\n")
	print("GUILDS PASS" if failures.is_empty() else "GUILDS FAIL", ": ",checks," checks; ",failures.size()," failures")
	quit(0 if failures.is_empty() else 1)

func test_log():
	var bytes = FileAccess.get_file_as_bytes("res://data/original/MDATA9.MDR")
	var log = Log.new()
	check(log.load_bytes(bytes) and log.bytes == bytes,"Original guild log is lossless")
	var count = log.entries.size()
	check(log.append(1,46305,'"Ægir" joined our guild.'),"Append CP1252 guild log")
	var reader = preload("res://core/vb_record.gd").new(log.bytes.slice(bytes.size()))
	check(reader.i16() == 1 and reader.i32() == 46305 and reader.vb_string() == '"Ægir" joined our guild.',"Sequential guild/date/length/text fields")
	check(log.bytes.decode_s16(0) == count + 1,"Log count increments")
	var roundtrip = Log.new()
	check(roundtrip.load_bytes(log.bytes) and roundtrip.entries[-1].guild_id == 1,"Reload appended log")
	var before = log.bytes.duplicate()
	check(not log.append(1,0,"龍") and log.bytes == before,"Unencodable log does not mutate bytes")
	check(not roundtrip.load_bytes(PackedByteArray([1,0,1])),"Reject truncated guild log")

func test_membership():
	var rules = Guild.new(data)
	var c = fixture()
	var before = c.duplicate(true)
	var quote = rules.join_quote(c,1)
	check(quote.allowed and quote.fee == 0 and quote.low_level_warning,"First additional guild free with below-10 warning")
	var result = rules.join(c,1)
	check(not result.is_empty(),"Join Warrior")
	if result.is_empty(): return
	check(c == before,"Membership rule does not mutate its caller")
	c = result.character
	check(c.M58BB == 1 and c.M5584[0].M4E82 == 1 and c.M5584[1].M4E82 == 1,"Both memberships retained; new guild starts at 1")
	c.M579B = 1234567
	c.M5584[0].M579B = 7654321
	result = rules.join(c,0)
	check(not result.is_empty() and result.character.M579B == 7654321 and result.character.M5584[1].M579B == 1234567,"Switch saves and restores exact per-guild XP")
	check(not result.new_member and result.fee == 0,"Re-acquaint is free and not a new membership")
	quote = rules.join_quote(c,8)
	check(quote.allowed and quote.fee > 0 and quote.must_pay,"Third guild has calculated joining fee")
	before = c.duplicate(true)
	check(rules.join(c,8).is_empty() and rules.error == "Not enough gold." and c == before,"Insufficient joining fee is atomic")
	c.M4F2D = 0
	c.M58AF = quote.fee * 10000
	result = rules.join(c,8)
	check(not result.is_empty() and result.character.M58AF == 0,"Joining fee can be paid entirely from bank")
	c = fixture()
	c.M55B5[0] = 1
	check(not rules.join_quote(c,1).allowed,"New member needs natural minimum stats")
	c.M5584[1].M4E82 = 7
	check(rules.join_quote(c,1).allowed,"Existing member need not repeat natural stat requirements")
	c.M4EBF = 2
	check(not rules.join_quote(c,2).allowed,"Evil character cannot join Paladin")
	c = fixture()
	c.M5857[0].M577E = 1
	c.M5857[0].M572A = -1
	check(not rules.join_quote(c,1).allowed,"Cursed item in reserved slot blocks guild change")
	c.M5857[0].M572A = 0
	c.M5857[0].M4ED4 = 32000
	check(rules.join_quote(c,1).allowed,"Post-switch equipment check skips reserved slot zero")
	c.M5857[1].M577E = 1
	c.M5857[1].M4ED4 = 32000
	check(not rules.join_quote(c,1).allowed,"Invalid equipped item blocks transition without charging")
	var item = data.tables.items[0].raw.duplicate(true)
	item.M56E6 = 1 << 0
	item.M5742 = -1
	item.M560D = 0
	item.M5712.fill(0)
	c.M58BB = 1
	c.M5584[1].M4E82 = 1
	check(not rules.can_keep_equipped(c,item),"Guild-specific item cannot follow a switch")
	item.M5742 = 0
	check(rules.can_keep_equipped(c,item),"Nonexclusive item can use former guild membership")
	for vector in [[0,9,"Vagrant"],[0,10,"Drifter"],[0,220,"Master Nomad"],[11,249,"Raiser of the Dead"],[11,250,"Master Healer"]]:
		c.M58BB = vector[0]
		c.M5584[vector[0]].M4E82 = vector[1]
		check(rules.title(c) == vector[2],"Original title boundary " + str(vector))

func test_payments():
	var rules = Guild.new(data)
	for vector in [[50000,0,3,20000,0,3],[15000,100000,3,0,80000,2],[25000,100000,3,0,100000,0],[0,100000,3,0,70000,3]]:
		var c = fixture()
		c.M4F2D = vector[0]
		c.M58AF = vector[1]
		var result = rules.pay(c,vector[2])
		check(not result.is_empty() and c.M4F2D == vector[3] and c.M58AF == vector[4] and result.by_ref_price == vector[5],"Original payment and ByRef rounding " + str(vector))
	var c = fixture()
	c.M4F2D = 10000
	c.M58AF = 10000
	var before = c.duplicate(true)
	check(rules.pay(c,3).is_empty() and c == before,"Insufficient payment preserves both balances")
	check(rules.pay(c,2147483648).is_empty() and c == before,"Long price overflow preserves balances")
	# A simple synthetic third-guild fee: (1+1)*1.25 + 3/3 = 3.5; 3.5²*5356 = 65611.
	var synthetic = Catalog.new()
	synthetic.tables = data.tables.duplicate(true)
	var guild = synthetic.tables.guilds[8].raw
	guild.M55BE.fill(0.0)
	guild.M55BE[0] = 1.0
	guild.M55F6.fill(0.0)
	guild.M55F6[19] = 3.0
	c = fixture()
	c.M5584[1].M4E82 = 1
	var quote = Guild.new(synthetic).join_quote(c,8)
	check(quote.allowed and quote.fee == 65611 and quote.fee_raw == 656110000,"Fee uses second VB array dimension and Currency assignments")

func test_knowledge_and_growth():
	var synthetic = Catalog.new()
	synthetic.tables = data.tables.duplicate(true)
	var guild = synthetic.tables.guilds[0].raw
	guild.M5591 = 10
	guild.M559A = 10
	guild.M55A4 = 2
	guild.M561A = 100
	guild.M5626 = 2.0
	guild.M4E97 = 2.0
	guild.M4EA1 = 1.0
	guild.M55BE.fill(0.0)
	var rules = Guild.new(synthetic)
	var c = fixture()
	c.M4E97 = 10.0
	c.M4EA1 = 10.0
	c.M55B5[3] = 18
	var before = c.duplicate(true)
	var result = rules.growth_preview(c,Tape.new([0.1,0.5,0.75]))
	check(not result.has("error"),"Growth replay succeeds")
	if result.has("error"): return
	check(result.hp == 29 and result.hp_gain == 14 and result.level == 2,"HP = 15 + branch bonus 2 + guild 10 + constitution 2")
	check(result.attack == 12.0 and result.defense == 11.0,"A/D rise at guild divisor")
	check(result.events.size() == 3 and result.events[2].site == "cmdMake.constitution_bonus","Three random draws in recovered order")
	check(c == before,"Growth replay never changes source character")
	result = rules.growth_preview(c,Tape.new([0.9,0.75]))
	check(result.hp == 27 and result.events.size() == 2,"Third HP branch skips bonus draw")
	check(rules.growth_preview(c,Tape.new([0.1])).has("error"),"Missing growth draw is an error, not a fallback RNG")
	c.M5584[1].M4E82 = 2
	result = rules.growth_preview(c,Tape.new())
	check(result.hp == 15 and result.events.is_empty() and not result.highest_level,"Equal existing guild level grants no HP or HP draws")
	c.M5584[1].M4E82 = 0
	c.M5584[0].M4E82 = 10
	result = rules.growth_preview(c,Tape.new())
	check(result.hp == 17 and result.events.is_empty(),"Beyond HP breakpoint uses fixed increment")
	c.M5584[0].M4E82 = 9
	result = rules.growth_preview(c,Tape.new([0.9]))
	check(result.hp == 25 and result.events.size() == 1,"No constitution bonus at exact breakpoint")
	c = fixture()
	c.M5584[0].M4E97 = 4.0
	c.M5584[1].M4E97 = 5.0
	c.M4E97 = 20.0
	rules.adjust_guild_ad(c,0)
	check(c.M5584[0].M4E97 == 6 and c.M4E97 == 21,"Only new highest guild AD contribution added")
	rules.adjust_guild_ad(c,0,true)
	check(c.M5584[0].M4E97 == 4 and c.M4E97 == 20,"Demotion removes only contribution beyond other guilds")
	for row in synthetic.tables.guilds: row.raw.M55F6.fill(0.0)
	synthetic.tables.guilds[0].raw.M55F6[0] = 1.25
	synthetic.tables.guilds[0].raw.M55F6[19] = 3.0
	var spell = {"M5709":0,"M4E82":1}
	c = fixture()
	c.M5584[0].M4E82 = 1
	check(not rules.knows_spell(c,spell),"Spell learning needs level times guild factor")
	c.M5584[0].M4E82 = 2
	check(rules.knows_spell(c,spell),"Knowledge comparison keeps fractional half-level")
	check(rules.casting_guild(c,spell).level == 1,"Casting level independently floors half-level")
	synthetic.tables.guilds[1].raw.M55F6[0] = 1.0
	synthetic.tables.guilds[1].raw.M55F6[19] = 3.0
	c.M5584[1].M4E82 = 2
	check(rules.casting_guild(c,spell).guild == 0,"Casting ties retain earliest qualifying guild")
	c.M5584[1].M4E82 = 10
	check(rules.casting_guild(c,spell).guild == 1,"Highest eligible guild supplies casting level")
	spell.M4E82 = 4
	check(not rules.knows_spell(c,spell),"Category spell cap enforced")
	c = fixture()
	var actual = Guild.new(data)
	var requirements = actual.training_requirements(c)
	check(not requirements.ready and requirements.experience < c.M5970,"Training threshold and pin cap are distinct")
	c.M579B = requirements.experience * 10000
	check(actual.training_requirements(c).ready,"Exact XP training boundary")
	c.M5584[0].M55CB = 1
	c.M5584[0].M57A9 = data.tables.monsters[0].raw.M5467
	check(not actual.training_requirements(c).ready,"Incomplete monster quest blocks training")
	c.M5584[0].M57B2 = -1
	check(actual.training_requirements(c).ready,"Completed monster quest passes preflight")
	c.M5584[0].M55CB = 2
	c.M5584[0].M57A9 = data.tables.items[1].raw.M5467
	c.M5857[0].M4ED4 = 1
	check(not actual.training_requirements(c).ready,"Item quest reserved-slot-zero quirk retained")
	c.M5857[0].M4ED4 = 0
	c.M5857[1].M4ED4 = 1
	check(actual.training_requirements(c).ready,"Item quest sees first normal inventory slot")
	c.M5584[0].M4E82 = 999
	check(not actual.training_requirements(c).ready,"Level cap blocks training")

func test_persistence():
	var save = Campaign.new()
	check(save.open(directory,data),"Open guild campaign")
	var state = Rules.creation_state(0,data.tables.races[0].raw)
	for i in 6:
		while Rules.adjust_creation_stat(state,data.tables.races[0].raw,i,1): pass
	check(save.create_character(state,"Guild test",0,"",46305),"Create with Nomad log entry")
	check(save.guild_log.entries[-1].guild_id == 0 and save.guild_log.entries[-1].message == '"Guild test" joined our guild.',"Creation logs initial membership")
	var old_character = FileAccess.get_file_as_bytes(save.path)
	var log_path = save.path.get_base_dir().path_join("MDATA9.MDR")
	var old_log = FileAccess.get_file_as_bytes(log_path)
	save.transaction = FailedInstall.new()
	check(not save.join_guild(3,1,46306),"Second-file failure rejects whole membership save")
	check(FileAccess.get_file_as_bytes(save.path) == old_character and FileAccess.get_file_as_bytes(log_path) == old_log,"Failure restores character and log together")
	check(save.characters[0].raw.M58BB == 0 and save.guild_log.bytes == old_log,"Failure preserves in-memory membership and log")
	save.transaction = InterruptedInstall.new()
	check(not save.join_guild(3,1,46306) and not save.loaded,"Interrupted rollback locks writes until reopen")
	check(FileAccess.file_exists(save.path.get_base_dir().path_join(Transaction.JOURNAL)),"Interrupted transaction keeps recovery journal")
	var recovered = Campaign.new()
	check(recovered.open(directory,data),"Reopen recovers interrupted multi-file save")
	check(recovered.characters[0].raw.M58BB == 0 and recovered.guild_log.bytes == old_log,"Recovery restores coherent old character/log pair")
	check(not FileAccess.file_exists(save.path.get_base_dir().path_join(Transaction.JOURNAL)),"Journal removed only after recovery")
	check(recovered.join_guild(3,1,46306),"Recovered campaign can join guild")
	check(recovered.characters[0].raw.M58BB == 1 and recovered.guild_log.entries[-1].guild_id == 1,"Joined guild and matching log both committed")
	check(FileAccess.get_file_as_bytes(recovered.path + ".bak") == old_character and FileAccess.get_file_as_bytes(log_path + ".bak") == old_log,"Both prior complete files kept as backups")
	var reopened = Campaign.new()
	check(reopened.open(directory,data) and reopened.characters[0].raw.M58BB == 1,"Guild membership reloads")
	var count = reopened.guild_log.entries.size()
	check(reopened.join_guild(3,0,46307) and reopened.guild_log.entries.size() == count,"Re-acquaint does not log a duplicate join")
	check(FileAccess.get_file_as_bytes("res://data/original/MDATA9.MDR") == original_log_bytes,"Original log untouched")
	# Invalid journals must not allow path traversal or partially restore any entry.
	var bad_dir = directory.path_join("bad-journal")
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(bad_dir))
	var file = FileAccess.open(bad_dir.path_join(Transaction.JOURNAL),FileAccess.WRITE)
	file.store_string('{"format":1,"files":[{"name":"../outside","before":{"exists":false},"backup":{"exists":false}}]}')
	file.close()
	check(not Transaction.new().recover(ProjectSettings.globalize_path(bad_dir)),"Reject journal path traversal")

func test_equipment():
	var synthetic = Catalog.new()
	synthetic.tables = data.tables.duplicate(true)
	synthetic.tables.item_subtypes[0].raw.M54D5 = 0
	synthetic.tables.item_classes[0].raw.M54F1 = 2
	var item = synthetic.tables.items[2].raw
	item.M548B = "Fixture blade"
	item.M5709 = 0
	item.M560D = 0
	item.M5700 = 1
	item.M56E6 = 1
	item.M5742 = -1
	item.M5712.fill(0)
	item.M571E.fill(0)
	item.M571E[0] = 2
	item.M4E97 = 5
	item.M4EA1 = 3
	item.M572A = 0
	item.M55BE = 5
	item.M5548 = 1
	item.M56DB = 3
	var c = fixture()
	c.M5857[1].M4ED4 = 2
	c.M5857[1].M4EBF = 1
	var original = c.duplicate(true)
	var rules = Guild.new(synthetic)
	var equipment = Equipment.new(synthetic)
	var worn = equipment.toggle(c,1,rules.can_use_item)
	check(not worn.is_empty(),"Equip a permitted item")
	if worn.is_empty(): return
	check(c == original,"Equipment rules never mutate input")
	check(worn.M4E97 == c.M4E97 + 9 and worn.M4EA1 == c.M4EA1 + 7,"Item AD and added strength AD applied separately")
	check(worn.M584B[0] == 2 and worn.M5700 == 1 and worn.M586D[0] == 1,"Modifiers, hands and item-class count")
	check(worn.M5977 == 5 and worn.M5985[0] == 90 and worn.M5548[0] == 90,"Equipped abilities and resistance flags")
	check(worn.M56B9[3] == -1 and worn.M56B9[6] == 1 and worn.M5997[0] == 2,"Derived effects and weapon index")
	var bare = equipment.toggle(worn,1,rules.can_use_item)
	check(not bare.is_empty() and bare.M4E97 == c.M4E97 and bare.M4EA1 == c.M4EA1,"Unequipping restores attack and defense")
	check(bare.M584B == c.M584B and bare.M5700 == 0 and bare.M5997 == [-1,-1],"Unequipping restores modifiers, hands and weapon slots")
	var result = rules.join(worn,1)
	check(not result.is_empty(),"Switch with incompatible equipment succeeds")
	if not result.is_empty():
		check(result.unequipped == [1] and result.character.M5857[1].M577E == 0,"Guild switch automatically unequips incompatible item")
		check(result.character.M4E97 == c.M4E97 and result.character.M5700 == 0,"Automatic unequip includes stat and hand side effects")
	worn.M5857[1].M572A = 1
	check(equipment.toggle(worn,1,rules.can_use_item).is_empty(),"Cursed equipment cannot be removed normally")
	check(not equipment.toggle(worn,-1,rules.can_use_item).is_empty(),"Original negative-slot force-removal path")
	check(not rules.join_quote(worn,1).allowed,"Curse blocks guild auto-unequip")
	c.M5857[1].M4EBF = 2
	worn = equipment.toggle(c,1,rules.can_use_item)
	check(not worn.is_empty() and worn.M4E97 == c.M4E97 + 4 and worn.M4EA1 == c.M4EA1 + 4,"Adjacent alignment halves AD with nearest-even assignment and halves stats with floor")
	check(worn.M5977 == 0 and worn.M5985[0] == 0,"Mismatched alignment gives no item abilities/resistance")
	c.M5857[1].M4EBF = 3
	worn = equipment.toggle(c,1,rules.can_use_item)
	check(not worn.is_empty() and worn.M4E97 == c.M4E97 - 9 and worn.M5857[1].M572A == 1,"Opposite alignment reverses bonuses and attaches curse")
	c.M5700 = 2
	check(equipment.toggle(c,1,rules.can_use_item).is_empty(),"Free hands enforced on equip")
	c.M5700 = 0
	c.M586D[0] = 2
	check(equipment.toggle(c,1,rules.can_use_item).is_empty(),"Item-class limit enforced")
	c.M586D[0] = 0
	c.M55B5[0] = data.tables.races[0].raw.M5530[0]
	check(equipment.toggle(c,1,rules.can_use_item).is_empty(),"Alignment penalty cannot violate racial minimum")
	c = original.duplicate(true)
	c.M5857[1].M4EEE = 0
	check(equipment.item_name(c.M5857[1]) == "Fixture blade (g) [0]","Fully identified label includes alignment and depleted charges")
	c.M5857[1].M4EEE = 1
	check(equipment.item_name(c.M5857[1]) == "Fixture blade","Mostly identified hides alignment and charges")
	c.M5857[1].M4EEE = 2
	check(equipment.item_name(c.M5857[1]) == synthetic.tables.item_subtypes[0].name,"Partial identification reveals subtype only")
	c.M5857[1].M4EEE = 3
	check(equipment.item_name(c.M5857[1]) == synthetic.tables.item_classes[0].name,"Bare identification reveals class only")
	c.M5857[1].M4EEE = 99
	check(equipment.item_name(c.M5857[1]) == "Unidentified Item","Unknown identification value stays concealed")

func test_ui():
	var app = load("res://ui/game.tscn").instantiate()
	app.save_directory = directory
	root.add_child(app)
	await process_frame
	app.find_child("EnterTown",true,false).pressed.emit()
	app.find_child("GuildRecords",true,false).pressed.emit()
	var list = app.find_child("GuildList",true,false)
	var warrior = app.guild_choices.find(1)
	list.select(warrior)
	list.item_selected.emit(warrior)
	check(app.visited_guild == 1,"Native guild selection visits a guild")
	check(app.find_child("JoinGuild",true,false).text == "Re-acquaint","Existing membership offers re-acquaint")
	app.find_child("JoinGuild",true,false).pressed.emit()
	check(app.active_character().M58BB == 1,"Native guild switch persists active membership")
	await capture(app,"guilds")
	app.find_child("GuildLog",true,false).pressed.emit()
	check('"Guild test" joined our guild.' in app.find_child("GuildLogText",true,false).text,"Guild log shown in native screen")
	await capture(app,"guild-log")
	app.show_spellbook()
	check(app.find_child("KnownSpells",true,false) != null,"Spell knowledge screen opens")
	app.find_child("SpellSearch",true,false).text_changed.emit("no-such-spell")
	check(app.find_child("KnownSpells",true,false).item_count == 0,"Known-spell search filters list")
	app.queue_free()
	await process_frame
	var fresh = Campaign.new()
	var fresh_dir = directory.path_join("new-membership-ui")
	check(fresh.open(fresh_dir,data),"Open new UI membership fixture")
	var state = Rules.creation_state(0,data.tables.races[0].raw)
	for i in 6:
		while Rules.adjust_creation_stat(state,data.tables.races[0].raw,i,1): pass
	check(fresh.create_character(state,"New member",0,"",46305),"Create native membership fixture")
	app = load("res://ui/game.tscn").instantiate()
	app.save_directory = fresh_dir
	root.add_child(app)
	await process_frame
	app.find_child("EnterTown",true,false).pressed.emit()
	app.show_guilds()
	app.visit_guild(1)
	app.find_child("JoinGuild",true,false).pressed.emit()
	var dialog = app.find_child("ConfirmGuild",true,false)
	check(dialog != null and app.active_character().M58BB == 0,"New membership waits for game confirmation")
	await capture(app,"join-confirmation")
	dialog.canceled.emit()
	await process_frame
	check(app.active_character().M58BB == 0,"Cancelling join keeps membership")
	app.find_child("JoinGuild",true,false).pressed.emit()
	dialog = app.find_child("ConfirmGuild",true,false)
	dialog.confirmed.emit()
	await process_frame
	check(app.active_character().M58BB == 1 and app.campaign.guild_log.entries[-1].guild_id == 1,"Confirmed native join saves character and guild log")
	app.show_inventory()
	check(app.find_child("InventoryList",true,false).item_count == 1,"New character inventory exposes reserved Hands slot")
	app.find_child("ToggleEquipment",true,false).pressed.emit()
	check(app.active_character().M5857[0].M577E == 1 and app.active_character().M5700 == 2,"Native equip action persists Hands and hand usage")
	await capture(app,"inventory")
	app.find_child("ToggleEquipment",true,false).pressed.emit()
	check(app.active_character().M5857[0].M577E == 0 and app.active_character().M5700 == 0,"Native unequip action restores hand usage")
	app.queue_free()
	await process_frame

func capture(app, name: String):
	if not "--capture-guilds" in OS.get_cmdline_user_args(): return
	await process_frame
	await process_frame
	await RenderingServer.frame_post_draw
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
	app.get_viewport().get_texture().get_image().save_png("res://tests/screenshots/" + name + ".png")
