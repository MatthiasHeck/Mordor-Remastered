extends SceneTree
const Data = preload("res://core/original_data.gd")
const Campaign = preload("res://core/campaign.gd")
const Battle = preload("res://core/battle_rules.gd")
const Rng = preload("res://core/vb_rng.gd")
const Tape = preload("res://core/draw_tape.gd")
const Town = preload("res://core/town_rules.gd")
const Rules = preload("res://core/original_rules.gd")
const Codec = preload("res://core/vb_record.gd")
const World = preload("res://core/world_encounters.gd")
const Generator = preload("res://core/encounter_generator.gd")
var data = Data.new()
var failures = []
var checks = 0
class FailedCombatInstall extends "res://core/save_transaction.gd":
	func install(path: String, existed: bool) -> bool:
		if path.get_file() == "combat-state.json":
			error = "Injected combat-state installation failure"
			return false
		return super.install(path,existed)
class InterruptedCombatInstall extends FailedCombatInstall:
	func recover(_directory: String) -> bool:
		error = "Injected interruption before rollback"
		return false
func _initialize(): run.call_deferred()
func check(value: bool, message: String):
	checks += 1
	if not value:
		failures.append(message)
		printerr(message)
func fixture() -> Dictionary:
	var c = Town.new().new_character(Rules.creation_state(0,data.tables.races[0].raw),"Battle",0,"",data,46305)
	c.M5470 = 1
	c.M59BB = 1
	c.M5997[0] = 0
	c.M5970 = 100000
	return c
func room(rules, members: int = 1) -> Dictionary:
	var groups = []
	for index in 4:
		var group = rules.fixture_group(1,members)
		if index > 0:
			group.M4EDC = 0
			group.M4ED4 = -1
		groups.append(group)
	groups[0].M4ECC = 1
	var meta = Codec.new(PackedByteArray(),data.schemas).blank("T4F0B")
	meta.M4F24 = 1
	return {"groups":groups,"meta":meta}
