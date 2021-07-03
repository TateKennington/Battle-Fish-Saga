extends Node

func load_battle(level: Level):
	get_tree().change_scene('res://Battle.tscn');
	call_deferred('load_level', level)

func load_level(level: Level):
	get_tree().root.get_node('Battle').connect_enemy(level.enemy_scene.instance())

func load_mainmenu():
	get_tree().change_scene('res://GUI/MainMenu.tscn');

func load_levelselect():
	get_tree().change_scene('res://GUI/LevelSelect.tscn');
