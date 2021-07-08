tool

extends Control

class_name TensionBar

export(float) var value setget set_value;
export(float) var hover_value setget set_hover_value;
export(float) var hover_alpha setget set_hover_alpha;

func set_value(new_value: float):
	value = new_value;
	update();
	
func set_hover_value(value_change: float):
	hover_value = value + value_change;
	update();

func set_hover_alpha(new_value: float):
	hover_alpha = new_value;
	update();

func _ready():
	$AnimationPlayer.play("hover");

func _draw():
	var hover_color = Color.red
	hover_color.a = hover_alpha
	draw_rect(Rect2(rect_pivot_offset, rect_size), Color("#CCCCCC"))
	draw_rect(Rect2(rect_pivot_offset + Vector2(2, 2), rect_size - Vector2(4, 4)), Color("#777"))
	draw_rect(Rect2(Vector2(rect_pivot_offset.x + 0.5*rect_size.x, rect_pivot_offset.y+2), Vector2(hover_value/100*(rect_size.x/2-2), rect_size.y-4)), hover_color)
	draw_rect(Rect2(Vector2(rect_pivot_offset.x + 0.5*rect_size.x, rect_pivot_offset.y+2), Vector2(value/100*(rect_size.x/2-2), rect_size.y-4)), Color.red)