func run():
	check(data.load_all(),"Load battle data")
	var rng = Rng.new()
	var halfword_seed = 0x50000
	for _index in 10000:
		var lo = halfword_seed & 0xffff
		var hi = halfword_seed >> 16
		var product = lo * 0x43fd
		var added = (product & 0xffff) + 0x9ec3
		var high = ((product >> 16) + hi * 0x43fd + lo * 0x43fd + 0xc3 + (added >> 16)) & 0xff
		halfword_seed = (high << 16) | (added & 0xffff)
		check(rng.draw("test") == halfword_seed / 16777216.0,"RNG agrees with recovered halfword update")
	check(Rng.new().draw("first") == 0.7055475115776062,"Default-seed golden first draw")
	var rules = Battle.new(data)
	var c = fixture()
	var r = room(rules)
	var input = Tape.new([0.5,0.5,0.5,0.5,0.0,0.999,0.999])
	var result = rules.round_action(c,r,"defend",0,-1,input)
	check(not result.is_empty(),"Campaign round accepts physical monster: " + rules.error)
	if not result.is_empty():
		check(input.position == 7,"Solo target + four damage + unconditional poison/disease draws")
		check(result.character.M4EAC <= c.M4EAC,"Round applies monster damage")
	var short = Tape.new([0.5])
	check(rules.round_action(c,r,"defend",0,-1,short).is_empty() and short.position == 0 and not rules.error.is_empty(),"Insufficient round draws roll back with a visible error")
	check(c == fixture(),"Round preserves input character")
	test_spells()
	test_specials()
	test_special_outcomes()
	var world = World.new(data)
	var original = FileAccess.get_file_as_bytes("res://data/original/MDATA10.MDR")
	check(world.load_bytes(original),"Read original world encounters")
	check(world.put(15,200,r),"Write final room including original short metadata tail")
	check(world.records.bytes.size() == original.size(),"Encounter update preserves file length")
	check(world.records.bytes.slice(0,(World.first_record(15,200) - 1) * 28) == original.slice(0,(World.first_record(15,200) - 1) * 28),"Encounter update preserves unrelated bytes")
	check(world.room(15,200) == r,"Encounter binary round trip")
	var generator = Generator.new(data)
	var generated = generator.generate(c,Rng.new(),0)
	check(not generated.is_empty(),"Generate first-area encounter: " + generator.error)
	test_generation()
	var directory = "res://tests/tmp/battle-%d" % Time.get_ticks_usec()
	var campaign = Campaign.new()
	check(campaign.open(directory,data),"Open battle campaign")
	check(campaign.create_character(Rules.creation_state(0,data.tables.races[0].raw),"Battle",0,"",46305),"Create campaign fighter")
	check(campaign.dungeon_action(3,"enter",46305),"Dungeon entry prepares saved encounters: " + campaign.error)
	var reload = Campaign.new()
	check(reload.open(directory,data),"Reload saved battle campaign: " + reload.error)
	check(reload.combat_state.rng.state == campaign.combat_state.rng.state and reload.combat_state.rng.draws == campaign.combat_state.rng.draws and reload.combat_state.rooms == campaign.combat_state.rooms and reload.world.records.bytes == campaign.world.records.bytes,"Reload retains world and RNG together")
	test_persistence(campaign,directory)
	test_outcomes(directory.path_join("outcomes"))
	await test_ui(directory)
	check(FileAccess.get_file_as_bytes("res://data/original/MDATA10.MDR") == original,"Original encounter data unchanged")
	var file = FileAccess.open("res://tests/battle-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify({"checks":checks,"failures":failures,"scope":"Static VB RNG candidate; saved solo rounds, spells/special attack outcomes, ailments, original room records, generation sweep and guarded branches, victory/death, reload/rollback/interruption/stale writers and native UI. No original-runtime comparison; companions/chests/remaining spells and generation branches remain partial."},"\t") + "\n")
	print("BATTLE PASS" if failures.is_empty() else "BATTLE FAIL",": ",checks," checks; ",failures.size()," failures")
	quit(0 if failures.is_empty() else 1)

func test_special_outcomes():
	var catalog = synthetic()
	var rules = Battle.new(catalog)
	var c = fixture()
	c.M4EAC = 1000
	c.M4EB4 = 1000
	c.M4EA1 = 0
	for index in 11: c.M5548[index] = 0
	var m = catalog.tables.monsters[1].raw
	m.M4E97 = 100
	m.M5A7C = 10
	m.M5693 = 2
	m.M5A40 = 0
	var physical = [0.5,0.5,0.5,0.0]
	for pair in [[3,"Breath deals 11 damage."],[5,"Acid deals 21 damage."]]:
		m.M5A35 = 1 << pair[0]
		var tape = Tape.new([0.5,0.0,0.5] + physical + [0.999,0.999])
		var result = rules.round_action(c,room(rules),"defend",0,-1,tape)
		check(not result.is_empty() and result.messages[0] == pair[1],"Forced elemental damage matches independent Integer calculation: " + pair[1])
		check(tape.position == 9,"Elemental gate/damage precede physical and two unconditional status draws")
	m.M5A35 = 1 << 9
	var aged = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.999,0.5,0.999,0.999]))
	check(not aged.is_empty() and aged.character.M5577 == c.M5577 + 365,"Age attack clamps random days to the one-year bound")
	m.M5A35 = 1 << 7
	var drained = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.0,0.999,0.999,0.999,0.999,0.999]))
	check(not drained.is_empty() and drained.character.M4EB4 == 998,"Drain stat selector six removes two maximum HP")
	m.M5A35 = 1 << 12
	c.M5857[1].M4ED4 = 1
	c.M5857[1].M5467 = catalog.tables.items[1].raw.M5467
	c.M5857[2].M4ED4 = 2
	catalog.tables.items[1].raw.M5693 = 1
	catalog.tables.items[1].raw.M56B9 = 0
	var destroyed = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.999,0.999,0.0,0.999]))
	check(not destroyed.is_empty() and destroyed.character.M5857[1].M4ED4 == 0 and destroyed.character.M5857[1].M5467 == -1 and destroyed.character.M5857[2] == c.M5857[2],"Destruction clears chosen slot and preserves neighboring inventory")
	catalog.tables.items[1].raw.M56B9 = 500
	var token = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.999,0.999,0.0,0.999]))
	check(not token.is_empty() and token.character.M5857[1] == c.M5857[1],"Guild token is protected from destruction")
	c.M5857[2].M4ED4 = 0
	m.M5A35 = 1 << 13
	var stolen = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.999,0.999,0.0,0.0,0.001,0.0,0.999]))
	check(not stolen.is_empty() and stolen.character.M4F2D == 0 and stolen.groups[0].M4EDC == 0 and stolen.kills == 0,"Thief removes available gold and escapes without awarding a kill")
	var recovered = rules.round_action(c,room(rules),"defend",0,-1,Tape.new([0.5] + physical + [0.999,0.999,0.0,0.0,0.001,0.0,0.0]))
	check(not recovered.is_empty() and recovered.recovered_gold == c.M4F2D and recovered.groups[0].M4EDC == 1,"Non-fleeing theft retains exact recoverable Currency gold")

