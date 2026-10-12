extends Control
## Player map: reads saved MDATA8 discoveries only, never raw dungeon geometry.
var map
var character: Dictionary = {}
const VISITED = 1 << 23

func _ready():
	custom_minimum_size = Vector2(340,340)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)

func _draw():
	if map == null or character.is_empty(): return
	var unit = floor(minf(size.x,size.y) / 30.0)
	var origin = (size - Vector2.ONE * unit * 30) / 2.0
	draw_rect(Rect2(origin,Vector2.ONE * unit * 30),Color("0d121a"))
	if character.M59F4[0] != 0: return # Do not reveal which floor a lost teleport reached.
	for y in range(1,31):
		for x in range(1,31):
			var flags = map.flags(character.M5470,x,y)
			var at = origin + Vector2(x - 1,30 - y) * unit
			var rect = Rect2(at,Vector2.ONE * unit)
			if flags & VISITED:
				draw_rect(rect.grow(-0.5),Color("344756") if not flags & (1 << 20) else Color("49545c"))
				if x == 1: draw_line(at,at + Vector2(0,unit),Color("98a7af"))
				if y == 1: draw_line(at + Vector2(0,unit),at + Vector2.ONE * unit,Color("98a7af"))
			if flags & 1: draw_line(at + Vector2(unit,0),at + Vector2.ONE * unit,Color("98a7af"))
			if flags & 2: draw_line(at,at + Vector2(unit,0),Color("98a7af"))
			if flags & 20: draw_line(at + Vector2(unit,unit * 0.2),at + Vector2(unit,unit * 0.8),Color("b499c9") if flags & 16 else Color("e2b67c"),2)
			if flags & 40: draw_line(at + Vector2(unit * 0.2,0),at + Vector2(unit * 0.8,0),Color("b499c9") if flags & 32 else Color("e2b67c"),2)
			if flags & ((1 << 12) | (1 << 13)):
				for i in 3:
					draw_line(at + Vector2(2,2 + i * 2),at + Vector2(unit - 2 - i,2 + i * 2),Color("a9d1ad"))
			if flags & (1 << 14): draw_circle(rect.get_center(),unit * 0.25,Color("b499c9"))
	if character.M59F4[0] != 0 or character.M59F4[1] != 0: return
	var center = origin + Vector2(character.M583F - 0.5,30.5 - character.M5845) * unit
	if character.M59F4[2] != 0:
		draw_circle(center,unit * 0.32,Color("ffde9c"))
		return
	var points = PackedVector2Array()
	for point in [Vector2(0,-0.48),Vector2(0.35,0.35),Vector2(0,0.16),Vector2(-0.35,0.35)]:
		points.append(center + point.rotated((character.M5899 - 1) * PI / 2.0) * unit)
	draw_colored_polygon(points,Color("ffde9c"))
