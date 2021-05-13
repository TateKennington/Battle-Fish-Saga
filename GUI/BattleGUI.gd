extends Control

class_name BattleGUI

signal choose_move;

onready var tension_bar: TensionBar = $StatsPanel/Tension/TensionBar
onready var distance_bar: TensionBar = $StatsPanel/Distance/DistanceBar

var moves_list;
var current_menu;

func change_menu(new_menu: String):
	current_menu = new_menu;
	update_menu();

func set_moves_list(moves: Dictionary):
	moves_list = moves;
	current_menu = "basics"
	moves_list["basics"].append('special');
	moves_list["specials"].append('back');
	update_menu();

func update_menu():
	$Menu.clear();
	for move in moves_list[current_menu]:
		print(move)
		$Menu.add_move(move)

func set_tension(tension: float):
	tension_bar.set_value(tension)

func set_distance(distance: float):
	distance_bar.set_value(distance)

func select_move(index: int):
	if moves_list[current_menu][index] == "special":
		change_menu("specials")
		return;
	if moves_list[current_menu][index] == "back":
		change_menu("basics")
		return
	deactivate();
	emit_signal("choose_move", current_menu, index);

func activate():
	set_process_input(true);
	$Menu.visible = true;

func deactivate():
	set_process_input(false);
	$Menu.visible = false;
