tool
extends Panel

class_name MenuTile

export(String) var text = 'Text' setget set_text
export(bool) var expand = false setget set_expand

onready var indicator: TextureRect = $MenuItem/Container/Indicator;

func set_text(new_text: String):
	text = new_text;
	var label = get_node_or_null('MenuItem/Label');
	if label:
		label.text = text.to_lower();

func set_expand(new_expand: bool):
	expand = new_expand;
	var label = get_node_or_null('MenuItem/Label');
	if expand && label:
		$MenuItem/Label.size_flags_horizontal = $MenuItem/Label.size_flags_horizontal | SIZE_EXPAND
	elif label:
		$MenuItem/Label.size_flags_horizontal = $MenuItem/Label.size_flags_horizontal & ~SIZE_EXPAND

func activate():
	indicator.show();
	
func deactivate():
	indicator.hide();
	
func hide():
	visible = false;

func show():
	visible = true;
