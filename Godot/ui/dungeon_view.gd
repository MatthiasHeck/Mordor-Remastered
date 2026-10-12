extends Control
## Native perspective presentation. Geometry comes from the recovered edge rules;
## this is not a reproduction of the original VB renderer or its visibility rolls.
const Rules = preload("res://core/dungeon_rules.gd")
var catalog
var map
var character: Dictionary = {}
const INSETS = [Vector2(0,0),Vector2(0.18,0.17),Vector2(0.29,0.28),Vector2(0.36,0.35),Vector2(0.41,0.40)]

func _ready():
	custom_minimum_size = Vector2(450,300)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)

func frame(depth: int) -> Rect2:
	var inset = INSETS[depth] * size
	return Rect2(inset,size - inset * 2)

func panel(points: Array, color: Color):
	var polygon = PackedVector2Array(points)
	draw_colored_polygon(polygon,color)
	polygon.append(points[0])
	draw_polyline(polygon,Color("64717a").darkened(0.25),1.2,true)

func visible_mask(edge: Dictionary, level: int) -> int:
	var mask = int(edge.mask)
	if mask & 4 and not map.flags(level,edge.x,edge.y) & (1 << (edge.axis + 4)): return 1
	return mask

func _draw():
	draw_rect(Rect2(Vector2.ZERO,size),Color("0e141d"))
	if catalog == null or character.is_empty(): return
	draw_rect(Rect2(Vector2(0,size.y / 2),Vector2(size.x,size.y / 2)),Color("252b30"))
	var square = catalog.cell(character.M5470,character.M583F,character.M5845)
	if square.is_empty(): return
	if square.flags & (1 << 20):
		for i in 12:
			draw_rect(Rect2(Vector2(0,i * size.y / 12),Vector2(size.x,size.y / 12 + 1)),Color("8b979e").darkened(0.48 + absf(i - 6) * 0.035))
		return
	var rules = Rules.new(catalog)
	var steps = []
	var at = Vector2i(character.M583F,character.M5845)
	var facing = int(character.M5899)
	for depth in 4:
		var front = visible_mask(rules.edge(character.M5470,at,facing),character.M5470)
		steps.append({"front":front,"left":visible_mask(rules.edge(character.M5470,at,posmod(facing - 2,4) + 1),character.M5470),"right":visible_mask(rules.edge(character.M5470,at,facing % 4 + 1),character.M5470)})
		if front != 0: break
		at += Rules.DIRECTIONS[facing - 1]
		var next = catalog.cell(character.M5470,at.x,at.y)
		if next.is_empty() or next.flags & (1 << 20): break
	for depth in range(steps.size() - 1,-1,-1):
		var outer = frame(depth)
		var inner = frame(depth + 1)
		var shade = Color("45515b").darkened(depth * 0.16)
		var step = steps[depth]
		if step.left:
			panel([outer.position,inner.position,Vector2(inner.position.x,inner.end.y),Vector2(outer.position.x,outer.end.y)],shade)
			if step.left & 6: draw_line(outer.position.lerp(inner.position,0.5),Vector2(outer.position.x,outer.end.y).lerp(Vector2(inner.position.x,inner.end.y),0.5),Color("bfa274").darkened(depth * 0.16),3)
		else:
			draw_line(inner.position,Vector2(outer.position.x,inner.position.y),shade,1)
			draw_line(Vector2(inner.position.x,inner.end.y),Vector2(outer.position.x,inner.end.y),shade,1)
		if step.right:
			panel([Vector2(outer.end.x,outer.position.y),Vector2(inner.end.x,inner.position.y),inner.end,outer.end],shade.darkened(0.12))
			if step.right & 6: draw_line(Vector2(outer.end.x,outer.position.y).lerp(Vector2(inner.end.x,inner.position.y),0.5),outer.end.lerp(inner.end,0.5),Color("bfa274").darkened(depth * 0.16),3)
		else:
			draw_line(Vector2(inner.end.x,inner.position.y),Vector2(outer.end.x,inner.position.y),shade,1)
			draw_line(inner.end,Vector2(outer.end.x,inner.end.y),shade,1)
		if step.front:
			draw_rect(inner,shade)
			draw_rect(inner,Color("74808a").darkened(depth * 0.18),false,1)
			if step.front & 6:
				var door = Rect2(inner.position + inner.size * Vector2(0.24,0.15),inner.size * Vector2(0.52,0.85))
				draw_rect(door,Color("675644").darkened(depth * 0.18))
				draw_rect(door,Color("bfa274").darkened(depth * 0.18),false,2)
				draw_circle(door.position + door.size * Vector2(0.82,0.6),maxf(1,3 - depth * 0.5),Color("d6b57b"))
	draw_rect(Rect2(Vector2.ZERO,size),Color("53616d"),false,1)
