extends "res://Enemy/Enemy.gd"

signal move(distance_change, tension_change)

func play_turn():
	print('Donk!')
	emit_signal("move", 0, 0)
	.play_turn();
