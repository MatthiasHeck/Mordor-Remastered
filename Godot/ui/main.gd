extends Control
const Catalog = preload("res://core/original_data.gd")
const Rules = preload("res://core/original_rules.gd")
const Tape = preload("res://core/draw_tape.gd")
const MapView = preload("res://ui/dungeon_map.gd")
const OriginalAudio = preload("res://core/original_audio.gd")
const GuildRules = preload("res://core/guild_rules.gd")
const TownRules = preload("res://core/town_rules.gd")
const CombatPanelView = preload("res://ui/combat_panel.gd")
const GOLD = Color("d6b57b")
const MUTED = Color("9aaab3")
var catalog = Catalog.new()
var manifest: Dictionary
var tabs: TabContainer
var creation: Dictionary
var race_picker: OptionButton
var alignment_picker: OptionButton
var stat_labels: Array = []
var points_label: Label
var guild_labels: RichTextLabel

func _ready():
	_apply_theme()
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
	label(titles,"MORDOR",28,GOLD)
	label(titles,"THE DEPTHS OF DEJENOL  /  GODOT CONVERSION",12,MUTED)
	label(header,"DEVELOPMENT BUILD\nPartial source conversion",14,GOLD)
	if not catalog.load_all():
		label(root,"Unable to load original data\n" + catalog.error,18,Color("f19886"))
		return
	manifest = JSON.parse_string(FileAccess.get_file_as_string("res://data/manifest.json"))
	tabs = TabContainer.new()
	tabs.size_flags_vertical = Control.SIZE_EXPAND_FILL
	root.add_child(tabs)
	build_overview()
	build_records()
	build_dungeon()
	build_creation()
	build_rules()
	build_source()
	build_assets()
	build_progression()
	build_combat()
	label(root,"Original installation preserved  •  Native GDScript  •  Gameplay parity has not been verified",12,MUTED)
	if "--capture" in OS.get_cmdline_user_args(): capture_views.call_deferred()

func build_combat():
	var box = page("Combat preview")
	var panel = CombatPanelView.new()
	panel.catalog = catalog
	box.add_child(panel)

func _apply_theme():
	var skin = Theme.new()
	skin.default_font_size = 15
	for type_name in ["PanelContainer","TabContainer","ItemList","TextEdit","LineEdit","OptionButton","Button"]:
		for style_name in ["panel","normal"]:
			var style = StyleBoxFlat.new()
			style.bg_color = Color("18212b")
			style.border_color = Color("35414b")
			style.set_border_width_all(1)
			style.set_corner_radius_all(4)
			style.content_margin_left = 12
			style.content_margin_right = 12
			style.content_margin_top = 9
			style.content_margin_bottom = 9
			skin.set_stylebox(style_name,type_name,style)
	skin.set_color("font_color","Label",Color("e0e7e8"))
	skin.set_color("font_color","TextEdit",Color("c7d5d9"))
	skin.set_color("font_readonly_color","TextEdit",Color("c7d5d9"))
	theme = skin

func label(parent: Node, text: String, font_size: int = 15, color: Color = Color("e0e7e8")) -> Label:
	var node = Label.new()
	node.text = text
	node.add_theme_font_size_override("font_size",font_size)
	node.add_theme_color_override("font_color",color)
	parent.add_child(node)
	return node

func button(parent: Node, text: String, callback: Callable) -> Button:
	var node = Button.new()
	node.text = text
	node.pressed.connect(callback)
	parent.add_child(node)
	return node

func page(title: String) -> VBoxContainer:
	var margin = MarginContainer.new()
	margin.name = title
	for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_" + side,16)
	tabs.add_child(margin)
	var box = VBoxContainer.new()
	box.add_theme_constant_override("separation",12)
	margin.add_child(box)
	return box

func text_view(parent: Node) -> TextEdit:
	var node = TextEdit.new()
	node.editable = false
	node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	node.size_flags_vertical = Control.SIZE_EXPAND_FILL
	node.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	node.add_theme_font_size_override("font_size",14)
	parent.add_child(node)
	return node

