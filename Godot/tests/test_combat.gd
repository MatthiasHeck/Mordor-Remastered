extends SceneTree
const Catalog = preload("res://core/original_data.gd")
const Combat = preload("res://core/combat_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Rules = preload("res://core/original_rules.gd")
const Codec = preload("res://core/vb_record.gd")
const Tape = preload("res://core/draw_tape.gd")
const Campaign = preload("res://core/campaign.gd")
var data = Catalog.new()
var checks = 0
var failures: Array = []
var directory: String
var originals: Dictionary = {}

func _initialize(): run.call_deferred()

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		failures.append(message)
		printerr(message)

func fixture() -> Dictionary:
	var c = Town.new().new_character(Rules.creation_state(0,data.tables.races[0].raw),"Combat test",0,"",data,46305)
	c.M5470 = 1
	c.M5997[0] = 0
	c.M5970 = 100000
	return c

func synthetic():
	var result = Catalog.new()
	result.schemas = data.schemas
	result.tables = data.tables.duplicate(true)
	return result

func groups_for(rules, count: int = 1, members: int = 1) -> Array:
	var result = []
	for index in 4:
		var group = rules.fixture_group(1,members)
		if index >= count:
			group.M4EDC = 0
			group.M4ED4 = -1
		result.append(group)
	return result

func hit_draws() -> Array: return [0.999,0.999,0.5,0.5,0.5,0.0]

func run():
	directory = "res://tests/tmp/combat-%d" % Time.get_ticks_usec()
	check(data.load_all(),"Load original combat data")
	for name in ["MDATA4.MDR","MDATA5.MDR","MDATA8.MDR","MDATA9.MDR","MDATA10.MDR"]:
		originals[name] = FileAccess.get_file_as_bytes("res://data/original/" + name)
	test_abilities()
	test_player()
	test_kills()
	test_monster()
	test_guards()
	await test_ui()
	for name in originals: check(FileAccess.get_file_as_bytes("res://data/original/" + name) == originals[name],"Original combat input unchanged: " + name)
	var file = FileAccess.open("res://tests/combat-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify({"checks":checks,"failures":failures,"scope":"Supplied-draw physical combat preview, state/draw atomicity, guild metadata, kills/replacement/quests/XP, monster groups, and campaign isolation. Original timer/RNG/encounter/runtime parity pending."},"\t") + "\n")
	print("COMBAT PASS" if failures.is_empty() else "COMBAT FAIL", ": ",checks," checks; ",failures.size()," failures")
	quit(0 if failures.is_empty() else 1)

func test_abilities():
	var catalog = synthetic()
	var c = fixture()
	var rules = Combat.new(catalog)
	c.M5584[0].M4E82 = 8
	catalog.tables.guilds[0].raw.M55BE[1] = 2.0
	catalog.tables.guilds[0].raw.M55BE[2] = 3.0
	catalog.tables.guilds[0].raw.M55BE[3] = 4.0
	for pair in [[1,16.0],[2,24.0],[3,32.0]]:
		var result = rules.ability(c,pair[0])
		check(result.value == pair[1] and result.guild == 0 and result.level == 8,"Guild ability product " + str(pair[0]))
	c.M5584[1].M4E82 = 4
	catalog.tables.guilds[1].raw.M55BE[1] = 4.0
	check(rules.ability(c,1).guild == 0,"Ability ties retain first joined guild")
	catalog.tables.guilds[1].raw.M55BE[1] = 5.0
	check(rules.ability(c,1).guild == 1 and rules.ability(c,1).rating == 5.0,"Winning guild metadata follows the computed ability")
	c.M5584[1].M4E82 = 0
	check(rules.ability(c,1).guild == 0,"Unjoined guild ability excluded")
	c.M56B9[6] = 8
	check(rules.defensive_bonus(c) == 13,"Defensive effect Integer rounding: ln(8)^2 × 3")
	c.M56B9[6] = 0
	check(rules.defensive_bonus(c) == 0,"No defense bonus from zero effect")
	c.M59BB = 0
	check(rules.ability(c,0).is_empty() and "context" in rules.error,"In-room trap ability cannot invent missing context")
	check(not rules.ability(c,0,false,1).is_empty(),"In-room trap ability accepts explicit original monster context")
	check(not rules.ability(c,0,true).is_empty(),"Outside-room trap formula requires no encounter")
	catalog.tables.guilds[0].raw.M55BE[5] = 0.0
	c.M55B5[2] = 10
	c.M584B[2] = 8
	c.M5584[0].M4E82 = 1
	check(rules.ability(c,5).value == 10.0,"Perception preserves WIS + modifier/4 precedence, minus depth × 2")
	check(rules.ability(c,99).is_empty(),"Unsupported ability index rejected")

func test_player():
	var rules = Combat.new(data)
	var c = fixture()
	var groups = groups_for(rules)
	var original = c.duplicate(true)
	var old_groups = groups.duplicate(true)
	var tape = Tape.new(hit_draws())
	var result = rules.action(c,groups,0,"player",tape)
	check(not result.is_empty(),"Replay physical player attack: " + rules.error)
	if result.is_empty(): return
	check(c == original and groups == old_groups,"Player action returns copies")
	check(result.attacks.size() == 1 and result.draws_used == 6,"Surviving hit stops that weapon after two special and four damage draws")
	check(result.events.map(func(event): return event.site) == ["sub1019.critical","sub1019.backstab","fn0DEE.base","fn0DEE.correction","fn0DEE.rare","fn0DEE.hit"],"Exact player draw-site order")
	check(result.attacks[0].arguments[1] == 0 and result.attacks[0].assigned_but_unused_defense == 6,"Literal unassigned defense parameter retained and visible in trace")
	check(result.groups[0].M4EAC == old_groups[0].M4EAC - result.attacks[0].actual,"Player hit debits original current-member HP")
	check(result.character.M579B > c.M579B and result.character.M4F2D == c.M4F2D,"Physical damage awards XP without inventing gold")
	check(tape.position == 6 and tape.events.size() == 6,"Successful action commits Rnd consumption")
	c.M5997 = [-1,-1]
	tape = Tape.new()
	result = rules.action(c,groups,0,"player",tape)
	check(result.attacks.is_empty() and tape.position == 0 and "Using no weapon!" in result.messages,"No weapon consumes no combat draws")
	c = fixture()
	c.M56B9[2] = 1
	result = rules.action(c,groups,0,"player",tape)
	check(result.attacks.is_empty() and tape.position == 0,"Recovered positive paralysis guard blocks player action")
	c.M56B9[2] = -1
	result = rules.action(c,groups,0,"player",Tape.new(hit_draws()))
	check(not result.is_empty() and not result.attacks.is_empty(),"Literal >0 paralysis check differs from a negative VB True flag")
	c = fixture()
	c.M5997 = [0,0]
	var miss = [0.999,0.999,0.5,0.5,0.5,0.999]
	result = rules.action(c,groups,0,"player",Tape.new(miss + miss))
	check(result.attacks.size() == 2 and result.draws_used == 12 and result.attacks[0].damage == 0 and result.attacks[1].damage == 0,"Miss ends only that weapon, second hand still attempts its swing")
	var catalog = synthetic()
	catalog.tables.monsters[1].raw.M55BE = 1 << 5
	rules = Combat.new(catalog)
	result = rules.action(fixture(),groups,0,"player",Tape.new())
	check(result.attacks.is_empty() and "Weapon has no effect!" in result.messages,"Physical immunity stops swings before RNG")
	catalog.tables.monsters[1].raw.M55BE = 1 << 4
	catalog.tables.monsters[1].raw.M5693 = 4
	result = rules.action(fixture(),groups,0,"player",Tape.new())
	check(result.attacks.is_empty(),"Weapon level threshold protects enchanted target")

func test_kills():
	var catalog = synthetic()
	catalog.tables.monsters[1].raw.M4EAC = 1
	catalog.tables.monsters[1].raw.M5467 = 777
	catalog.tables.items[0].raw.M56AF = 3
	catalog.tables.items[0].raw.M56F7 = 1.0
	var rules = Combat.new(catalog)
	var groups = groups_for(rules,2,2)
	groups[0].M4EAC = 1
	groups[1].M4EAC = 1000
	groups[1].M4EB4 = 1000
	var c = fixture()
	c.M4E97 = 100.0
	c.M55B5[0] = 100
	c.M5584[0].M4E82 = 10
	c.M5584[0].M55CB = 1
	c.M5584[0].M57A9 = 777
	var tape = Tape.new(hit_draws() + [0.75,0.0] + hit_draws() + hit_draws())
	var result = rules.action(c,groups,0,"player",tape)
	check(not result.is_empty(),"Kill/member replacement/retarget action: " + rules.error)
	if result.is_empty(): return
	check(result.kills == 2 and result.groups[0].M4EDC == 0 and result.target == 1,"Kills consume members and retarget next live group")
	check(result.attacks.size() == 3 and result.draws_used == 20,"Kill continuation preserves per-hand swing count and two replacement HP draws")
	check(result.events[6].site == "sub0D08.sign" and result.events[7].site == "sub0D08.health","Member replacement draws occur between weapon swings")
	check(result.character.M5906[0] == 20000 and result.character.M5906[3] == 10000,"Currency kill and quest counters increment by whole units")
	check(result.character.M5584[0].M57B2 == -1,"Quest completion compares logical monster ID and completes once")
	check(result.attacks[0].actual == 1 and result.attacks[0].damage > 1,"Overkill rewards use removed HP, not calculated damage")
	check(result.groups[1].M4EAC < 1000 and result.groups[1].M4EDC == 2,"Retargeted surviving member stops final swing")
	var final_groups = groups_for(rules,1,1)
	var victory = rules.action(c,final_groups,0,"player",Tape.new(hit_draws()))
	check(victory.outcome == "victory" and victory.target == -1 and victory.draws_used == 6,"Final kill ends action without replacement draws or invented loot")
	check(victory.character.M4F2D == c.M4F2D and victory.character.M58AF == c.M58AF,"Preview victory preserves gold balances")
	# Independent small XP vector: 1 damage, monster level 2, hero level 1 =>
	# 1*(.9-ln2/10)*5.2*2/(1+3/999)=8.613... => CLng 9.
	var xp = {"character":fixture(),"experience":0,"experience_added":0}
	xp.character.M5970 = 5
	check(rules.award_experience(xp,1,2,1.0),"Award solo XP candidate")
	check(xp.experience == 9 and xp.experience_added == 50000 and xp.character.M579B == 50000,"XP calculation rounds to 9 but current XP clamps at 5")
	check(rules.award_experience(xp,1,2,1.0) and xp.experience_added == 50000,"Pinned preview gains no additional XP")
	var group = rules.fixture_group(1,2)
	check(rules.replace_member(group,catalog.tables.monsters[1].raw,Tape.new([0.0,0.0])) and group.M4EAC == 0,"Literal low-HP next-member subtraction may reach zero")
	check(rules.replace_member(group,catalog.tables.monsters[1].raw,Tape.new([0.75,0.0])) and group.M4EAC == 2 and group.M4EB4 == 2,"Next-member HP addition updates maximum")
	# Fail after the first kill but before replacement completes: all state and
	# draw consumption must still roll back, making a longer trace retryable.
	var partial = Tape.new(hit_draws())
	var old_c = c.duplicate(true)
	var old_groups = groups.duplicate(true)
	check(rules.action(c,groups,0,"player",partial).is_empty() and "sub0D08.sign" in rules.error,"Missing replacement draw reports first unavailable site")
	check(c == old_c and groups == old_groups and partial.position == 0 and partial.events.is_empty(),"Incomplete kill action leaves XP, quests, HP, and draws untouched")

func test_monster():
	var rules = Combat.new(data)
	var c = fixture()
	var groups = groups_for(rules,1,9)
	var values = []
	for _index in 5: values.append_array([0.5,0.5,0.5,0.0])
	var result = rules.action(c,groups,0,"monster",Tape.new(values))
	check(not result.is_empty(),"Replay physical monster group: " + rules.error)
	if result.is_empty(): return
	check(result.attacks.size() == 5 and result.draws_used == 20,"At most five group members attack in one original action")
	var total = 0
	for hit in result.attacks: total += hit.damage
	check(result.character.M4EAC == maxi(0,c.M4EAC - total),"Group damage accumulates before one HP debit")
	check(result.character.M579B == c.M579B and result.groups == groups,"Monster attack changes no XP or group members")
	c.M4EAC = 1
	result = rules.action(c,groups,0,"monster",Tape.new(values))
	check(result.outcome == "defeat" and result.character.M4EAC == 0 and result.draws_used == 20,"Lethal group damage still consumes all five attacks before HP debit")
	check(rules.action(result.character,result.groups,0,"player",Tape.new()).is_empty(),"Defeated preview cannot continue acting")
	var catalog = synthetic()
	catalog.tables.monsters[1].raw.M5A35 = (1 << 10) | (1 << 11)
	rules = Combat.new(catalog)
	c = fixture()
	c.M56B9[6] = 8
	c.M4EA1 = 20
	groups = groups_for(rules)
	result = rules.action(c,groups,0,"monster",Tape.new([0.0,0.0,0.5,0.5,0.5,0.0]))
	check(result.draws_used == 6 and result.attacks[0].marks == 3072,"Monster critical/backstab flags add their rolls before damage")
	check(result.attacks[0].arguments[1] == 33,"Monster attack includes rounded defensive effect")
	check(result.events[0].site == "sub0E85.critical" and result.events[1].site == "sub0E85.backstab","Monster special roll order")
	catalog.tables.monsters[1].raw.M5A35 = 8
	check(rules.action(c,groups,0,"monster",Tape.new()).is_empty() and "special" in rules.error,"Unported breath/status effects reject whole monster action")
	catalog.tables.monsters[1].raw.M5A35 = 0
	catalog.tables.monsters[1].raw.M5A40 = 1
	check(rules.action(c,groups,0,"monster",Tape.new()).is_empty() and "spell" in rules.error,"Monster spell flags require actual casting port")

func test_guards():
	var rules = Combat.new(data)
	var c = fixture()
	var groups = groups_for(rules)
	var tape = Tape.new([0.5])
	check(rules.action(c,groups,0,"player",tape).is_empty() and "sub1019.backstab" in rules.error,"Missing supplied player draw gives source site")
	check(tape.position == 0 and tape.events.is_empty(),"Rejected action cannot consume partial random trace")
	check(rules.action(c,groups,0,"player",Tape.new([1.0])).is_empty(),"Invalid Rnd result rejected")
	check(rules.action(c,groups,0,"round",Tape.new()).is_empty(),"No fabricated whole-round actor")
	check(rules.action(c,groups.slice(0,3),0,"player",Tape.new()).is_empty(),"Missing allocated group slot rejected")
	groups[0].M4ED4 = 401
	check(rules.action(c,groups,0,"player",Tape.new()).is_empty(),"Invalid active table index rejected")
	groups = groups_for(rules)
	c.M5997[0] = 366
	check(rules.action(c,groups,0,"player",Tape.new()).is_empty(),"Invalid weapon index rejected")
	c = fixture()
	c.M58CB[0].M4ED4 = 1
	c.M58CB[0].M4EAC = 3
	check(rules.action(c,groups,0,"monster",Tape.new()).is_empty(),"Companions require their own combat translation")
	groups[0].M4EDC = 0
	check(Combat.active_group(groups,0) == -1,"No surviving groups returns -1")
	groups[3] = rules.fixture_group(1,1)
	check(Combat.active_group(groups,0) == 3,"Requested dead group falls back to first live slot")
	check(Combat.active_group(groups,3) == 3,"Live selected group retained")

func test_ui():
	var save = Campaign.new()
	check(save.open(directory,data),"Open preview campaign fixture")
	check(save.create_character(Rules.creation_state(0,data.tables.races[0].raw),"Preview player",0,"",46305),"Create preview campaign character")
	var before = save.records.bytes.duplicate()
	var log_before = save.guild_log.bytes.duplicate()
	var app = load("res://ui/game.tscn").instantiate()
	app.save_directory = directory
	root.add_child(app)
	await process_frame
	app.find_child("EnterTown",true,false).pressed.emit()
	app.find_child("CombatPreview",true,false).pressed.emit()
	var panel = app.find_child("CombatPanel",true,false)
	check(panel != null and not app.dungeon_page,"Combat preview opens from town and disables dungeon input")
	panel.find_child("CombatHands",true,false).button_pressed = true
	panel.find_child("ResetCombat",true,false).pressed.emit()
	check(panel.character.M5997[0] == 0 and app.active_character().M5997[0] == -1,"Preview Hands equip leaves campaign equipment unchanged")
	panel.find_child("CombatPlayerAttack",true,false).pressed.emit()
	check(not panel.error_label.text.is_empty() and panel.tape.position == 0,"UI refuses automatic random fallback")
	panel.find_child("ExampleCombatDraws",true,false).pressed.emit()
	panel.find_child("LoadCombatDraws",true,false).pressed.emit()
	check(panel.tape.values.size() == 256 and panel.tape.position == 0,"Explicit example tape loads")
	panel.find_child("CombatPlayerAttack",true,false).pressed.emit()
	check(panel.tape.position == 6 and panel.last_result.status == "combat_action_preview_not_saved","Native player action advances preview trace")
	check(not panel.trace.text.is_empty() and panel.last_result.attacks.size() == 1,"Native trace displays translated damage arguments")
	await capture(app,"player")
	panel.find_child("CombatMonsterAttack",true,false).pressed.emit()
	check(panel.tape.position == 10 and panel.last_result.attacks[0].actor == "monster","Native monster action advances same tape")
	await capture(app,"monster")
	panel.draws.text = "0.1"
	panel.find_child("LoadCombatDraws",true,false).pressed.emit()
	check(panel.tape.position == 10 and "Consumed" in panel.error_label.text,"Loaded tape cannot rewrite consumed results")
	panel.draws.text = "NaN"
	panel.find_child("LoadCombatDraws",true,false).pressed.emit()
	check(panel.tape.position == 10 and "finite" in panel.error_label.text,"UI rejects nonfinite random data")
	panel.group_count.value = 2
	panel.reset_preview()
	panel.group_list.select(1)
	panel.group_list.item_selected.emit(1)
	check(panel.target == 1 and panel.groups[0].M4EDC == 1 and panel.groups[1].M4EDC == 1,"Native preview target selection chooses another live group")
	panel.draws.text = "0.5 0.5 0.5 0.5 0.5 0.5"
	panel.load_draws()
	panel.step("player")
	check(panel.last_result.attacks[0].target == 1 and panel.groups[0].M4EAC == 5 and panel.groups[1].M4EAC == 4,"Native selected target receives damage")
	panel.monster_picker.select(100) # Flame Devil has unported special attacks.
	panel.reset_preview()
	check(panel.monster_button.disabled and not panel.error_label.text.is_empty(),"Unsupported special monster actions clearly disabled")
	app.find_child("CloseCombatPreview",true,false).pressed.emit()
	check(app.find_child("Bank",true,false) != null and app.active_character().M4EAC == 15,"Return to town retains actual health")
	check(FileAccess.get_file_as_bytes(save.path) == before and FileAccess.get_file_as_bytes(save.path.get_base_dir().path_join("MDATA9.MDR")) == log_before,"Combat preview never writes character or guild-log bytes")
	app.find_child("EnterDungeon",true,false).pressed.emit()
	var dungeon_before = app.campaign.records.bytes.duplicate()
	var map_before = app.campaign.automap.bytes.duplicate()
	app.find_child("CombatPreview",true,false).pressed.emit()
	app.find_child("CloseCombatPreview",true,false).pressed.emit()
	check(app.dungeon_page and app.active_character().M5470 == 1,"Preview returns to active expedition")
	check(app.campaign.records.bytes == dungeon_before and app.campaign.automap.bytes == map_before,"Dungeon preview preserves position and discoveries")
	app.queue_free()
	await process_frame
	var workbench = load("res://ui/main.tscn").instantiate()
	root.add_child(workbench)
	await process_frame
	check(workbench.tabs.get_tab_count() == 9 and workbench.find_child("CombatPanel",true,false) != null,"Workbench contains standalone combat preview")
	workbench.tabs.current_tab = 8
	var lab = workbench.find_child("CombatPanel",true,false)
	lab.equip_hands.button_pressed = true
	lab.reset_preview()
	lab.draws.text = "0.5 0.5 0.5 0.5 0.5 0.5"
	lab.load_draws()
	lab.step("player")
	check(lab.last_result.status == "combat_action_preview_not_saved","Standalone preview works without a campaign character")
	await capture(workbench,"workbench")
	workbench.queue_free()
	await process_frame

func capture(app, name: String):
	if not "--capture-combat" in OS.get_cmdline_user_args(): return
	await process_frame
	await process_frame
	await RenderingServer.frame_post_draw
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
	app.get_viewport().get_texture().get_image().save_png("res://tests/screenshots/combat-" + name + ".png")
