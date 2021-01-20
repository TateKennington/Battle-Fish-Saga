extends Node2D

class_name Enemy

signal turn_finished;

func play_turn():
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("turn_finished")
