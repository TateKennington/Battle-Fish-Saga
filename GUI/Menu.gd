tool
extends VBoxContainer

class_name Menu

signal selected(index)
signal hovered(index)

export(Resource) var menu_item = preload("res://GUI/Components/MenuItem/MenuItem.tscn");
export var window: int = 3 setget set_window;

var active: int = 0;
var top: int = 0;
var states: Array = [];

func _ready():
	update_items();

func _input(event):
	if event is InputEventKey && event.is_pressed():
		var key = event as InputEventKey;
		if key.scancode == KEY_UP:
			active = active - 1;
		if key.scancode == KEY_DOWN:
			active = active + 1;
		if key.scancode == KEY_SPACE:
			return emit_signal("selected", active)
		active = clamp(active, 0, get_child_count() - 1)
		update_items()
		emit_signal("hovered", active)

func update_items():
	if active < top:
		top = active;
	if top + window <= active:
		top = active - window + 1;
	if get_child_count() == 0:
		return;
	var items: Array = get_children();
	if items.empty():
		return;
		
	for index in range(items.size()):
		var item = items[index];
		item.deactivate();
		
		if index < top || index >= top + window:
			item.hide();
		else:
			item.show();
			
		if index >= states.size():
			states.append(true)
			
		if states[index]:
			item.enable();
		else:
			item.disable();
		
	items[active].activate();

func add_item(name:String, expand = false, state = true):
	var new_label = menu_item.instance();
	add_child(new_label);
	new_label.text = name;
	new_label.expand = expand;
	states.append(state)
	update_items();

func clear():
	active = 0
	states = [];
	for item in get_children():
		remove_child(item)
		item.queue_free();

func set_window(new_window:int):
	window = new_window;
	update_items();

func set_enabled(index: int, state: bool):
	states[index] = state;