func synthetic():
	var result = Data.new()
	result.schemas = data.schemas
	result.tables = data.tables.duplicate(true)
	result.floors = data.floors.duplicate(true)
	return result

func test_spells():
	var catalog = synthetic()
	var rules = Battle.new(catalog)
	var c = fixture()
	c.M5584[0].M4E82 = 10
	c.M5830 = 100
	var s = catalog.tables.spells[1].raw # Shock: ordinary damage, effect zero.
	s.M56B9 = 0
	s.M5709 = 2
	s.M5B5B = 2
	catalog.tables.monsters[1].raw.M55BE = 0
	catalog.tables.monsters[1].raw.M5548[2] = 0
	for stat in 6: s.M5B4F[stat] = 0
	s.M4E82 = 1
	s.M556D = 2
	s.M5B33 = 100
	s.M5B41 = 1
	s.M5B28 = 1
	s.M5B1D = 1
	catalog.tables.guilds[0].raw.M55F6[s.M5709] = 1.0
	catalog.tables.guilds[0].raw.M55F6[s.M5709 + 19] = 99.0
	var r = room(rules)
	r.groups[0].M4EAC = 1000
	var cost = rules.spell_cost(c,s)
	var tape = Tape.new([0.999,0.0,0.5,0.999,0.999,0.999,0.999,0.999,0.999])
	var result = rules.round_action(c,r,"spell",0,1,tape)
	check(not result.is_empty(),"Ordinary effect-zero spell casts as damage: " + rules.error)
	if not result.is_empty():
		check(result.groups[0].M4EAC < 1000 and result.character.M5830 == 100 - cost,"Spell damages target and debits exact quoted SP")
		check(result.attacks[0].actor == "player_spell","Player spell precedes enemy attack")
	var no_sp = c.duplicate(true)
	no_sp.M5830 = 0
	var rng = Rng.new()
	check(rules.round_action(no_sp,r,"spell",0,1,rng).is_empty() and rng.position == 0,"Insufficient SP rejects cast and rolls back RNG")
	var rounded = c.duplicate(true)
	rounded.M5584[0].M4E82 = 1
	catalog.tables.guilds[0].raw.M55F6[s.M5709] = 1.4
	check(rules.spell_reason(rounded,1).is_empty(),"Casting eligibility rounds scaled spell level before comparing half-level")
	catalog.tables.guilds[0].raw.M55F6[s.M5709] = 1.0
	check(rules.spell_hits(s,5,[100,100,100,100,100,100,100,100,100,100,100,100],1000,Tape.new([0.5])) == 0,"Full resistance nullifies spell damage")
	s.M56B9 = 100
	check(rules.spell_hits(s,5,[0,0,0,0,0,0,0,0,0,0,0,0],1000,Tape.new([0.5])) == 0,"Killing-only spell fails against surviving target")
	var mage = catalog.tables.monsters[1].raw
	for index in catalog.tables.spells.size():
		if index != 1: catalog.tables.spells[index].raw.M4E82 = 99
	mage.M5A40 = 1 << s.M5709
	mage.M5693 = 1
	catalog.tables.monster_types[mage.M4ED4].name = "Mage"
	var draws = []
	for _i in 100: draws.append(0.5)
	draws[0] = s.M5709 / 18.0 + 0.001
	check(rules.select_monster_spell(mage,Tape.new(draws)) >= 0,"Monster spell selection searches supplied category mask")

