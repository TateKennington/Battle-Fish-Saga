extends "res://Player/Abilities/Ability.gd"

func _ready():
	move_name = "Reel In"
	fish_animation = load('res://Player/Abilities/ReelIn/FishAnimation.tres')

func ability():
	emit_signal("move", 20, 20, move_name.to_lower())

