extends Node;

class_name Ability

signal move(distance_change, tension_change, move_name);

var move_name: String = 'Unnamed'
var tension_cost: int = 0;
var slack_cost: int = 0;
var fish_animation: Animation;

func ability():
	print("Ability not implemented")