func build_overview():
	var box = page("Overview")
	label(box,"Original records. Native engine foundation.",28,GOLD)
	label(box,"This build reads the supplied Mordor 1.1 installation and runs translated rule functions.\nThe complete game loop is still being reconstructed.",16).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var counters = HBoxContainer.new()
	counters.add_theme_constant_override("separation",12)
	box.add_child(counters)
	for pair in [["15","DUNGEON FLOORS"],["401","MONSTER RECORDS"],["366","ITEMS"],["105","SPELLS"],["55","VB RECORD TYPES"]]:
		var panel = PanelContainer.new()
		panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		counters.add_child(panel)
		var content = VBoxContainer.new()
		panel.add_child(content)
		label(content,pair[0],30,GOLD)
		label(content,pair[1],11,MUTED)
	var split = HBoxContainer.new()
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	split.add_theme_constant_override("separation",20)
	box.add_child(split)
	var description = text_view(split)
	description.text = "AVAILABLE\n\n• Character creation, banking, guilds, equipment, and spell knowledge.\n• Solo dungeon movement, doors, stairs and fixed teleporters.\n• Saved encounters, weapon/spell combat and monster special attacks.\n• Character, map, guild log, encounter and RNG transactions with recovery.\n• Native binary readers, all 13,500 cells and original transition slots.\n• Supplied-draw damage/growth/combat previews, original graphics and WAVs.\n\nSOURCE COVERAGE\n\n%d of %d recovered procedures have candidate translations; %d more are partial. Combat uses a controlled static VB RNG candidate. Ambiguous encounter branches and random hazards stop safely.\n\nStill required: party/companions, charm and remaining spells, chests/items, recovery, training, respawning, Randomize/shared-stream scheduling, perception/hazards, world time, MIDI/WaveMix, and original-executable comparison.\n\nINSTALLATION\n\nMordor/_Original Game Files\nExecutable SHA-256:\n%s" % [int(manifest.translated_procedures),int(manifest.procedure_count),int(manifest.partial_procedures),manifest.executable_sha256]
	var art = TextureRect.new()
	art.texture = load("res://assets/graphics/MG11_MONS_000000.png")
	art.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	art.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	art.custom_minimum_size = Vector2(380,300)
	art.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	split.add_child(art)
	if FileAccess.file_exists("res://tests/results.json"):
		var results = JSON.parse_string(FileAccess.get_file_as_string("res://tests/results.json"))
		label(box,"Local tests: %d checks  /  %d failures  /  %d typed record round trips" % [int(results.checks),results.failures.size(),int(results.typed_records_round_tripped)],14,Color("9ec69b"))

func build_records():
	var box = page("Records")
	label(box,"Original data catalogue",24,GOLD)
	var toolbar = HBoxContainer.new()
	box.add_child(toolbar)
	var kind = OptionButton.new()
	kind.name = "RecordKind"
	var keys = ["monsters","items","spells","races","guilds","characters","item_subtypes","item_classes","monster_types","monster_subtypes"]
	for key in keys: kind.add_item(key.replace("_"," ").capitalize())
	toolbar.add_child(kind)
	var search = LineEdit.new()
	search.name = "RecordSearch"
	search.placeholder_text = "Search names…"
	search.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	toolbar.add_child(search)
	var split = HSplitContainer.new()
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(split)
	var list = ItemList.new()
	list.name = "RecordList"
	list.custom_minimum_size.x = 300
	split.add_child(list)
	var details = text_view(split)
	var rows = []
	var show_record = func(index):
		var row = rows[index]
		details.text = "%s\nPhysical index: %d\n\nOriginal field names preserve unresolved meanings. Currency stays an integer scaled by 10,000.\n\n%s" % [row.name,row.record_index,JSON.stringify(row.raw,"  ")]
	var refresh = func():
		list.clear()
		rows.clear()
		for row in catalog.tables[keys[kind.selected]]:
			if not search.text.is_empty() and not search.text.to_lower() in row.name.to_lower(): continue
			rows.append(row)
			list.add_item("%03d   %s" % [row.record_index,row.name])
		if not rows.is_empty():
			list.select(0)
			show_record.call(0)
		else: details.text = "No matching records."
	kind.item_selected.connect(func(_index): refresh.call())
	search.text_changed.connect(func(_text): refresh.call())
	list.item_selected.connect(show_record)
	refresh.call()

