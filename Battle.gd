extends Node2D

signal win;
signal lose;

onready var player: Player = $Player;
onready var gui: BattleGUI = $CanvasLayer/BattleGUI;

var enemy: Enemy;
var distance: float = 0;
var tension: float = 0;

var tension_points: int = 0;
var slack_points: int = 0;

var time: float = 0;

func _ready():
	gui.set_tension(0)
	gui.set_distance(0)
	gui.set_moves_list(player.abilities)
	
func connect_enemy(enemy_node):
	$ViewportContainer/Viewport/Enemy.add_child(enemy_node)
	enemy = enemy_node
	enemy.position.y = 200
	enemy.connect("move", self, "on_move");
	for move in player.abilities:
		if move.fish_animation == null:
			continue
		enemy.add_animation(move.move_name, move.fish_animation)
	play_turn();
	
func play_turn():
	gui.activate();
	yield(gui, "choose_move")
	check_end();
	if tension >= 0 :
		gui.push_special(Special_Counter.State.Tense)
		tension_points += 1
	else:
		gui.push_special(Special_Counter.State.Slack)
		slack_points += 1
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

func on_move(move: Ability):
	distance += move.distance_change;
	tension += move.tension_change;
	
	tension_points -= move.tension_cost;
	slack_points -= move.slack_cost;
	
	gui.set_tension(tension);
	gui.set_distance(distance);
	
	enemy.play_animation(move.move_name)

func can_use_move(move: Ability):
	return tension_points >= move.tension_cost && slack_points >= move.slack_cost

func _process(delta: float):
	time += delta
	$Foreground.global_position.y = 2*sin(2*time)
	$Player.global_position.y = 117.924 + 2*sin(2*time)
	$ParallaxBackground/ParallaxLayer.motion_offset.x -= 0.2
	$ViewportContainer/Viewport/ParallaxBackground/ParallaxLayer3.motion_offset.x -= 0.2
	$ViewportContainer/Viewport/ParallaxBackground/ParallaxLayer4.motion_offset.x += 0.2
