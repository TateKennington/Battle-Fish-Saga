extends Control

export(Array, Resource) var levels;

onready var menu: Menu = $Menu;

func _ready():
	for level in levels:
		menu.add_item(level.name, true)


func _on_Menu_selected(index):
	SceneManager.load_battle(levels[index]);


func _on_Menu_hovered(index):
	var curr_level: Level = levels[index]
	$Preview/TextureRect.texture = curr_level.enemy_sprite;
	$Description/Label.text = curr_level.description
