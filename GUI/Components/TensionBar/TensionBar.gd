tool

extends Control

class_name TensionBar

export(float) var value = 0 setget set_value;
export(float) var hover_value = 0 setget set_hover_value;
export(float) var hover_alpha = 0 setget set_hover_alpha;

func set_value(new_value: float):
	value = new_value;
	update();
	
func set_hover_value(value_change: float):
	hover_value = value_change;
	update();

func set_hover_alpha(new_value: float):
	hover_alpha = new_value;
	update();

func _ready():
	$AnimationPlayer.play("hover");

func _draw():
	var hover_color = Color.red
	var curr_value = value
	var hover = value + hover_value
	
	hover_color.a = hover_alpha
	if hover * curr_value >= 0 && abs(hover) < abs(curr_value):
		var temp = curr_value
		curr_value = hover
		hover = temp
		hover_color.a += 0.6

	hover = clamp(hover, -100, 100)
	curr_value = clamp(curr_value, -100, 100)

	draw_rect(Rect2(rect_pivot_offset, rect_size), Color("#CCCCCC"))
	draw_rect(Rect2(rect_pivot_offset + Vector2(2, 2), rect_size - Vector2(4, 4)), Color("#777"))
	draw_rect(Rect2(Vector2(rect_pivot_offset.x + 0.5*rect_size.x, rect_pivot_offset.y+2), Vector2(hover/100*(rect_size.x/2-2), rect_size.y-4)), hover_color)
	draw_rect(Rect2(Vector2(rect_pivot_offset.x + 0.5*rect_size.x, rect_pivot_offset.y+2), Vector2(curr_value/100*(rect_size.x/2-2), rect_size.y-4)), Color.red)
