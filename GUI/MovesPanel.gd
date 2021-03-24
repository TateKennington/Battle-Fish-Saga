extends Panel

onready var indicator = preload("res://GUI/Components/Indicator/Indicator.tscn");
onready var move_label = preload("res://GUI/Components/MoveLabel/MoveLabel.tscn");

func add_move(name:String):
	var new_label: Label = move_label.instance();
	new_label.text = name;
	$MoveLabels.add_child(new_label);
	$Indicators.add_child(indicator.instance());

func clear():
	for child in $MoveLabels.get_children():
		$MoveLabels.remove_child(child)
		child.queue_free();
	for child in $Indicators.get_children():
		$Indicators.remove_child(child)
		child.queue_free();
