extends NinePatchRect

class_name PlayerDialog

onready var dialog: Label = $HBoxContainer/Label;
onready var tension: Label = $HBoxContainer/CostIndicator/Tension/Label;
onready var slack: Label = $HBoxContainer/CostIndicator/Slack/Label;

func set_dialog(new_dialog: String):
	dialog.text = new_dialog
	
func set_tension(new_tension: int):
	tension.text = '%d'%new_tension

func set_slack(new_slack: int):
	slack.text = '%d'%new_slack

func show_cost():
	$HBoxContainer/CostIndicator.visible = true

func hide_cost():
	$HBoxContainer/CostIndicator.visible = false
