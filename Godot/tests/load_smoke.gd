extends SceneTree
const Catalog = preload("res://core/original_data.gd")

func _initialize():
	var catalog = Catalog.new()
	if not catalog.load_all():
		printerr(catalog.error)
		quit(1)
		return
	for name in catalog.tables:
		print(name, ": ", catalog.tables[name].size())
	print("floors: ", catalog.floors.size(), "; typed records: ", catalog.spans.size())
	quit()
