tool
extends TextureRect

class_name Special_Counter

enum State {
	Tense = 0,
	Slack = 1,
	Inactive = 2
}

const icons = [
	preload('res://GUI/Components/SpecialCounter/Indicator3.png'),
	preload('res://GUI/Components/SpecialCounter/Indicator2.png'),
	preload('res://GUI/Components/SpecialCounter/Indicator1.png'),
]

export var current_state = State.Inactive setget set_state;

func set_state(new_state: int):
	current_state = clamp(new_state, 0, State.size() - 1);
	texture = icons[current_state];

func start_animation():
	get_material().set_shader_param("AnimationMultiplier", 0.5)
	
func stop_animation():
	get_material().set_shader_param("AnimationMultiplier", 0)
