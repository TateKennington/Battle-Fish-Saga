extends "res://Enemy/Enemy.gd"

signal move(distance_change, tension_change, move_name)

export(Resource) var donk;

func play_turn():
	emit_signal("move", donk)
	yield(anim_player, 'animation_finished')
	.play_turn();
