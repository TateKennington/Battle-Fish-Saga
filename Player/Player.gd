extends Node2D

class_name Player

onready var abilities = $Abilities.get_children();

func perform_move(index: int):
	abilities[index].ability();

func get_moves_list() -> Array:
	var result = [];
	for ability in abilities:
		result.push_back(ability.get_name().to_lower())
	return result;
