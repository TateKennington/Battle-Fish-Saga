extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", -10, 10)
