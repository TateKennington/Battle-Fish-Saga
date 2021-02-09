tool

extends Control

class_name TensionBar

export(float) var value setget set_value;

func set_value(new_value: float):
	value = new_value;
	update();

func _draw():
	draw_rect(Rect2(rect_pivot_offset, rect_size), Color("#CCCCCC"))
	draw_rect(Rect2(rect_pivot_offset + Vector2(2, 2), rect_size - Vector2(4, 4)), Color("#777"))
	draw_rect(Rect2(Vector2(rect_pivot_offset.x + 0.5*rect_size.x, rect_pivot_offset.y+2), Vector2(value/100*(rect_size.x/2-2), rect_size.y-4)), Color.red)
