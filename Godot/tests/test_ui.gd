extends SceneTree
var failures: Array = []
var checks: int = 0

func _initialize():
	run.call_deferred()

func check(condition: bool, message: String):
	checks += 1
	if not condition:
		failures.append(message)
		printerr(message)

func run():
	var app = load("res://ui/main.tscn").instantiate()
	root.add_child(app)
	await process_frame
	check(app.tabs.get_tab_count() == 9,"All nine panels created")
	var list = app.find_child("RecordList",true,false)
	var search = app.find_child("RecordSearch",true,false)
	check(list.item_count == 401,"All monster rows in native UI")
	search.text = "Dragon"
	search.text_changed.emit(search.text)
	check(list.item_count > 0 and list.item_count < 401,"Record search signal filters rows")
	for index in list.item_count: check("dragon" in list.get_item_text(index).to_lower(),"Search results match")
	search.text = "no-such-record-8715"
	search.text_changed.emit(search.text)
	check(list.item_count == 0,"Empty record search clears stale results")
	search.text = ""
	search.text_changed.emit("")
	var kind = app.find_child("RecordKind",true,false)
	kind.select(1)
	kind.item_selected.emit(1)
	check(list.item_count == 366,"Record category signal selects item table")
	app.race_picker.select(2)
	app.race_picker.item_selected.emit(2)
	check(app.creation.M5821 == 2 and app.alignment_picker.item_count == 1,"Race signal updates allowed alignments")
	check(app.alignment_picker.get_item_id(0) == 1,"Giant remains neutral")
	var old_strength = app.creation.M55B5[0]
	app.adjust_stat(0,1)
	check(app.creation.M55B5[0] == old_strength + 1,"Allocation updates displayed state")
	var filter = app.find_child("SourceFilter",true,false)
	var sources = app.find_child("SourceList",true,false)
	filter.select(1)
	filter.item_selected.emit(1)
	check(sources.item_count == int(app.manifest.translated_procedures),"Coverage filter uses translation register")
	filter.select(3)
	filter.item_selected.emit(3)
	check(sources.item_count == int(app.manifest.procedure_count - app.manifest.translated_procedures - app.manifest.partial_procedures),"Unported procedures remain visible")
	var source_search = app.find_child("SourceSearch",true,false)
	source_search.text = "sub0C8A"
	source_search.text_changed.emit(source_search.text)
	check(sources.item_count == 1,"Unported companion attack dispatcher is discoverable")
	var picker = app.find_child("FloorPicker",true,false)
	picker.select(7)
	picker.item_selected.emit(7)
	var atlas = app.find_child("DungeonMap",true,false)
	check(atlas.floor_data.floor == 8,"Floor selection updates atlas")
	atlas.selected.emit(5,6)
	app.find_child("ReplayGrowth",true,false).pressed.emit()
	var growth = JSON.parse_string(app.find_child("GrowthOutput",true,false).text)
	check(growth.status == "growth_segment_only_not_saved" and growth.level == 2,"Growth replay uses supplied-draw native control")
	# Validate every imported PNG resource; WAVs use the independently tested codec.
	for asset in app.manifest.files:
		if asset.target.ends_with(".png"): check(load("res://" + asset.target) is Texture2D,"Load texture: " + asset.target)
	var report = {"checks":checks,"failures":failures,"scope":"Scene startup and native control signals"}
	var file = FileAccess.open("res://tests/ui-results.json",FileAccess.WRITE)
	file.store_string(JSON.stringify(report,"\t") + "\n")
	print("UI PASS" if failures.is_empty() else "UI FAIL", ": ", checks, " checks; ", failures.size(), " failures")
	app.queue_free()
	await process_frame
	quit(0 if failures.is_empty() else 1)
