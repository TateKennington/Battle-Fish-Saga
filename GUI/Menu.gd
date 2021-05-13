extends VBoxContainer

signal selected(index)

onready var move_label = preload("res://GUI/Components/MenuItem/MenuItem.tscn");

var active: int = 0;

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
			emit_signal("selected", active)
		active = clamp(active, 0, get_child_count() - 1)
		update_items()
		print(active)

func update_items():
	var items: Array = get_children();
	if items.empty():
		return;
	for item in items:
		item.deactivate();
	items[active].activate();

func add_move(name:String, expand = false):
	var new_label: MenuItem = move_label.instance();
	add_child(new_label);
	new_label.text = name;
	new_label.expand = expand;
	update_items();

func clear():
	active = 0
	for item in get_children():
		remove_child(item)
		item.queue_free();
