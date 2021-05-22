extends Node2D

class_name Enemy

signal turn_finished;
signal animation_finished;

onready var sprite: Sprite = $Sprite;
onready var tween:Tween = $Tween;
onready var anim_player:AnimationPlayer = $AnimationPlayer;

func play_turn():
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("turn_finished")

func add_animation(name: String, animation: Animation):
	anim_player.add_animation(name, animation);

func play_animation(name: String):
	if anim_player.has_animation(name):
		anim_player.play(name)

func move(distance_change: float, time = 0.1):
	print(distance_change)
	var newX = position.x + distance_change/100 * 1000;
	var newY = position.y;
	#sprite.flip_h = newX < position.x
	tween.interpolate_property(
		self,
		'position',
		position,
		Vector2(newX, newY),
		time,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT
	)
	tween.start();
	yield(tween, "tween_completed")
	emit_signal('animation_finished')
