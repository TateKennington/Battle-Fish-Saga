extends Node2D

class_name Player

onready var abilities = $Abilities;

func perform_move(type: String, index: int):
	abilities.get_node(type).get_child(index).ability();

func get_moves_list() -> Dictionary:
	var result = {
		"basics": [],
		"specials": []
	};
	for basic in abilities.get_node("basics").get_children():
		result["basics"].push_back(basic.get_name().to_lower())
	for special in abilities.get_node("specials").get_children():
		result["specials"].push_back(special.get_name().to_lower())
	return result;

func connect_abilities(reciever: Object):
	for basic in abilities.get_node("basics").get_children():
		basic.connect('move', reciever, 'on_move')
	for special in abilities.get_node("specials").get_children():
		special.connect('move', reciever, 'on_move')
