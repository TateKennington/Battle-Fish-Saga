extends Resource;

class_name Ability

export(String) var move_name: String setget set_move_name
export(int) var tension_cost: int;
export(int) var slack_cost: int;
export(int) var tension_change: int;
export(int) var distance_change: int;
export(Animation) var fish_animation: Animation;

func set_move_name(new_move_name: String):
	move_name = new_move_name.to_lower()

func _init(
	_move_name = 'Unnamed'.to_lower(),
	_tension_change = 0,
	_distance_change = 0,
	_fish_animation = null,
	_tension_cost = 0,
	_slack_cost = 0
):
	move_name = _move_name.to_lower()
	tension_change = _tension_change
	distance_change = _distance_change
	fish_animation = _fish_animation
	tension_cost = _tension_cost
	slack_cost = _slack_cost
