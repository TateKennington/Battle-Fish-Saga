extends HBoxContainer

var current_index = 0;

func push_special(special: int):
	get_child(current_index).current_state = special;
	current_index += 1;
	
func clear():
	for child in get_children():
		child.current_state = Special_Counter.State.Inactive
