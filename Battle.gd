extends Node2D

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

func on_move(distance_change: int, tension_change: int):
	distance += distance_change;
	tension += tension_change;
	
