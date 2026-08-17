extends Node2D

@onready var top_pipe: Area2D = $TopPipe
@onready var bottom_pipe: Area2D = $BottomPipe
@export var speed:float = 80.0
var position_variance = [0, 25, -25, 50, -50, 75, -75]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_pipe.position.y += position_variance.pick_random()
	bottom_pipe.position.y += randf_range(-75,75)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
