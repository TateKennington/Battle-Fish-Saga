extends Control

class_name BattleGUI

signal choose_move;

onready var tension_bar: TensionBar = $StatsPanel/Tension/TensionBar
onready var distance_bar: TensionBar = $StatsPanel/Distance/DistanceBar

const window_size = 3;

var top = 0;
var selected = 0;
var moves_list;
var current_menu;

func change_menu(new_menu: String):
	top = 0;
	selected = 0;
	current_menu = new_menu;
	update_menu();

func set_moves_list(moves: Dictionary):
	moves_list = moves;
	current_menu = "basics"
	moves_list["basics"].append('special');
	moves_list["specials"].append('back');
	update_menu();

func update_menu():
	$MovesPanel.clear();
	for move in moves_list[current_menu]:
		print(move)
		$MovesPanel.add_move(move)
	update_indicators();
	
func update_indicators():
	for i in range($MovesPanel/Indicators.get_child_count()):
		$MovesPanel/Indicators.get_child(i).visible = false;
		$MovesPanel/Indicators.get_child(i).deactivate();
	for i in range($MovesPanel/MoveLabels.get_child_count()):
		$MovesPanel/MoveLabels.get_child(i).visible = false;
		
	for i in range(top, top+window_size):
		if i >= $MovesPanel/Indicators.get_child_count():
			break;
		$MovesPanel/Indicators.get_child(i).visible = true;
	for i in range(top, top+window_size):
		if i >= $MovesPanel/MoveLabels.get_child_count():
			break;
		$MovesPanel/MoveLabels.get_child(i).visible = true;
		
	$MovesPanel/Indicators.get_child(selected).activate();

func set_tension(tension: float):
	tension_bar.set_value(tension)

func set_distance(distance: float):
	distance_bar.set_value(distance)

func _input(event):
	if event is InputEventKey && event.is_pressed():
		var key = event as InputEventKey;
		if key.scancode == KEY_UP:
			selected = selected - 1;
		if key.scancode == KEY_DOWN:
			selected = selected + 1;
		if key.scancode == KEY_SPACE:
			if moves_list[current_menu][selected] == "special":
				change_menu("specials")
				return;
			if moves_list[current_menu][selected] == "back":
				change_menu("basics")
				return
			emit_signal("choose_move", current_menu, selected);
			deactivate();
		selected = clamp(selected, 0, $MovesPanel/Indicators.get_child_count()-1)
		if selected < top:
			top = selected
		if selected >= top + window_size:
			top = selected - window_size + 1
		update_indicators()

func activate():
	set_process_input(true);
	visible = true

func deactivate():
	set_process_input(false);
	visible = false