func build_dungeon():
	var box = page("Dungeon atlas")
	var toolbar = HBoxContainer.new()
	box.add_child(toolbar)
	label(toolbar,"Dungeon record inspector",24,GOLD).size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var picker = OptionButton.new()
	picker.name = "FloorPicker"
	for level in catalog.floors: picker.add_item("Floor %d" % level.floor)
	toolbar.add_child(picker)
	label(box,"Developer atlas: all geometry is visible. Coordinate orientation still requires original-runtime comparison.",13,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var split = HBoxContainer.new()
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(split)
	var atlas = MapView.new()
	atlas.name = "DungeonMap"
	split.add_child(atlas)
	var details = text_view(split)
	details.custom_minimum_size.x = 320
	details.size_flags_stretch_ratio = 0.65
	var flags = JSON.parse_string(FileAccess.get_file_as_string("res://data/labels.json"))
	var show_cell = func(x,y):
		var level = catalog.floors[picker.selected]
		var cell = catalog.cell(level.floor,x,y)
		var text = "FLOOR %d  /  X %d  /  Y %d\n\nArea slot: %d\nTerrain mask: 0x%06X\nRaw Currency: %d\n\nFLAGS\n" % [level.floor,x,y,cell.area,cell.flags,cell.raw.M5D2C]
		for flag in flags:
			if flag.kind == "terrain_flag" and Rules.has_flag(int(flag.index),cell.flags): text += "• " + flag.label + "\n"
		if cell.area >= 0 and cell.area < level.areas.size(): text += "\nAREA RECORD\n" + JSON.stringify(level.areas[cell.area],"  ")
		if Rules.has_flag(14,cell.flags):
			var matched = false
			for slot in level.teleporters:
				if slot.M5D74 == x and slot.M5D7E == y:
					matched = true
					text += "\n\nTELEPORTER SLOT\n" + JSON.stringify(slot,"  ")
			if not matched: text += "\n\nNo matching teleporter destination slot. Original discrepancy retained."
		for slot in level.chutes:
			if slot.M5D74 == x and slot.M5D7E == y: text += "\n\nCHUTE SLOT\n" + JSON.stringify(slot,"  ")
		details.text = text
	atlas.selected.connect(show_cell)
	picker.item_selected.connect(func(index):
		atlas.floor_data = catalog.floors[index]
		atlas.queue_redraw()
		show_cell.call(atlas.chosen.x,atlas.chosen.y))
	atlas.floor_data = catalog.floors[0]
	show_cell.call(9,11)
	label(box,"Amber: doors / down stairs   Violet: secret doors / teleporters   Blue: water   Green: up stairs   Dot: pit",12,MUTED)

func build_creation():
	var box = page("Character rules")
	label(box,"Character allocation",24,GOLD)
	label(box,"Translated allocation and guild checks. This edits an in-memory fixture; it does not create a campaign character.",13,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var row = HBoxContainer.new()
	box.add_child(row)
	race_picker = OptionButton.new()
	for race in catalog.tables.races: race_picker.add_item(race.name)
	row.add_child(race_picker)
	alignment_picker = OptionButton.new()
	row.add_child(alignment_picker)
	points_label = label(row,"",18,GOLD)
	var split = HBoxContainer.new()
	split.add_theme_constant_override("separation",36)
	box.add_child(split)
	var grid = GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation",14)
	grid.add_theme_constant_override("v_separation",12)
	split.add_child(grid)
	var names = ["Strength","Intelligence","Wisdom","Constitution","Charisma","Dexterity"]
	for index in 6:
		label(grid,names[index],17)
		button(grid,"−",func(): adjust_stat(index,-1))
		var value = label(grid,"",17,GOLD)
		value.custom_minimum_size.x = 120
		stat_labels.append(value)
		button(grid,"+",func(): adjust_stat(index,1))
	guild_labels = RichTextLabel.new()
	guild_labels.bbcode_enabled = true
	guild_labels.custom_minimum_size = Vector2(280,360)
	guild_labels.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(guild_labels)
	race_picker.item_selected.connect(reset_creation)
	alignment_picker.item_selected.connect(func(index):
		creation.M4EBF = alignment_picker.get_item_id(index)
		refresh_creation())
	reset_creation(0)

func reset_creation(index: int):
	creation = Rules.creation_state(index,catalog.tables.races[index].raw)
	alignment_picker.clear()
	for alignment in creation.alignments: alignment_picker.add_item(["Good","Neutral","Evil"][alignment],alignment)
	refresh_creation()

func adjust_stat(index: int, change: int):
	Rules.adjust_creation_stat(creation,catalog.tables.races[race_picker.selected].raw,index,change)
	refresh_creation()

func refresh_creation():
	var race = catalog.tables.races[race_picker.selected].raw
	points_label.text = "  %d points remaining" % creation.points
	for index in 6: stat_labels[index].text = "%d   (%d–%d)" % [creation.M55B5[index],race.M5530[index],race.M553C[index]]
	guild_labels.text = "[b]GUILD ELIGIBILITY[/b]\n\n"
	for guild in Rules.eligible_guilds(creation,catalog.tables.guilds):
		guild_labels.text += "[color=%s]%s   %s[/color]\n" % ["#abd0a4" if guild.eligible else "#9aaab3","✓" if guild.eligible else "·",guild.name]

func build_rules():
	var box = page("Damage replay")
	label(box,"Replay the recovered damage function",24,GOLD)
	label(box,"Module4.fn0DEE  /  Four supplied Rnd results  /  Original-runtime comparison pending",13,MUTED)
	var inputs = HBoxContainer.new()
	box.add_child(inputs)
	var values = []
	for pair in [["p03B6",20],["p03B8",20],["p03BA",15],["pv03BC",20],["pv03BE",1]]:
		var column = VBoxContainer.new()
		inputs.add_child(column)
		label(column,pair[0],13,MUTED)
		var spin = SpinBox.new()
		spin.max_value = 32767
		spin.step = 0.1 if pair[0] == "pv03BE" else 1
		spin.value = pair[1]
		spin.custom_minimum_size.x = 140
		column.add_child(spin)
		values.append(spin)
	var draws_input = LineEdit.new()
	draws_input.text = "0.5, 0.5, 0.5, 0.1"
	box.add_child(draws_input)
	var output = text_view(box)
	var replay = func():
		var draws = []
		for value in draws_input.text.split(","):
			if not value.strip_edges().is_valid_float():
				output.text = "Enter comma-separated numeric draws."
				return
			draws.append(float(value))
		output.text = JSON.stringify(Rules.new().damage(int(values[0].value),int(values[1].value),int(values[2].value),int(values[3].value),values[4].value,Tape.new(draws)),"  ")
	button(box,"Run supplied draw sequence",replay)
	replay.call()

func build_source():
	var box = page("Source coverage")
	label(box,"Recovered procedure index",24,GOLD)
	var toolbar = HBoxContainer.new()
	box.add_child(toolbar)
	var filter = OptionButton.new()
	filter.name = "SourceFilter"
	for option in ["All procedures","Candidate translations","Partial translations","Not ported"]: filter.add_item(option)
	toolbar.add_child(filter)
	var search = LineEdit.new()
	search.name = "SourceSearch"
	search.placeholder_text = "Filter by module or procedure…"
	search.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	toolbar.add_child(search)
	var split = HSplitContainer.new()
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(split)
	var list = ItemList.new()
	list.name = "SourceList"
	list.custom_minimum_size.x = 340
	split.add_child(list)
	var detail = VBoxContainer.new()
	detail.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(detail)
	var status = label(detail,"",13,GOLD)
	status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var code = text_view(detail)
	var procedures = JSON.parse_string(FileAccess.get_file_as_string("res://data/procedures.json"))
	var rows = []
	var show_source = func(index):
		var proc = rows[index]
		status.text = "%s:%d–%d  /  %s\n%s" % [proc.file,int(proc.start_line),int(proc.end_line),proc.port.status.replace("_"," "),proc.port.get("target", "Awaiting translation")]
		code.text = proc.source_text
	var refresh = func():
		list.clear()
		rows.clear()
		var wanted = ["","translated_candidate","partial","not_ported"][filter.selected]
		for proc in procedures:
			var title = proc.file.get_basename() + "." + proc.name
			if not search.text.is_empty() and not search.text.to_lower() in title.to_lower(): continue
			if not wanted.is_empty() and proc.port.status != wanted: continue
			rows.append(proc)
			list.add_item(title)
		if not rows.is_empty():
			list.select(0)
			show_source.call(0)
		else:
			status.text = "No matching procedures"
			code.text = ""
	search.text_changed.connect(func(_text): refresh.call())
	filter.item_selected.connect(func(_index): refresh.call())
	list.item_selected.connect(show_source)
	refresh.call()

func build_assets():
	var box = page("Original assets")
	label(box,"Recovered graphics and sound",24,GOLD)
	var split = HSplitContainer.new()
	split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(split)
	var list = ItemList.new()
	list.custom_minimum_size.x = 300
	split.add_child(list)
	var details = VBoxContainer.new()
	details.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	split.add_child(details)
	var caption = label(details,"Select an original asset",14,MUTED)
	caption.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var preview = TextureRect.new()
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	preview.size_flags_vertical = Control.SIZE_EXPAND_FILL
	preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	details.add_child(preview)
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	button(details,"Stop audio",func(): audio.stop())
	var assets = []
	for file in manifest.files:
		if file.target.begins_with("assets/"):
			assets.append(file)
			list.add_item(file.target.get_file())
	list.item_selected.connect(func(index):
		audio.stop()
		var asset = assets[index]
		caption.text = "%s\n%d original bytes\n%s" % [asset.target.get_file(),int(asset.bytes),asset.sha256]
		preview.texture = null
		if asset.target.ends_with(".png"): preview.texture = load("res://" + asset.target)
		elif asset.target.ends_with(".WAV.bin"):
			var decoder = OriginalAudio.new()
			audio.stream = decoder.decode(FileAccess.get_file_as_bytes("res://" + asset.target))
			if audio.stream != null: audio.play()
			else: caption.text += "\n" + decoder.error
		else: caption.text += "\nMIDI bytes preserved; original sequencer behavior is not yet ported.")

func capture_views():
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://tests/screenshots"))
	var compact = "--compact" in OS.get_cmdline_user_args()
	if compact: get_window().size = Vector2i(1000,720)
	for index in tabs.get_tab_count():
		tabs.current_tab = index
		await get_tree().process_frame
		await RenderingServer.frame_post_draw
		var result = get_viewport().get_texture().get_image().save_png("res://tests/screenshots/%s-%d.png" % ["compact" if compact else "desktop",index])
		if result != OK: push_error("Screenshot failed: %d" % result)
	get_tree().quit()

func build_progression():
	var box = page("Growth replay")
	label(box,"Replay guild growth",24,GOLD)
	label(box,"HP, attack/defense, critical ability, and spell learning from supplied Rnd results.\nGrowth segment only: no training payment, quests, item effects, guildmaster awards, or campaign saves.",14,MUTED).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var controls = HBoxContainer.new()
	box.add_child(controls)
	var guild = OptionButton.new()
	guild.name = "GrowthGuild"
	for row in catalog.tables.guilds: guild.add_item(row.name)
	controls.add_child(guild)
	label(controls,"Current level")
	var level = SpinBox.new()
	level.min_value = 1
	level.max_value = 998
	level.value = 1
	controls.add_child(level)
	label(controls,"Constitution")
	var constitution = SpinBox.new()
	constitution.min_value = 1
	constitution.max_value = 99
	constitution.value = 18
	controls.add_child(constitution)
	var draws = LineEdit.new()
	draws.text = "0.5, 0.5, 0.5"
	draws.placeholder_text = "Supplied random draws"
	box.add_child(draws)
	var output = text_view(box)
	output.name = "GrowthOutput"
	var replay = func():
		var values = []
		for word in draws.text.split(","):
			if word.strip_edges().is_empty(): continue
			if not word.strip_edges().is_valid_float():
				output.text = "Enter comma-separated numeric draws."
				return
			values.append(float(word))
		var fixture = TownRules.new().new_character(Rules.creation_state(0,catalog.tables.races[0].raw),"Growth fixture",0,"",catalog,0)
		fixture.M58BB = guild.selected
		fixture.M5584[guild.selected].M4E82 = int(level.value)
		fixture.M55B5[3] = int(constitution.value)
		var result = GuildRules.new(catalog).growth_preview(fixture,Tape.new(values))
		result.erase("character")
		output.text = JSON.stringify(result,"  ")
	button(box,"Replay growth",replay).name = "ReplayGrowth"
	replay.call()