func test_specials():
	var catalog = synthetic()
	var rules = Battle.new(catalog)
	var c = fixture()
	c.M4EAC = 1000
	c.M4EB4 = 1000
	c.M4EA1 = 0
	c.M5548[4] = 0
	c.M5548[5] = 0
	var m = catalog.tables.monsters[1].raw
	m.M4E97 = 100
	m.M5A35 = 3 # Poison + disease.
	m.M5A40 = 0
	m.M5693 = 2
	var r = room(rules)
	var result = rules.round_action(c,r,"defend",0,-1,Tape.new([0.5,0.5,0.5,0.5,0.0,0.999,0.999]))
	check(not result.is_empty(),"Status attack resolves: " + rules.error)
	if not result.is_empty(): check(result.character.M56B9[0] == 2 and result.character.M56B9[1] == 2,"Poison/disease apply original first-level severity after hit")
	c.M56B9[0] = 2
	c.M56B9[1] = 1
	var ailment = rules.ailments(c,r.groups,Tape.new([0.0,0.0]))
	check(not ailment.is_empty() and ailment.character.M4EAC == 997,"Four-second ailment action applies poison and disease damage")
	var paralyzed = c.duplicate(true)
	paralyzed.M55B5[0] = 20
	var attack = paralyzed.M4E97
	rules.paralysis(paralyzed,4)
	check(paralyzed.M56B9[2] == 4 and paralyzed.M4E97 < attack,"Paralysis removes stat contribution")
	rules.paralysis(paralyzed,0)
	check(paralyzed.M56B9[2] == 0 and paralyzed.M4E97 == attack,"Paralysis cure restores stat contribution")
	paralyzed.M56B9[2] = 4
	paralyzed.M5584[0].M4E82 = 10
	paralyzed.M55B5[3] = 30
	var cured = rules.ailments(paralyzed,r.groups,Tape.new([0.0,0.0,0.09]))
	check(not cured.is_empty() and cured.character.M56B9[2] == 0,"Paralysis recovery subtracts level, CON and resistance from severity chance")
	for flag in [3,4,5,6,7,8,9,10,11,12,13]:
		m.M5A35 = 1 << flag
		var rng = Rng.new(0x50000)
		var out = rules.round_action(c,room(rules),"defend",0,-1,rng)
		check(not out.is_empty(),"Special attack flag %d executes without script error: %s" % [flag,rules.error])
	var lethal = fixture()
	lethal.M4EAC = 1
	lethal.M4EA1 = 0
	m.M5A35 = 0
	result = rules.round_action(lethal,room(rules),"defend",0,-1,Tape.new([0.5,0.5,0.5,0.5,0.0]))
	check(not result.is_empty() and result.outcome == "defeat" and result.character.M5483 == 1 and result.character.M5906[1] == 10000,"Lethal damage marks death and increments Currency death counter once")

func test_persistence(campaign, directory: String):
	var c = campaign.character_at(3).duplicate(true)
	c.M4EAC = 1000
	c.M4EB4 = 1000
	c.M5997[0] = 0
	check(campaign.update_character(3,c),"Prepare persistent combat fixture")
	var rules = Battle.new(data)
	var r = room(rules,3)
	r.groups[0].M4EAC = 999
	var next_world = campaign.world.copy()
	check(next_world.put(c.M5470,c.M59BB,r),"Install known persistent room")
	check(campaign.commit(campaign.records,null,null,next_world,campaign.combat_state),"Save persistent room")
	var before = campaign.combat_state.rng.duplicate(true)
	check(campaign.combat_tick(3,"attack",0,-1,46305),"Execute saved player/enemy round: " + campaign.error)
	check(campaign.combat_state.rng.draws > before.draws,"Committed round advances saved RNG")
	var reloaded = Campaign.new()
	check(reloaded.open(directory,data),"Open mid-combat saved state")
	check(reloaded.character_at(3) == campaign.character_at(3) and reloaded.encounter(campaign.character_at(3)) == campaign.encounter(campaign.character_at(3)),"Reload resumes exact wounded character and member HP")
	var expected_rng = Rng.new(int(campaign.combat_state.rng.state),int(campaign.combat_state.rng.draws))
	var expected = rules.round_action(campaign.character_at(3),campaign.encounter(campaign.character_at(3)),"defend",0,-1,expected_rng)
	check(reloaded.combat_tick(3,"defend",0,-1,46305),"Reloaded campaign can continue same round sequence")
	check(not expected.is_empty() and reloaded.character_at(3) == expected.character and reloaded.combat_state.rng.state == expected_rng.state,"Reloaded round matches uninterrupted deterministic result")
	var snapshots = {}
	for name in ["MDATA4.MDR","MDATA10.MDR","combat-state.json"]: snapshots[name] = FileAccess.get_file_as_bytes(directory.path_join(name))
	var memory = reloaded.character_at(3).duplicate(true)
	var seed = reloaded.combat_state.rng.duplicate(true)
	reloaded.transaction = FailedCombatInstall.new()
	check(not reloaded.combat_tick(3,"defend",0,-1,46305),"Failure installing RNG rejects whole round")
	check(reloaded.character_at(3) == memory and reloaded.combat_state.rng == seed,"Failed save preserves in-memory character and RNG")
	for name in snapshots: check(FileAccess.get_file_as_bytes(directory.path_join(name)) == snapshots[name],"Failed round restores disk " + name)
	reloaded.transaction = InterruptedCombatInstall.new()
	check(not reloaded.combat_tick(3,"defend",0,-1,46305) and not reloaded.loaded,"Interrupted rollback stops further campaign writes")
	var recovered = Campaign.new()
	check(recovered.open(directory,data),"Reopen recovers interrupted combat transaction")
	for name in snapshots: check(FileAccess.get_file_as_bytes(directory.path_join(name)) == snapshots[name],"Interrupted round recovers disk " + name)
	check(recovered.combat_state.rng.state == seed.state and recovered.combat_state.rng.draws == seed.draws,"Interrupted round restores exact RNG state")
	check(not campaign.combat_tick(3,"defend",0,-1,46305) and "changed" in campaign.error,"Stale campaign cannot overwrite another writer's combat round")

