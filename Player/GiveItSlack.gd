extends "res://Player/Abilities/Ability.gd"

func ability():
	emit_signal("move", 0, -20)

func get_name():
	return "Give it Slack"
