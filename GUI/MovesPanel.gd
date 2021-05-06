extends Panel

onready var move_label = preload("res://GUI/Components/MenuItem/MenuItem.tscn");

func add_move(name:String):
	var new_label: MenuItem = move_label.instance();
	$Items.add_child(new_label);
	new_label.text = name;
	new_label.expand = false;

func clear():
	for child in $Items.get_children():
		$Items.remove_child(child)
		child.queue_free();
