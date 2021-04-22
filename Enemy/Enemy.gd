extends Node2D

class_name Enemy

signal turn_finished;
signal animation_finished;

onready var sprite: Sprite = $Sprite;
onready var tween:Tween = $Tween;
onready var animPlayer:AnimationPlayer = $AnimationPlayer;

func play_turn():
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("turn_finished")

func move(distance_change: float, time = 0.1):
	var newX = position.x - distance_change/100 * 1000;
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
