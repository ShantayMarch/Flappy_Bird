extends Node2D

@onready  var bg = $BG
@onready var bg_width = bg.texture.get_width()
@onready var pipes = load("res://Scenes/pipes.tscn")
@onready var ui_score = $"CanvasLayer/Player Score"

var speed:float = 85.0
var players_score:int = 0

signal reset_level
signal main_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Pipe Timer".start(3)
	ui_score.text = "Player Score: 0" 



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bg.position.x = bg.position.x - (speed * delta)
	if bg.position.x <= -bg_width:
		bg.position.x = 0
	if Input.is_action_just_pressed("main_menu"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	


func _on_pipe_timer_timeout() -> void:
	var new_pipe = pipes.instantiate()
	add_child(new_pipe)
	new_pipe.position.x = get_window().get_size().x +50



func _on_player_players_score() -> void:
	players_score += 1
	ui_score.text = "Player Score: " + str(players_score)
	

func _on_player_players_defeat() -> void:
	get_tree().reload_current_scene()
