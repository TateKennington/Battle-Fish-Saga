extends "res://Enemy/Enemy.gd"

signal move(distance_change, tension_change)

func play_turn():
	emit_signal("move", -10, 0)
	animPlayer.play("donk")
	yield(animPlayer, 'animation_finished')
	.play_turn();
