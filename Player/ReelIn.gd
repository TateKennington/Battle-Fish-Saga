extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", 0, 10)

func get_name():
	return "Reel In"
