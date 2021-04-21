extends Node2D

signal win;
signal lose;

onready var player: Player = $Player;
onready var enemy: Enemy = $ViewportContainer/Viewport/Enemy.get_child(0);
onready var gui: BattleGUI = $CanvasLayer/BattleGUI;

var distance: float = 0;
var tension: float = 0;

func _ready():
	gui.connect("choose_move", player, "perform_move")
	enemy.connect("move", self, "on_move");
	player.connect_abilities(self)
	gui.set_tension(0)
	gui.set_distance(0)
	gui.set_moves_list(player.get_moves_list())
	play_turn();
	
func play_turn():
	gui.activate();
	yield(gui, "choose_move")
	check_end();
	print("Enemy Turn")
	enemy.play_turn()
	yield(enemy, "turn_finished")
	check_end();
	play_turn();
	
func check_end():
	if distance >= 100:
		emit_signal("win")
	if tension >= 100:
		emit_signal("lose")
		print("You lose")
		get_tree().quit()

func on_move(distance_change: float, tension_change: float):
	print(distance_change)
	print(tension_change)
	distance += distance_change;
	tension += tension_change;
	gui.set_tension(tension);
	gui.set_distance(distance);
	enemy.position.x = distance/100 * 300;
	enemy.position.y = 200 - 2*max(distance, 0);
	
	
