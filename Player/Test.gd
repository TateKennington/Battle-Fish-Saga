extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", 20, 20, get_name().to_lower())

func get_name():
	return "Reel In"

func get_tension_cost():
	return 1;
