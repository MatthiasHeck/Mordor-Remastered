extends VBoxContainer
## Interactive migration preview. Never owns a campaign or writes save files.
const Combat = preload("res://core/combat_rules.gd")
const Town = preload("res://core/town_rules.gd")
const Rules = preload("res://core/original_rules.gd")
const Equipment = preload("res://core/equipment.gd")
const Guild = preload("res://core/guild_rules.gd")
const Tape = preload("res://core/draw_tape.gd")
const Money = preload("res://core/currency.gd")
var catalog
var source_character: Dictionary = {}
var character: Dictionary = {}
var groups: Array = []
var tape = Tape.new()
var monster_picker: OptionButton
var member_count: SpinBox
var group_count: SpinBox
var equip_hands: CheckBox
var draws: TextEdit
var group_list: ItemList
var hero_info: Label
var hero_health: ProgressBar
var portrait: TextureRect
var tape_info: Label
var messages: TextEdit
var trace: TextEdit
var error_label: Label
var player_button: Button
var monster_button: Button
var target = 0
var history: Array[String] = []
var last_result: Dictionary = {}

func add_label(parent: Node, text: String, node_name: String = "") -> Label:
	var control = Label.new()
	control.text = text
	control.autowrap_mode = TextServer.AUTOWRAP_OFF if parent is HBoxContainer else TextServer.AUTOWRAP_WORD_SMART
	if not node_name.is_empty(): control.name = node_name
	parent.add_child(control)
	return control

func add_button(parent: Node, text: String, node_name: String, callback: Callable) -> Button:
	var control = Button.new()
	control.text = text
	control.name = node_name
	control.pressed.connect(callback)
	parent.add_child(control)
	return control

func add_text(parent: Node, node_name: String, height: float, editable: bool = false) -> TextEdit:
	var control = TextEdit.new()
	control.name = node_name
	control.editable = editable
	control.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	control.custom_minimum_size.y = height
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(control)
	return control

func _ready():
	name = "CombatPanel"
	add_theme_constant_override("separation",6)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_label(self,"Preview a character copy with supplied draws. Encounters, timers, spells, companions, loot and death services remain pending. Preview changes are not saved.")
	var setup = HBoxContainer.new()
	add_child(setup)
	monster_picker = OptionButton.new()
	monster_picker.name = "CombatMonster"
	monster_picker.custom_minimum_size.x = 210
	for index in catalog.tables.monsters.size():
		var monster = catalog.tables.monsters[index]
		monster_picker.add_item("%s  ·  record %d / ID %d" % [monster.name,index,monster.raw.M5467],index)
	setup.add_child(monster_picker)
	monster_picker.select(1)
	add_label(setup,"Members / group")
	member_count = SpinBox.new()
	member_count.name = "CombatMembers"
	member_count.min_value = 1
	member_count.max_value = 30
	member_count.value = 1
	setup.add_child(member_count)
	add_label(setup,"Groups")
	group_count = SpinBox.new()
	group_count.min_value = 1
	group_count.max_value = 4
	group_count.value = 1
	setup.add_child(group_count)
	var draw_header = HBoxContainer.new()
	add_child(draw_header)
	equip_hands = CheckBox.new()
	equip_hands.name = "CombatHands"
	equip_hands.text = "Equip Hands in preview"
	draw_header.add_child(equip_hands)
	add_button(draw_header,"Reset preview","ResetCombat",reset_preview)
	tape_info = add_label(draw_header,"Supplied Rnd results, in [0, 1).", "CombatDrawCount")
	tape_info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_button(draw_header,"Load draws","LoadCombatDraws",load_draws)
	add_button(draw_header,"Example draws","ExampleCombatDraws",func():
		var example = PackedStringArray()
		for _index in 256: example.append("0.5")
		draws.text = " ".join(example)
		error_label.text = "Synthetic 0.5 results for preview only. Load them, or supply your own trace.")
	draws = add_text(self,"CombatDraws",44,true)
	draws.placeholder_text = "Enter whitespace- or comma-separated Rnd results. No automatic RNG is substituted."
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",20)
	add_child(split)
	var hero = VBoxContainer.new()
	hero.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(hero)
	hero_info = add_label(hero,"", "CombatHero")
	hero_health = ProgressBar.new()
	hero_health.name = "CombatHeroHealth"
	hero_health.custom_minimum_size.y = 20
	hero.add_child(hero_health)
	add_label(hero,"Step each actor separately; original initiative is pending.")
	var monsters = VBoxContainer.new()
	monsters.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(monsters)
	group_list = ItemList.new()
	group_list.name = "CombatGroups"
	group_list.custom_minimum_size = Vector2(320,100)
	monsters.add_child(group_list)
	group_list.item_selected.connect(func(index):
		target = index
		refresh())
	portrait = TextureRect.new()
	portrait.name = "CombatPortrait"
	portrait.custom_minimum_size = Vector2(96,96)
	portrait.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	portrait.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	split.add_child(portrait)
	var actions = HBoxContainer.new()
	add_child(actions)
	player_button = add_button(actions,"Player attack","CombatPlayerAttack",func(): step("player"))
	monster_button = add_button(actions,"Monster attack","CombatMonsterAttack",func(): step("monster"))
	error_label = add_label(self,"", "CombatError")
	error_label.add_theme_color_override("font_color",Color("e1bb84"))
	var output = TabContainer.new()
	output.custom_minimum_size.y = 112
	output.size_flags_vertical = Control.SIZE_EXPAND_FILL
	add_child(output)
	messages = add_text(output,"Battle log",76)
	trace = add_text(output,"Action trace",76)
	reset_preview()

