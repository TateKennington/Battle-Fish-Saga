extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", -10, -20)

func get_name():
	return "Give it Slack"
