extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", -10, 0)

func get_name():
	return "Reel In"