func test_ui(directory: String):
	var app = load("res://ui/game.tscn").instantiate()
	app.save_directory = directory
	root.add_child(app)
	await process_frame

	app.password_input.text = ""
	app.find_child("EnterTown",true,false).pressed.emit()
	app.battle_paused = true
	app.show_dungeon()
	check(app.find_child("CampaignCombat",true,false) != null and app.find_child("BattleAttack",true,false) != null,"Dungeon exposes campaign combat controls")
	var before = app.campaign.combat_state.rng.draws
	app._process(2)
	check(app.campaign.combat_state.rng.draws == before,"Paused dungeon consumes no combat draws")
	app.battle_paused = false
	app.hide()
	app._process(2)
	check(app.campaign.combat_state.rng.draws == before,"Hidden dungeon consumes no combat draws")
	app.show()
	app.find_child("BattleAttack",true,false).pressed.emit()
	app._process(1.01)
	check(app.campaign.combat_state.rng.draws > before,"Attack control queues a real saved round")
	app.battle_paused = true
	if "--capture-battle" in OS.get_cmdline_user_args():
		await process_frame
		await process_frame
		await RenderingServer.frame_post_draw
		DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
		app.get_viewport().get_texture().get_image().save_png("res://tests/screenshots/campaign-battle.png")
	var c = app.active_character().duplicate(true)
	c.M4EAC = 500
	c.M5584[0].M4E82 = 10
	c.M5830 = 100
	for stat in 6: c.M55B5[stat] = 30
	for guild in data.tables.guilds.size(): c.M5584[guild].M4E82 = 20
	var empty = app.campaign.encounter(c)
	for group in empty.groups:
		group.M4EDC = 0
		group.M4ED4 = -1
	empty.meta.M4F1B = 0
	empty.meta.M4F2D = 0
	var next_world = app.campaign.world.copy()
	check(next_world.put(c.M5470,c.M59BB,empty) and app.campaign.update_character(3,c,null,null,next_world,app.campaign.combat_state),"Prepare cleared-room healing UI")
	app.show_dungeon()
	var spells = app.find_child("BattleSpell",true,false)
	var heal_option = -1
	for index in spells.item_count:
		if spells.get_item_text(index).begins_with("Minor Heal"): heal_option = index
	check(heal_option > 0,"Cleared room exposes available healing spell")
	if heal_option > 0:
		spells.select(heal_option)
		spells.item_selected.emit(heal_option)
		app._process(1.01)
		check(app.active_character().M4EAC > 500 and app.active_character().M5830 < 100,"Queued healing works after battle and persists HP/SP")
	app.show_roster()
	before = app.campaign.combat_state.rng.draws
	app._process(10)
	check(app.campaign.combat_state.rng.draws == before,"Roster stops combat with no catch-up rounds")
	app.queue_free()
	await process_frame