func reset_preview():
	var rules = Combat.new(catalog)
	var c = source_character.duplicate(true)
	if c.is_empty(): c = Town.new().new_character(Rules.creation_state(0,catalog.tables.races[0].raw),"Combat fixture",0,"",catalog,46305)
	if equip_hands.button_pressed and c.M5857[0].M577E != 1:
		var depth = c.M5470
		c.M5470 = 0
		var equipment = Equipment.new(catalog)
		c = equipment.toggle(c,0,Guild.new(catalog).can_use_item)
		if c.is_empty():
			error_label.text = equipment.error
			return
		c.M5470 = depth
	if c.M5470 == 0: c.M5470 = 1 # Explicit fixture context, not campaign travel.
	var next_groups = []
	for slot in 4:
		var group = rules.fixture_group(monster_picker.selected,int(member_count.value))
		if group.is_empty():
			error_label.text = rules.error
			return
		if slot >= int(group_count.value):
			group.M4ED4 = -1
			group.M4EDC = 0
		next_groups.append(group)
	character = c
	groups = next_groups
	target = 0
	tape = Tape.new()
	history = ["Preview reset. Group HP uses the selected original definition; this is a fixture, not a generated encounter."]
	last_result = {}
	trace.text = "No action yet. The trace records damage arguments and each consumed random result."
	error_label.text = ""
	refresh()

func load_draws():
	var values = []
	for word in draws.text.replace(","," ").replace("\n"," ").replace("\r"," ").replace("\t"," ").split(" ",false):
		if not word.is_valid_float() or not is_finite(float(word)) or float(word) < 0 or float(word) >= 1:
			error_label.text = "Every supplied result must be a finite number in [0, 1)."
			return
		values.append(float(word))
	if values.size() < tape.position or values.slice(0,tape.position) != tape.values.slice(0,tape.position):
		error_label.text = "Consumed draws cannot change. Append results, or reset the preview to load a different tape."
		return
	tape.values = values
	error_label.text = "Draw tape loaded."
	refresh()

func step(actor: String):
	var rules = Combat.new(catalog)
	var result = rules.action(character,groups,target,actor,tape)
	if result.is_empty():
		error_label.text = rules.error
		return
	character = result.character
	groups = result.groups
	target = result.target
	last_result = result
	for message in result.messages: history.append(message)
	if result.experience_added != 0: history.append("Preview experience added: " + Money.display(result.experience_added))
	if result.outcome == "victory": history.append("Victory in the preview. Campaign rewards were not saved.")
	elif result.outcome == "defeat": history.append("Defeated in the preview. Original death/recovery side effects remain pending.")
	var details = result.duplicate(true)
	details.erase("character")
	details.erase("groups")
	trace.text = JSON.stringify(details,"  ")
	error_label.text = ""
	refresh()

func refresh():
	hero_info.text = "%s  ·  %s level %d\nHealth %d / %d    Attack / Defense %s / %s\nExperience %s / %d cap" % [character.M548B,catalog.tables.guilds[character.M58BB].name,character.M5584[character.M58BB].M4E82,character.M4EAC,character.M4EB4,character.M4E97,character.M4EA1,Money.display(character.M579B),character.M5970]
	hero_health.max_value = maxi(1,character.M4EB4)
	hero_health.value = character.M4EAC
	tape_info.text = "Draw tape: %d consumed / %d supplied" % [tape.position,tape.values.size()]
	group_list.clear()
	for slot in 4:
		var group = groups[slot]
		group_list.add_item("%d. %s × %d   ·   HP %d / %d" % [slot + 1,catalog.tables.monsters[group.M4ED4].name,group.M4EDC,group.M4EAC,group.M4EB4] if group.M4ED4 >= 0 else "%d. Empty" % [slot + 1])
		group_list.set_item_disabled(slot,group.M4EDC <= 0)
	target = Combat.active_group(groups,target)
	if target >= 0: group_list.select(target)
	player_button.disabled = character.M4EAC <= 0 or target < 0
	monster_button.disabled = player_button.disabled
	portrait.texture = null
	if target >= 0:
		var monster = catalog.tables.monsters[groups[target].M4ED4].raw
		var limitation = Combat.new(catalog).physical_limit(groups[target].M4ED4)
		monster_button.disabled = monster_button.disabled or not limitation.is_empty()
		monster_button.tooltip_text = limitation
		if not limitation.is_empty(): error_label.text = limitation
		var sheet = load("res://assets/graphics/MG11_MONS_000000.png")
		var picture = int(monster.M5A1B) - 1
		if picture >= 0 and picture < 100:
			var texture = AtlasTexture.new()
			texture.atlas = sheet
			texture.region = Rect2((picture % 10) * 60,int(picture / 10.0) * 60,60,60)
			portrait.texture = texture
	messages.text = "\n".join(history.slice(maxi(0,history.size() - 100)))
	messages.set_v_scroll(messages.get_line_count())
