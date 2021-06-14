tool
extends Control

class_name BattleGUI

signal choose_move;

onready var tension_bar: TensionBar = $StatsPanel/Tension/TensionBar
onready var distance_bar: TensionBar = $StatsPanel/Distance/DistanceBar
onready var special_bar = $StatsPanel/Special/SpecialBar
onready var menu: Menu = $Panel/CenterContainer/Menu

var moves_list;
var current_menu;

func change_menu(new_menu: String):
	current_menu = new_menu;
	update_menu();

func set_moves_list(moves: Dictionary):
	moves_list = moves;
	current_menu = "basics"
	moves_list["basics"].append({ 'name': 'special'});
	moves_list["specials"].append({ 'name':'back' });
	update_menu();

func update_menu():
	menu.clear();
	for move in moves_list[current_menu]:
		print(move)
		menu.add_move(move.name)

func set_tension(tension: float):
	tension_bar.set_value(tension)

func set_distance(distance: float):
	distance_bar.set_value(distance)

func select_move(index: int):
	var current_move = moves_list[current_menu][index]
	if current_move.name == "special":
		change_menu("specials")
		return;
	if current_move.name == "back":
		change_menu("basics")
		return
	deactivate();
	if 'tension_cost' in current_move || 'slack_cost' in current_move:
		special_bar.spend(current_move.tension_cost, current_move.slack_cost)
	special_bar.clear_cost()
	emit_signal("choose_move", current_menu, index);

func hover_move(index: int):
	var current_move = moves_list[current_menu][index]
	if 'tension_cost' in current_move || 'slack_cost' in current_move:
		special_bar.show_cost(current_move.tension_cost, current_move.slack_cost)
		return;
	special_bar.clear_cost()

func activate():
	menu.set_process_input(true);
	menu.visible = true;

func deactivate():
	menu.set_process_input(false);
	menu.visible = false;

func push_special(special:int):
	special_bar.push_special(special)
