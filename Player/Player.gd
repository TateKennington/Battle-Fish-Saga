extends Node2D

class_name Player

signal turn_finished;

onready var abilities = $Abilities.get_children();

var playing_turn: bool = false;

func play_turn():
	playing_turn = true;
	
func _input(event):
	if playing_turn && event is InputEventKey && event.is_pressed():
		var key = event as InputEventKey;
		if key.scancode == KEY_SPACE:
			abilities[0].ability();
			playing_turn = false;
			emit_signal("turn_finished");
