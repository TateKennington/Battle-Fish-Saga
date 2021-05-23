extends Node2D

signal win;
signal lose;

onready var player: Player = $Player;
onready var enemy: Enemy = $ViewportContainer/Viewport/Enemy.get_child(0);
onready var gui: BattleGUI = $CanvasLayer/BattleGUI;

var distance: float = 0;
var tension: float = 0;
var time: float = 0;

func _ready():
	gui.connect("choose_move", player, "perform_move")
	enemy.connect("move", self, "on_move");
	player.connect_abilities(self)
	gui.set_tension(0)
	gui.set_distance(0)
	gui.set_moves_list(player.get_moves_list())
	var animations = player.get_animations_list();
	for animation in animations:
		enemy.add_animation(animation.name, animation.fish)
	play_turn();
	
func play_turn():
	gui.activate();
	yield(gui, "choose_move")
	check_end();
	if tension >= 0 :
		gui.push_special(Special_Counter.State.Tense)
	else:
		gui.push_special(Special_Counter.State.Slack)
	yield(get_tree().create_timer(1), 'timeout')
	enemy.play_turn()
	yield(enemy, "turn_finished")
	check_end();
	play_turn();
	
func check_end():
	if distance >= 100:
		emit_signal("win")
		SceneManager.load_mainmenu();
	if tension >= 100 || distance <= -100:
		emit_signal("lose")
		SceneManager.load_mainmenu();

func on_move(distance_change: float, tension_change: float, move_name: String):
	print(distance_change)
	print(tension_change)
	distance += distance_change;
	tension += tension_change;
	gui.set_tension(tension);
	gui.set_distance(distance);
	
	enemy.play_animation(move_name)
	
func _process(delta: float):
	time += delta
	$Foreground.global_position.y = 2*sin(2*time)
	$Player.global_position.y = 117.924 + 2*sin(2*time)
	$ParallaxBackground/ParallaxLayer.motion_offset.x -= 0.2
	$ViewportContainer/Viewport/ParallaxBackground/ParallaxLayer3.motion_offset.x -= 0.2
	$ViewportContainer/Viewport/ParallaxBackground/ParallaxLayer4.motion_offset.x += 0.2
