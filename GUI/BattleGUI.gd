extends Control

class_name BattleGUI

onready var tension_bar: TensionBar = $StatsPanel/TensionBar

var selected = 0;

func _ready():
	update_indicators();

func update_indicators():
	for i in range($MovesPanel/Indicators.get_child_count()):
		$MovesPanel/Indicators.get_child(i).get_child(0).visible = false
	$MovesPanel/Indicators.get_child(selected).get_child(0).visible = true

func set_tension(tension: float):
	tension_bar.set_value(tension)

func _input(event):
	if event is InputEventKey && event.is_pressed():
		var key = event as InputEventKey;
		if key.scancode == KEY_UP:
			selected = selected - 1;
		if key.scancode == KEY_DOWN:
			selected = selected + 1;
		selected = clamp(selected, 0, $MovesPanel/Indicators.get_child_count()-1)
		update_indicators()
