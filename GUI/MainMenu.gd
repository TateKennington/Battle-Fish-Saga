extends Control

func start():
	SceneManager.load_battle();

func _on_Menu_selected(index: int):
	if index == 0:
		start();
	elif index == 1:
		get_tree().quit(0)