func test_outcomes(directory: String):
	var save = Campaign.new()
	check(save.open(directory,data),"Open outcome campaign")
	check(save.create_character(Rules.creation_state(0,data.tables.races[0].raw),"Victor",0,"",46305),"Create outcome character")
	var c = fixture()
	c.M548B = "Victor"
	c.M5962 = 3
	c.M4EAC = 1000
	c.M4EB4 = 1000
	c.M4E97 = 1000
	var rules = Battle.new(data)
	var r = room(rules)
	r.groups[0].M4EAC = 1
	r.meta.M4F2D = 100 * 10000
	var next_world = save.world.copy()
	check(next_world.put(1,1,r),"Prepare victory encounter")
	var state = save.combat_state.duplicate(true)
	state.rooms.append("1:1")
	check(save.update_character(3,c,null,null,next_world,state),"Save outcome setup")
	var gold = c.M4F2D
	var remaining = save.world.records.record(2).i16()
	var won = false
	for _round in 20:
		if not save.combat_tick(3,"attack",0,-1,46305): break
		if save.last_battle.outcome == "victory":
			won = true
			break
	check(won,"Player can win a persistent encounter: " + save.error)
	check(save.character_at(3).M4F2D == gold + 50 * 10000,"Victory collects source loose-gold half share")
	check(save.encounter(save.character_at(3)).meta.M4F2D == 0 and save.encounter(save.character_at(3)).groups[0].M4ED4 == -1,"Victory clears gold and first-group marker")
	check(save.world.records.record(2).i16() == remaining - 1,"Victory decrements remaining-room count once")
	check(save.combat_tick(3,"wait",-1,-1,46305) and save.character_at(3).M4F2D == gold + 50 * 10000 and save.world.records.record(2).i16() == remaining - 1,"Cleared-room tick cannot duplicate rewards/counter")
	var reloaded = Campaign.new()
	check(reloaded.open(directory,data) and reloaded.resume_combat(3),"Reload a cleared encounter")
	check(Battle.active_group(reloaded.encounter(reloaded.character_at(3)).groups) < 0,"Reload does not regenerate cleared room")
	c = reloaded.character_at(3).duplicate(true)
	c.M4EAC = 1
	c.M4EA1 = 0
	r = room(rules)
	next_world = reloaded.world.copy()
	check(next_world.put(1,1,r) and reloaded.update_character(3,c,null,null,next_world,reloaded.combat_state),"Prepare lethal encounter")
	var died = false
	for _round in 20:
		if not reloaded.combat_tick(3,"defend",0,-1,46305): break
		if reloaded.last_battle.outcome == "defeat":
			died = true
			break
	check(died and reloaded.character_at(3).M5483 == 1,"Campaign persists lethal encounter death")
	check(reloaded.guild_log.entries[-1].message == '"Victor" died on level 1.',"Campaign saves original-format death log")
	check(not reloaded.combat_tick(3,"attack",0,-1,46305) and reloaded.character_at(3).M5906[1] == 10000,"Defeated character cannot act or duplicate death counter")
	check(save.open(directory,data) and save.character_at(3).M5483 == 1 and save.character_at(3).M4EAC == 0,"Reload retains death without invented revival")

func test_generation():
	var generator = Generator.new(data)
	var c = fixture()
	var guarded = []
	var generated = 0
	for floor_data in data.floors:
		var seen = {}
		for index in floor_data.cells.size():
			var cell = floor_data.cells[index]
			if cell.area <= 0 or cell.area > 200 or cell.area in seen: continue
			seen[cell.area] = true
			c.M5470 = floor_data.floor
			c.M59BB = cell.area
			c.M583F = index % floor_data.width + 1
			c.M5845 = int(index / float(floor_data.width)) + 1
			var rng = Rng.new(0x50000 + cell.area)
			var room_value = generator.generate(c,rng,0)
			if room_value.is_empty():
				guarded.append({"floor":c.M5470,"area":c.M59BB,"reason":generator.error})
				check(not generator.error.is_empty(),"Generation guard provides explicit failure")
			else:
				generated += 1
				check(room_value.groups.size() == 4,"Generated room has four allocated groups")
	var report = FileAccess.open("res://tests/encounter-generation-results.json",FileAccess.WRITE)
	report.store_string(JSON.stringify({"generated":generated,"guarded":guarded,"scope":"One controlled seed per original populated area; generation candidate, not an executable comparison."},"\t") + "\n")
	print("GENERATION: ",generated," rooms; ",guarded.size()," guarded source branches")
