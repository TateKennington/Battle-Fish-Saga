extends "res://Player/Abilities/Ability.gd"

func _ready():
	move_name = 'Test'
	tension_cost = 1;

func ability():
	emit_signal("move", 20, 20, move_name.to_lower())
