extends "res://Player/Abilities/Ability.gd"

func _ready():
	move_name = "Give it Slack"

func ability():
	emit_signal("move", 0, -50, move_name.to_lower())
