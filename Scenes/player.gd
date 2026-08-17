extends Area2D

@export var grav:float = 900.0
@export var jump_force:int = 300
@export var max_speed:float = 500

var velocity:float = 0.0

signal players_defeat
signal players_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	position.y += velocity * delta
	velocity += gravity * delta
	#print(velocity)
	
	if velocity >= max_speed:
		velocity = max_speed
	
	if Input.is_action_just_pressed("bird_jump"):
		velocity = -jump_force
		

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("pipes"): 
		players_defeat.emit()
	elif area.is_in_group("score"):
		players_score.emit()
		
