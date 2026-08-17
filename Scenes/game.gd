extends Node2D

@onready var level_scene = load("res://Scenes/level.tscn")
@onready var menu_scene = load("res://Scenes/main_menu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_menu = menu_scene.instantiate()
	add_child(new_menu)
	new_menu.load_game.connect(load_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func load_level() -> void:
	print ("load the level")
	var is_menu_active = $"Main Menu"
	if is_menu_active:
		remove_child(is_menu_active)
		var new_level = level_scene.instantiate()
		add_child(new_level)
		new_level.main_menu.connect(load_menu)
		new_level.reset_level.connect(reset_level)
		
func load_menu() -> void:
			print("load the menu")
		
func reset_level() -> void:
			print("reset the level")
		
