extends Node2D

class_name Player

onready var abilities = $Abilities.get_children();
onready var specials = $SpecialAbilities.get_children();

func perform_move(index: int):
	abilities[index].ability();

func get_moves_list() -> Dictionary:
	var result = {
		"basics": [],
		"specials": []
	};
	for ability in abilities:
		result["basics"].push_back(ability.get_name().to_lower())
	for special in specials:
		result["specials"].push_back(special.get_name().to_lower())
	return result;
