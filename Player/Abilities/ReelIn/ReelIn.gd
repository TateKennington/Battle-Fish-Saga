extends "res://Player/Abilities/Ability.gd"

var fish_animation = preload('FishAnimation.tres')

func ability():
	emit_signal("move", 20, 20, get_name().to_lower())

func get_name():
	return "Reel In"
