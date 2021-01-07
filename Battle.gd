extends Node2D

signal win;

onready var player = $Player;
onready var enemy = $Enemy;

var distance: int = 0;
var tension: int = 0;

func _ready():
	play_turn();
	
func play_turn():
	player.play_turn()
	yield(player, "turn_finished")
	enemy.play_turn()
	yield(enemy, "turn_finished")
	check_end();
	
func check_end():
	if distance == 0:
		emit_signal("win")
	#TODO: Loss condition
	play_turn()

func on_move(distance_change: int, tension_change: int):
	distance += distance_change;
	tension += tension_change;
	
