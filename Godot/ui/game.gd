extends "res://ui/main.gd"
const Campaign = preload("res://core/campaign.gd")
const Town = preload("res://core/town_rules.gd")
const Money = preload("res://core/currency.gd")
const Guild = preload("res://core/guild_rules.gd")
const Equipment = preload("res://core/equipment.gd")
const Dungeon = preload("res://core/dungeon_rules.gd")
const ExploredMap = preload("res://ui/explored_map.gd")
const DungeonView = preload("res://ui/dungeon_view.gd")
const CombatPanel = preload("res://ui/combat_panel.gd")
const Battle = preload("res://core/battle_rules.gd")
var campaign = Campaign.new()
var content: VBoxContainer
var status: Label
var active_slot: int = -1
var save_directory = "user://campaign"
var selected_roster: int = -1
var name_input: LineEdit
var password_input: LineEdit
var password_again: LineEdit
var sex_picker: OptionButton
var amount_input: LineEdit
var visited_guild: int = 0
var guild_detail: VBoxContainer
var guild_choices: Array = []
var dungeon_page = false
var dungeon_history: Array[String] = []
var battle_command = "defend"
var battle_target = -1
var battle_spell = -1
var battle_clock = 0.0
var battle_paused = false
var battle_busy = false

func _ready():
	_apply_theme()
	for argument in OS.get_cmdline_user_args():
		if argument.begins_with("--save-dir="): save_directory = argument.trim_prefix("--save-dir=")
	var margin = MarginContainer.new()
	margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_" + side,24)
	add_child(margin)
	var root = VBoxContainer.new()
	root.add_theme_constant_override("separation",16)
	margin.add_child(root)
	var header = HBoxContainer.new()
	root.add_child(header)
	var titles = VBoxContainer.new()
	titles.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(titles)
	label(titles,"MORDOR",30,GOLD)
	label(titles,"THE DEPTHS OF DEJENOL",12,MUTED)
	button(header,"Development tools",open_workbench)
	var scroll = ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_child(scroll)
	content = VBoxContainer.new()
	content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation",16)
	scroll.add_child(content)
	status = label(root,"",14,GOLD)
	status.name = "Status"
	status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label(root,"GODOT MIGRATION BUILD  •  Solo dungeon combat  •  Companion combat, chests, recovery, and random hazards pending",12,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	if not catalog.load_all():
		status.text = catalog.error
		return
	if not campaign.open(save_directory,catalog):
		status.text = campaign.error
		return
	show_roster()

func clear_page(title: String, subtitle: String = ""):
	dungeon_page = false
	battle_clock = 0.0
	content.add_theme_constant_override("separation",16)
	for child in content.get_children():
		content.remove_child(child)
		child.queue_free()
	status.text = ""
	label(content,title,27,GOLD)
	if not subtitle.is_empty(): label(content,subtitle,14,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

func input(parent: Node, title: String, node_name: String, secret: bool = false) -> LineEdit:
	var field = LineEdit.new()
	field.name = node_name
	field.placeholder_text = title
	field.secret = secret
	field.text_changed.connect(func(_text): status.text = "")
	field.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(field)
	return field

func show_roster():
	active_slot = -1
	selected_roster = -1
	clear_page("Character roster","Choose a character to visit town or resume a dungeon expedition.")
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",24)
	content.add_child(split)
	var list = ItemList.new()
	list.name = "Roster"
	list.custom_minimum_size = Vector2(360,310)
	split.add_child(list)
	var detail = VBoxContainer.new()
	detail.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(detail)
	var description = label(detail,"No characters yet. Your adventure begins here.",18)
	description.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	password_input = input(detail,"Character password (if set)","LoginPassword",true)
	password_input.max_length = 10
	var enter = button(detail,"Enter town",enter_town)
	enter.name = "EnterTown"
	enter.disabled = true
	password_input.text_submitted.connect(func(_text): enter_town())
	for row in campaign.characters: list.add_item(row.name)
	list.item_selected.connect(func(index):
		selected_roster = index
		password_input.clear()
		description.text = summary(campaign.characters[index].raw)
		enter.text = "Resume dungeon" if campaign.characters[index].raw.M5470 > 0 else "Enter town"
		enter.disabled = false)
	if list.item_count > 0:
		list.select(0)
		list.item_selected.emit(0)
	var actions = HBoxContainer.new()
	content.add_child(actions)
	button(actions,"Create character",show_creation).name = "NewCharacter"
	button(actions,"Reload roster",func():
		if campaign.open(save_directory,catalog): show_roster()
		else: status.text = campaign.error)
	label(content,"Saves: " + campaign.path,12,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

func summary(c: Dictionary) -> String:
	return "%s\n%s  ·  %s  ·  %s\n%s, level %d\n\nHealth  %d / %d\nSpell points  %d\nCarried gold  %s\nBanked gold  %s" % [Campaign.name_of(c.M548B),catalog.tables.races[c.M5821].name,["Good","Neutral","Evil"][clampi(c.M4EBF,0,2)],["Male","Female"][clampi(c.M5829,0,1)],catalog.tables.guilds[c.M58BB].name,c.M5584[c.M58BB].M4E82,c.M4EAC,c.M4EB4,c.M5830,Money.display(c.M4F2D),Money.display(c.M58AF)]

func enter_town():
	if selected_roster < 0: return
	var c = campaign.characters[selected_roster].raw
	var password = c.M594C.rstrip(" ") if c.M594C is String else "<invalid>"
	if password_input.text != password:
		status.text = "Incorrect character password."
		return
	if c.M5483 != 0 or c.M4EAC <= 0:
		status.text = "This character needs recovery services, which are still being migrated."
		return
	if c.M5470 != 0 and (catalog.cell(c.M5470,c.M583F,c.M5845).is_empty() or c.M5899 < 1 or c.M5899 > 4):
		status.text = "The saved dungeon position or facing is invalid."
		return
	active_slot = campaign.characters[selected_roster].record_index
	dungeon_history.clear()
	if c.M5470 > 0: show_dungeon()
	else: show_town()

func active_character() -> Dictionary:
	for row in campaign.characters:
		if row.record_index == active_slot: return row.raw
	return {}

func show_creation():
	clear_page("Create an adventurer","Choose a race and alignment, then distribute your points. Racial limits appear beside each statistic.")
	stat_labels.clear()
	var identity = HBoxContainer.new()
	content.add_child(identity)
	name_input = input(identity,"Character name","CharacterName")
	name_input.max_length = 30
	race_picker = OptionButton.new()
	race_picker.name = "Race"
	for race in catalog.tables.races: race_picker.add_item(race.name)
	identity.add_child(race_picker)
	sex_picker = OptionButton.new()
	sex_picker.add_item("Male")
	sex_picker.add_item("Female")
	identity.add_child(sex_picker)
	alignment_picker = OptionButton.new()
	identity.add_child(alignment_picker)
	points_label = label(content,"",18,GOLD)
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",36)
	content.add_child(split)
	var grid = GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation",14)
	grid.add_theme_constant_override("v_separation",8)
	split.add_child(grid)
	for index in 6:
		label(grid,["Strength","Intelligence","Wisdom","Constitution","Charisma","Dexterity"][index],17)
		button(grid,"−",func(): adjust_stat(index,-1))
		var value = label(grid,"",17,GOLD)
		value.custom_minimum_size.x = 130
		stat_labels.append(value)
		button(grid,"+",func(): adjust_stat(index,1))
	guild_labels = RichTextLabel.new()
	guild_labels.bbcode_enabled = true
	guild_labels.custom_minimum_size = Vector2(270,280)
	guild_labels.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(guild_labels)
	var passwords = HBoxContainer.new()
	content.add_child(passwords)
	password_input = input(passwords,"Optional password (10 characters)","NewPassword",true)
	password_again = input(passwords,"Repeat password","RepeatPassword",true)
	password_input.max_length = 10
	password_again.max_length = 10
	var actions = HBoxContainer.new()
	content.add_child(actions)
	button(actions,"Save character",request_create).name = "SaveCharacter"
	button(actions,"Cancel",show_roster)
	race_picker.item_selected.connect(reset_creation)
	alignment_picker.item_selected.connect(func(index):
		creation.M4EBF = alignment_picker.get_item_id(index)
		refresh_creation())
	reset_creation(0)
	name_input.grab_focus()

func request_create():
	if password_input.text != password_again.text:
		status.text = "Passwords do not match."
		return
	if creation.points > 0:
		var dialog = ConfirmationDialog.new()
		dialog.dialog_text = "%d points are unspent. Save this character anyway?" % creation.points
		dialog.title = "Unspent points"
		dialog.confirmed.connect(save_character)
		dialog.confirmed.connect(dialog.queue_free)
		dialog.canceled.connect(dialog.queue_free)
		add_child(dialog)
		dialog.popup_centered()
	else: save_character()

func save_character():
	if campaign.create_character(creation,name_input.text,sex_picker.selected,password_input.text,vb_today()):
		show_roster()
		status.text = "Character saved. Select your adventurer to enter town."
	else: status.text = campaign.error

static func vb_today() -> int:
	var date = Time.get_date_string_from_system()
	return int((Time.get_unix_time_from_datetime_string(date + "T00:00:00") - Time.get_unix_time_from_datetime_string("1899-12-30T00:00:00")) / 86400)

func show_town():
	var c = active_character()
	clear_page("Town of Dejenol","Welcome, " + Campaign.name_of(c.M548B) + ".")
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",40)
	content.add_child(split)
	label(split,summary(c),20).custom_minimum_size.x = 420
	var services = VBoxContainer.new()
	services.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(services)
	label(services,"TOWN SERVICES",14,GOLD)
	button(services,"Bank",show_bank).name = "Bank"
	button(services,"Guilds",show_guilds).name = "GuildRecords"
	button(services,"Spell knowledge",show_spellbook).name = "Spellbook"
	button(services,"Inventory",show_inventory).name = "Inventory"
	button(services,"Enter dungeon",func(): dungeon_action("enter")).name = "EnterDungeon"
	button(services,"Combat preview",show_combat_preview).name = "CombatPreview"
	for service in ["Store","Morgue","Seer","Companions"]:
		var control = button(services,service + "  ·  migration pending",func(): pass)
		control.disabled = true
	button(content,"Return to character roster",show_roster)

func show_bank():
	var c = active_character()
	clear_page("Bank of Dejenol","All successful transactions are saved immediately.")
	label(content,"Carried gold   %s\nBanked gold   %s" % [Money.display(c.M4F2D),Money.display(c.M58AF)],24,GOLD).name = "Balances"
	amount_input = input(content,"Gold amount","BankAmount")
	var actions = HBoxContainer.new()
	content.add_child(actions)
	button(actions,"Deposit",func(): transfer(true)).name = "Deposit"
	button(actions,"Withdraw",func(): transfer(false)).name = "Withdraw"
	button(actions,"Deposit all",func():
		amount_input.text = Money.display(active_character().M4F2D)
		transfer(true))
	button(actions,"Withdraw all",func():
		amount_input.text = Money.display(active_character().M58AF)
		transfer(false))
	label(content,"Item storage and party banking are still being migrated.",14,MUTED)
	button(content,"Return to town",show_town)
	amount_input.grab_focus()

func transfer(deposit: bool):
	var money = Money.new()
	var amount = money.parse(amount_input.text)
	if not money.error.is_empty():
		status.text = money.error
		return
	var copy = active_character().duplicate(true)
	var town = Town.new()
	if not town.bank_transfer(copy,amount,deposit):
		status.text = town.error
		return
	if not campaign.update_character(active_slot,copy):
		status.text = campaign.error
		return
	show_bank()
	status.text = "Transaction saved."

func show_guilds():
	var c = active_character()
	var rules = Guild.new(catalog)
	clear_page("Guilds of Dejenol","Active: %s  ·  %s  ·  Level %d" % [catalog.tables.guilds[c.M58BB].name,rules.title(c),c.M5584[c.M58BB].M4E82])
	label(content,"Carried gold  %s     Banked gold  %s" % [Money.display(c.M4F2D),Money.display(c.M58AF)],16,GOLD)
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",24)
	content.add_child(split)
	var list = ItemList.new()
	list.name = "GuildList"
	list.custom_minimum_size = Vector2(270,400)
	split.add_child(list)
	guild_detail = VBoxContainer.new()
	guild_detail.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	guild_detail.add_theme_constant_override("separation",12)
	split.add_child(guild_detail)
	guild_choices.clear()
	for index in catalog.tables.guilds.size():
		var definition = catalog.tables.guilds[index]
		if not Rules.guild_allows(definition.raw,c): continue # FRMCTYG.sub2974
		guild_choices.append(index)
		var level = c.M5584[index].M4E82
		list.add_item(definition.name + (" (%d)" % level if level > 0 else "") + ("  • active" if index == c.M58BB else ""))
	list.item_selected.connect(func(index): visit_guild(guild_choices[index]))
	var selection = guild_choices.find(c.M58BB)
	if selection >= 0: list.select(selection)
	visit_guild(c.M58BB)
	button(content,"Return to town",show_town)

func visit_guild(index: int):
	visited_guild = index
	var list = find_child("GuildList",true,false)
	var selection = guild_choices.find(index)
	if list != null and selection >= 0: list.select(selection)
	for child in guild_detail.get_children():
		guild_detail.remove_child(child)
		child.queue_free()
	var c = active_character()
	var rules = Guild.new(catalog)
	var guild = catalog.tables.guilds[index]
	label(guild_detail,guild.name + "'s Guild",23,GOLD)
	var required = []
	for stat in 6: required.append("%s %d" % [["STR","INT","WIS","CON","CHA","DEX"][stat],guild.raw.M55B5[stat]])
	label(guild_detail,"Natural stats required: " + "  ·  ".join(required),13,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	if index != c.M58BB:
		var quote = rules.join_quote(c,index)
		var description = "Join for %d gold." % quote.fee if quote.new_member else "Resume your level %d membership." % c.M5584[index].M4E82
		if not quote.allowed: description = quote.reason
		label(guild_detail,description,17).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		var join_button = button(guild_detail,"Join guild" if quote.new_member else "Re-acquaint",func(): request_join_guild(index))
		join_button.name = "JoinGuild"
		join_button.disabled = not quote.allowed
	else:
		var requirements = rules.training_requirements(c)
		label(guild_detail,"Experience  %s / %d required\nTraining cost  %d gold\nExperience cap  %d" % [Money.display(c.M579B),requirements.experience,requirements.price,c.M5970],18)
		label(guild_detail,requirements.quest,15).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		label(guild_detail,"Training requirements met." if requirements.ready else requirements.reason,15,GOLD).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		var training = button(guild_detail,"Train  ·  migration pending",func(): pass)
		training.disabled = true
		if requirements.can_forfeit: label(guild_detail,"Quest forfeiture is still being migrated.",13,MUTED)
	button(guild_detail,"View guild log",show_guild_log).name = "GuildLog"
	button(guild_detail,"View spell knowledge",show_spellbook)

func request_join_guild(target: int):
	var quote = Guild.new(catalog).join_quote(active_character(),target)
	if not quote.allowed:
		status.text = quote.reason
		return
	if not quote.new_member:
		join_guild(target)
		return
	var dialog = ConfirmationDialog.new()
	dialog.name = "ConfirmGuild"
	dialog.title = "Join " + catalog.tables.guilds[target].name
	dialog.dialog_text = "Join this guild for %d gold?" % quote.fee
	if not quote.unequipped.is_empty(): dialog.dialog_text += "\n%d incompatible items will be unequipped." % quote.unequipped.size()
	if quote.low_level_warning: dialog.dialog_text += "\nYour highest guild level is below 10.\nAdvancement may be difficult."
	dialog.confirmed.connect(func(): join_guild(target))
	dialog.confirmed.connect(dialog.queue_free)
	dialog.canceled.connect(dialog.queue_free)
	add_child(dialog)
	dialog.popup_centered(Vector2i(520,190))

func join_guild(target: int):
	if campaign.join_guild(active_slot,target,vb_today()):
		show_guilds()
		status.text = "Active guild saved: " + catalog.tables.guilds[target].name + "."
	else: status.text = campaign.error

func show_guild_log():
	clear_page(catalog.tables.guilds[visited_guild].name + " guild log")
	var output = text_view(content)
	output.name = "GuildLogText"
	output.custom_minimum_size.y = 380
	var entries = []
	for entry in campaign.guild_log.entries:
		if entry.guild_id != visited_guild: continue
		var date = Time.get_date_string_from_unix_time(Time.get_unix_time_from_datetime_string("1899-12-30T00:00:00") + entry.date * 86400)
		entries.append(date + "  " + (entry.message if entry.message is String else "[Binary log message]"))
	output.text = "\n\n".join(entries) if not entries.is_empty() else "No entries for this guild."
	button(content,"Return to guilds",show_guilds)

func show_spellbook():
	clear_page("Spell knowledge","Knowledge is shared across your guild memberships. Spell casting is still being migrated.")
	var rules = Guild.new(catalog)
	var c = active_character()
	var known = []
	for spell in catalog.tables.spells:
		if rules.knows_spell(c,spell.raw): known.append(spell)
	label(content,"%d spells known" % known.size(),18,GOLD)
	var search = input(content,"Search known spells","SpellSearch")
	var list = ItemList.new()
	list.name = "KnownSpells"
	list.custom_minimum_size.y = 350
	content.add_child(list)
	var categories = {}
	for entry in JSON.parse_string(FileAccess.get_file_as_string("res://data/labels.json")):
		if entry.kind == "spell_category": categories[int(entry.index)] = entry.label
	var refresh = func(query: String):
		list.clear()
		for spell in known:
			if not query.is_empty() and not query.to_lower() in spell.name.to_lower(): continue
			var casting = rules.casting_guild(c,spell.raw)
			list.add_item("%s   ·   %s   ·   Spell level %d   ·   %s casting level %d" % [spell.name,categories.get(spell.raw.M5709,"Unknown"),spell.raw.M4E82,catalog.tables.guilds[casting.guild].name,casting.level])
	search.text_changed.connect(refresh)
	refresh.call("")
	button(content,"Return to town",show_town)

func show_inventory():
	var c = active_character()
	var equipment = Equipment.new(catalog)
	clear_page("Inventory","Equip or remove carried items. Cursed equipment must be separated before it can be removed.")
	label(content,"Attack / Defense  %s / %s     Hands in use  %d / 2" % [c.M4E97,c.M4EA1,c.M5700],18,GOLD)
	var list = ItemList.new()
	list.name = "InventoryList"
	list.custom_minimum_size.y = 350
	content.add_child(list)
	var slots = []
	for slot in 40:
		var held = c.M5857[slot]
		if slot > 0 and held.M4ED4 <= 0: continue
		slots.append(slot)
		list.add_item("%d. %s%s" % [slot + 1,equipment.item_name(held),"  ·  equipped" if held.M577E == 1 else ""])
	var toggle = button(content,"Select an item",func():
		var chosen = list.get_selected_items()
		if not chosen.is_empty(): toggle_item(slots[chosen[0]]))
	toggle.name = "ToggleEquipment"
	toggle.disabled = true
	list.item_selected.connect(func(index):
		toggle.text = "Unequip" if c.M5857[slots[index]].M577E == 1 else "Equip"
		toggle.disabled = false)
	if list.item_count > 0:
		list.select(0)
		list.item_selected.emit(0)
	button(content,"Return to town",show_town)

func toggle_item(slot: int):
	var equipment = Equipment.new(catalog)
	var rules = Guild.new(catalog)
	var next = equipment.toggle(active_character(),slot,rules.can_use_item)
	if next.is_empty():
		status.text = equipment.error
		return
	if not campaign.update_character(active_slot,next):
		status.text = campaign.error
		return
	show_inventory()
	status.text = "Equipment saved."

func show_dungeon():
	var c = active_character()
	if c.M5483 != 0 or c.M4EAC <= 0:
		clear_page("Expedition ended","Your character has died. Recovery services are still being migrated.")
		label(content,"\n".join(dungeon_history.slice(-5)),16).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		button(content,"Return to roster",show_roster)
		return
	var prepared = campaign.resume_combat(active_slot)
	clear_page("The Depths of Dejenol","Combat advances every second while this view is active. Choose an attack, a target, or a spell.")
	if not prepared:
		status.text = campaign.error
		battle_paused = true
	dungeon_page = true
	content.add_theme_constant_override("separation",8)
	var location = "Depth %d" % c.M5470 if c.M59F4[0] == 0 else "Depth unknown"
	location += "  ·  %d, %d" % [c.M583F,c.M5845] if c.M59F4[1] == 0 else "  ·  Position unknown"
	location += "  ·  Facing " + Dungeon.FACING_NAMES[c.M5899 - 1] if c.M59F4[2] == 0 else "  ·  Facing unknown"
	label(content,location + "     |     Health %d / %d" % [c.M4EAC,c.M4EB4],17,GOLD).name = "DungeonLocation"
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",24)
	content.add_child(split)
	var scene = VBoxContainer.new()
	scene.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(scene)
	var view = DungeonView.new()
	view.name = "DungeonView"
	view.catalog = catalog
	view.map = campaign.automap
	view.character = c
	scene.add_child(view)
	view.custom_minimum_size.y = 180
	var flags = catalog.cell(c.M5470,c.M583F,c.M5845).flags
	var features = []
	if flags & (1 << 12): features.append("Stairs up — Take to climb")
	if flags & (1 << 13): features.append("Stairs down — Take to descend")
	if flags & (1 << 20): features.append("Fog obscures your surroundings")
	if c.M59F4[0] != 0 or c.M59F4[1] != 0: features.append("You are lost. Reach a previously mapped square to recover your bearings.")
	label(scene,"  ·  ".join(features) if not features.is_empty() else "The passage continues.",14,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var notebook = VBoxContainer.new()
	split.add_child(notebook)
	label(notebook,"EXPLORATION MAP  ·  NORTH ↑",12,MUTED)
	var map_view = ExploredMap.new()
	map_view.name = "ExploredMap"
	map_view.map = campaign.automap
	map_view.character = c
	notebook.add_child(map_view)
	map_view.custom_minimum_size = Vector2(260,260)
	show_encounter(scene,c)
	var actions = HBoxContainer.new()
	content.add_child(actions)
	for entry in [["left","← Turn left","DungeonLeft"],["forward","↑ Forward","DungeonForward"],["right","Turn right →","DungeonRight"],["around","Turn around","DungeonAround"],["take","Take stairs","DungeonTake"]]:
		var action = String(entry[0])
		var control = button(actions,entry[1],func(): dungeon_action(action))
		control.name = entry[2]
		control.focus_mode = Control.FOCUS_NONE
		if action == "take": control.disabled = not flags & ((1 << 12) | (1 << 13))
	button(actions,"Save & leave",show_roster).name = "LeaveDungeon"
	button(actions,"Combat preview",show_combat_preview).name = "CombatPreview"
	label(content,"Arrow keys / WASD: move and turn  ·  T: take stairs  ·  Esc: leave  ·  Every successful action is saved",12,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var history = label(content,"\n".join(dungeon_history.slice(maxi(0,dungeon_history.size() - 2))),14)
	history.name = "DungeonHistory"
	history.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

func show_encounter(parent: Node, c: Dictionary):
	var room = campaign.encounter(c)
	if room.is_empty(): return
	var active = Battle.active_group(room.groups,battle_target)
	battle_target = active
	var panel = VBoxContainer.new()
	panel.name = "CampaignCombat"
	parent.add_child(panel)
	if active < 0:
		label(panel,"The room is clear." if room.meta.M4F1B == 0 else "The monsters are gone. A chest remains; chest handling is still being migrated.",14,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	else:
		var target_picker = OptionButton.new()
		target_picker.name = "BattleTarget"
		for index in 4:
			var group = room.groups[index]
			if group.M4EDC <= 0: continue
			var monster = catalog.tables.monsters[group.M4ED4].raw
			var name = catalog.tables.monsters[group.M4F01].name if group.M4F01 >= 0 and group.M4F01 < catalog.tables.monsters.size() else "Unknown monsters"
			if monster.M55BE & 2 and c.M56B9[5] == 0: name = "Unseen monsters"
			target_picker.add_item("%d · %s × %d" % [index + 1,name,group.M4EDC],index)
			if index == active: target_picker.select(target_picker.item_count - 1)
		var target_row = HBoxContainer.new()
		panel.add_child(target_row)
		var visible_group = room.groups[active]
		var visible_monster = catalog.tables.monsters[visible_group.M4ED4].raw
		if not visible_monster.M55BE & 2 or c.M56B9[5] != 0:
			var id = visible_group.M4F01
			if id >= 0 and id < catalog.tables.monsters.size():
				var picture = int(catalog.tables.monsters[id].raw.M5A1B) - 1
				if picture >= 0 and picture < 100:
					var portrait = TextureRect.new()
					portrait.custom_minimum_size = Vector2(60,60)
					portrait.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
					portrait.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
					var texture = AtlasTexture.new()
					texture.atlas = load("res://assets/graphics/MG11_MONS_000000.png")
					texture.region = Rect2(picture % 10 * 60,int(picture / 10.0) * 60,60,60)
					portrait.texture = texture
					target_row.add_child(portrait)
		target_picker.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		target_row.add_child(target_picker)
		target_picker.item_selected.connect(func(index): battle_target = target_picker.get_item_id(index))
		label(panel,"Hostile" if room.groups[0].M4ECC == 1 else "Peaceful — attacking starts combat",13,GOLD)
	var actions = HBoxContainer.new()
	panel.add_child(actions)
	for entry in [["attack","Attack"],["defend","Defend"],["wait","Wait"]]:
		var command = String(entry[0])
		var control = button(actions,entry[1],func():
			battle_command = command
			battle_spell = -1
			battle_paused = false
			status.text = "Next round: " + command)
		control.name = "Battle" + command.capitalize()
		control.toggle_mode = true
		control.button_pressed = battle_command == command
		control.disabled = command == "attack" and active < 0
	var pause = CheckButton.new()
	pause.name = "BattlePause"
	pause.text = "Pause"
	pause.button_pressed = battle_paused
	actions.add_child(pause)
	pause.toggled.connect(func(value):
		battle_paused = value
		battle_clock = 0)
	var spells = OptionButton.new()
	spells.name = "BattleSpell"
	spells.add_item("Choose spell",-1)
	var rules = Battle.new(catalog)
	for index in catalog.tables.spells.size():
		var s = catalog.tables.spells[index].raw
		if active >= 0 and room.groups[0].M4ECC == 1 and (s.M5B33 == 0 or s.M5709 == 9) and s.M56B9 != 10: continue
		if active < 0 and s.M5B33 > 0 and s.M5709 != 9: continue
		if rules.spell_reason(c,index).is_empty():
			spells.add_item("%s · %d SP" % [s.M548B,rules.spell_cost(c,s)],index)
			if battle_command == "spell" and battle_spell == index: spells.select(spells.item_count - 1)
	panel.add_child(spells)
	spells.item_selected.connect(func(index):
		if index == 0: return
		battle_spell = spells.get_item_id(index)
		battle_command = "spell"
		battle_paused = false
		status.text = "Spell queued for the next round.")
	label(panel,"HP %d / %d  ·  SP %d  ·  Next: %s" % [c.M4EAC,c.M4EB4,c.M5830,battle_command],13,MUTED)

func _process(delta: float):
	if not dungeon_page or not is_visible_in_tree() or battle_paused or battle_busy or active_slot < 0:
		battle_clock = 0
		return
	var c = active_character()
	if c.is_empty() or c.M5483 != 0: return
	var room = campaign.encounter(c)
	if room.is_empty(): return
	if battle_command != "spell" and Battle.active_group(room.groups) < 0 and c.M56B9[0] == 0 and c.M56B9[1] == 0 and c.M56B9[2] == 0: return
	battle_clock += delta
	if battle_clock < 1.0: return
	battle_clock = 0 # No offline/catch-up rounds after pauses or slow frames.
	battle_busy = true
	if not campaign.combat_tick(active_slot,battle_command,battle_target,battle_spell,vb_today()):
		battle_paused = true
		status.text = campaign.error
	else:
		for message in campaign.last_battle.messages: dungeon_history.append(message)
		if dungeon_history.size() > 30: dungeon_history = dungeon_history.slice(-30)
		if battle_command == "spell":
			battle_command = "defend"
			battle_spell = -1
		show_dungeon()
	battle_busy = false

func dungeon_action(action: String):
	if not campaign.dungeon_action(active_slot,action,vb_today()):
		status.text = campaign.error
		return
	for message in campaign.dungeon_messages: dungeon_history.append(message)
	if dungeon_history.size() > 30: dungeon_history = dungeon_history.slice(-30)
	if active_character().M5470 == 0:
		show_town()
		status.text = "You return to Dejenol. Expedition saved."
	else: show_dungeon()

func _unhandled_key_input(event):
	if not dungeon_page or not is_visible_in_tree() or not event is InputEventKey or not event.pressed or event.echo: return
	if event.alt_pressed or event.ctrl_pressed or event.meta_pressed: return
	var action = ""
	match event.keycode:
		KEY_W, KEY_UP: action = "forward"
		KEY_A, KEY_LEFT: action = "left"
		KEY_D, KEY_RIGHT: action = "right"
		KEY_S, KEY_DOWN: action = "around"
		KEY_T: action = "take"
		KEY_ESCAPE:
			get_viewport().set_input_as_handled()
			show_roster()
			return
	if not action.is_empty():
		get_viewport().set_input_as_handled()
		dungeon_action(action)

func show_combat_preview():
	clear_page("Combat preview")
	content.add_theme_constant_override("separation",8)
	var panel = CombatPanel.new()
	panel.catalog = catalog
	panel.source_character = active_character().duplicate(true)
	content.add_child(panel)
	button(content,"Return to dungeon" if active_character().M5470 > 0 else "Return to town",func():
		if active_character().M5470 > 0: show_dungeon()
		else: show_town()).name = "CloseCombatPreview"

func open_workbench():
	var workbench = load("res://ui/main.tscn").instantiate()
	get_parent().add_child(workbench)
	hide()
	var back = Button.new()
	back.text = "Return to game"
	back.position = Vector2(900,24)
	back.pressed.connect(func():
		workbench.queue_free()
		show())
	workbench.add_child(back)
