extends HBoxContainer

var current_index = 0;

func _ready():
	clear();
	for i in range(5):
		push_special(Special_Counter.State.Slack)
		push_special(Special_Counter.State.Tense)
	show_cost(3, 2)

func push_special(special: int):
	get_child(current_index).current_state = special;
	current_index += 1;

func spend(num_tension: int, num_slack: int):
	var new_index: int = current_index - num_tension - num_slack;
	for index in range(0, current_index):
		var child: Special_Counter = get_child(index);
		var state = child.current_state
		if num_tension > 0 && state == Special_Counter.State.Tense:
			num_tension -= 1;
			child.current_state = Special_Counter.State.Inactive
		if num_slack > 0 && state == Special_Counter.State.Slack:
			num_slack -= 1;
			child.current_state = Special_Counter.State.Inactive
	var empty = 0;
	for index in range(0, current_index):
		while get_child(empty).current_state != Special_Counter.State.Inactive && empty < current_index:
			empty += 1
		if empty < index:
			get_child(empty).current_state = get_child(index).current_state
			get_child(index).current_state = Special_Counter.State.Inactive
	current_index = new_index

func show_cost(num_tension: int, num_slack: int):
	for index in range(0, current_index):
		var child: Special_Counter = get_child(index);
		var state = child.current_state
		if num_tension > 0 && state == Special_Counter.State.Tense:
			num_tension -= 1;
			child.start_animation()
			print("Animating")
		if num_slack > 0 && state == Special_Counter.State.Slack:
			num_slack -= 1;
			child.start_animation()
			print("Animating")
		print(current_index, num_tension, num_slack)

func clear():
	for child in get_children():
		child.current_state = Special_Counter.State.Inactive
		child.stop_animation()
