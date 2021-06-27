extends Node2D

class_name Player

onready var abilities = $Abilities;

func get_moves_list() -> Array:
	return abilities.get_children();

func connect_abilities(reciever: Object):
	for ability in abilities.get_children():
		ability.connect('move', reciever, 'on_move')
