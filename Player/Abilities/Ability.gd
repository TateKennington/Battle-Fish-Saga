extends Node

signal move(distance_change, tension_change, move_name);

func ability():
	print("Ability not implemented")

func get_name() -> String:
	return name;

func get_tension_cost():
	return 0
	
func get_slack_cost():
	return 0
