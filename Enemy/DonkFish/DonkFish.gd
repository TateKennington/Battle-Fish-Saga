extends "res://Enemy/Enemy.gd"

signal move(distance_change, tension_change, move_name)

func play_turn():
	emit_signal("move", -10, 0, 'donk')
	yield(anim_player, 'animation_finished')
	.play_turn();
	
func _process(delta):
	if Input.is_key_pressed(KEY_UP):
		global_position.y += -1;
	if Input.is_key_pressed(KEY_DOWN):
		global_position.y += 1;
