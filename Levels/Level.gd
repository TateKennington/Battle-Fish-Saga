extends Resource
class_name Level

export(String) var name setget set_level_name;
export(String) var description;
export(Resource) var enemy_scene;
export(Resource) var enemy_sprite;

func set_level_name(new_level_name: String):
	name = new_level_name.to_lower()

func _init(
	_name = '',
	_description = '',
	_enemy_scene = null,
	_enemy_sprite = null
):
	name = _name
	description = _description
	enemy_scene = _enemy_scene
	enemy_sprite = _enemy_sprite
