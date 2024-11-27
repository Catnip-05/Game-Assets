extends Node2D

@export var speed := 500
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 500)
	
	

func _process(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += direction * speed * delta
		
	
