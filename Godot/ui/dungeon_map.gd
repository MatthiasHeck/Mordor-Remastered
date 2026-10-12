extends Control
## Developer atlas; this reveals stored geometry, not player discoveries.
signal selected(x: int, y: int)
var floor_data: Dictionary = {}
var chosen = Vector2i(9, 11)
var cell_size: float = 16.0
var origin = Vector2.ZERO
const COLORS = {12:Color("89b985"),13:Color("ccab71"),14:Color("b28fcd"),15:Color("548daf"),16:Color("a78a58"),18:Color("7e7ab8"),21:Color("c17967")}

func _ready():
	custom_minimum_size = Vector2(440,440)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	resized.connect(queue_redraw)

func _draw():
	if floor_data.is_empty(): return
	cell_size = floor(minf(size.x / floor_data.width, size.y / floor_data.height))
	origin = (size - Vector2(floor_data.width,floor_data.height) * cell_size) / 2
	for y in floor_data.height:
		for x in floor_data.width:
			var flags = int(floor_data.cells[y * floor_data.width + x].flags)
			var at = origin + Vector2(x,floor_data.height - y - 1) * cell_size
			var square = Rect2(at,Vector2.ONE * cell_size)
			var color = Color("222d37")
			if flags & (1 << 19): color = Color("10161d")
			else:
				for bit in COLORS:
					if flags & (1 << bit): color = COLORS[bit].darkened(0.4)
			draw_rect(square.grow(-1),color)
			if flags & 1: draw_line(at + Vector2(cell_size,0),at + Vector2(cell_size,cell_size),Color("80939b"),1.0)
			if flags & 2: draw_line(at,at + Vector2(cell_size,0),Color("80939b"),1.0)
			if flags & 20: draw_line(at + Vector2(cell_size,cell_size * 0.25),at + Vector2(cell_size,cell_size * 0.75),Color("d8af72") if flags & 4 else Color("b18cd8"),3.0)
			if flags & 40: draw_line(at + Vector2(cell_size * 0.25,0),at + Vector2(cell_size * 0.75,0),Color("d8af72") if flags & 8 else Color("b18cd8"),3.0)
			if flags & (1 << 11): draw_circle(square.get_center(),cell_size * 0.16,Color("d78774"))
	var at = origin + Vector2(chosen.x - 1,floor_data.height - chosen.y) * cell_size
	draw_rect(Rect2(at,Vector2.ONE * cell_size).grow(-2),Color("f1ddb3"),false,2.0)

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not floor_data.is_empty():
		var local = (event.position - origin) / cell_size
		var x = int(floor(local.x)) + 1
		var y = floor_data.height - int(floor(local.y))
		if x >= 1 and x <= floor_data.width and y >= 1 and y <= floor_data.height:
			chosen = Vector2i(x,y)
			selected.emit(x,y)
			queue_redraw()
