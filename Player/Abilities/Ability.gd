extends Resource;

class_name Ability

export(String) var move_name: String setget , get_move_name
export(int) var tension_cost: int;
export(int) var slack_cost: int;
export(int) var tension_change: int;
export(int) var distance_change: int;
export(Animation) var fish_animation: Animation;
export(String) var description: String setget , get_move_description;

func get_move_name() -> String:
	return move_name.to_lower()

func get_move_description() -> String:
	return description.to_lower()

func _init(
	_move_name = 'Unnamed',
	_tension_change = 0,
	_distance_change = 0,
	_fish_animation = null,
	_tension_cost = 0,
	_slack_cost = 0,
	_description = ""
):
	move_name = _move_name
	tension_change = _tension_change
	distance_change = _distance_change
	fish_animation = _fish_animation
	tension_cost = _tension_cost
	slack_cost = _slack_cost
	description = _description
