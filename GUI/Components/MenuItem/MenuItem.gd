tool
extends HBoxContainer

class_name MenuItem

export(String) var text = 'Text' setget set_text
export(bool) var expand = false setget set_expand

onready var indicator: TextureRect = $Container/Indicator;

func set_text(new_text: String):
	text = new_text;
	var label = get_node_or_null('Label');
	if label:
		label.text = text.to_lower();

func set_expand(new_expand: bool):
	expand = new_expand;
	var label = get_node_or_null('Label');
	if expand && label:
		label.size_flags_horizontal = label.size_flags_horizontal | SIZE_EXPAND
	elif label:
		label.size_flags_horizontal = label.size_flags_horizontal & ~SIZE_EXPAND

func activate():
	indicator.show();
	
func deactivate():
	indicator.hide();
	
func hide():
	visible = false;

func show():
	visible = true;
	
func enable():
	var label = get_node_or_null('Label');
	label.add_color_override("font_color", Color(1, 1, 1, 1))
	
func disable():
	var label = get_node_or_null('Label');
	label.add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
