extends "res://Enemy/Enemy.gd"

signal move(distance_change, tension_change, move_name)

func play_turn():
	emit_signal("move", -5, 10, 'donk')
	yield(anim_player, 'animation_finished')
	.play_turn();
