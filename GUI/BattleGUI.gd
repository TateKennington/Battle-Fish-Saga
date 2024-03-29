tool
extends Control

class_name BattleGUI

signal choose_move;

onready var tension_bar: TensionBar = $StatsPanel/Tension/TensionBar
onready var distance_bar: TensionBar = $StatsPanel/Distance/DistanceBar
onready var special_bar = $StatsPanel/Special/SpecialBar
onready var menu: Menu = $Panel/CenterContainer/Menu
onready var battle = get_tree().root.get_node('Battle');
onready var playerDialog: PlayerDialog = $PlayerDialog;

var moves_list;
var current_menu;

func change_menu(new_menu: String):
	current_menu = new_menu;
	update_menu();
	hover_move(0)

func set_moves_list(moves: Array):
	moves_list = {
		"basics": [],
		"specials": []
	};
	for _move in moves:
		var move: Ability = _move;
		if move.tension_cost > 0 || move.slack_cost > 0:
			moves_list["specials"].append(move);
		else:
			moves_list["basics"].append(move);
			
	current_menu = "basics"
	var special = Ability.new('special');
	moves_list["basics"].append(special);
	
	var back = Ability.new('back');
	moves_list["specials"].append(back);
	update_menu();

func update_menu():
	menu.clear();
	for move in moves_list[current_menu]:
		menu.add_item(move.move_name, false, battle.can_use_move(move))

func set_tension(tension: float):
	tension_bar.set_value(tension)

func set_distance(distance: float):
	distance_bar.set_value(distance)

func select_move(index: int):
	var current_move: Ability = moves_list[current_menu][index]
	if !battle.can_use_move(current_move):
		return
	if current_move.move_name == "special":
		change_menu("specials")
		return;
	if current_move.move_name == "back":
		change_menu("basics")
		return
	deactivate();
	if current_move.tension_cost > 0 || current_move.slack_cost > 0:
		special_bar.spend(current_move.tension_cost, current_move.slack_cost)
	tension_bar.hover_value = 0
	distance_bar.hover_value = 0
	special_bar.clear_cost()
	emit_signal("choose_move", current_move)

func hover_move(index: int):
	var current_move: Ability = moves_list[current_menu][index]
	tension_bar.hover_value = current_move.tension_change
	distance_bar.hover_value = current_move.distance_change
	
	player_dialog(current_move)
	
	if current_move.tension_cost > 0 || current_move.slack_cost > 0 && battle.can_use_move(current_move):
		special_bar.show_cost(current_move.tension_cost, current_move.slack_cost)
	else:
		special_bar.clear_cost()

func activate():
	hover_move(menu.active)
	var moves: Array = moves_list[current_menu];
	for i in range(moves.size()):
		menu.set_enabled(i, battle.can_use_move(moves[i]))
	menu.set_process_input(true);
	menu.visible = true;

func deactivate():
	menu.set_process_input(false);
	menu.visible = false;

func push_special(special:int):
	special_bar.push_special(special)

func enemy_dialog(dialog: String):
	$EnemyDialog/Label.text = dialog
	$EnemyDialog.visible = true

func player_callout(callout: String):
	playerDialog.set_dialog(callout)
	playerDialog.hide_cost()
	playerDialog.visible = true

func player_dialog(move: Ability):
	if move.description.length() > 0:
		playerDialog.set_dialog(move.description)
		playerDialog.visible = true
	else:
		playerDialog.set_dialog('')
		playerDialog.visible = false
	
	if move.tension_cost > 0 || move.slack_cost > 0:
		playerDialog.set_tension(move.tension_cost)
		playerDialog.set_slack(move.slack_cost)
		playerDialog.show_cost()
	else:
		playerDialog.hide_cost()
	
func clear_dialog():
	$PlayerDialog.visible = false
	$EnemyDialog.visible = false
