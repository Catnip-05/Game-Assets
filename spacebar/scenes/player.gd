extends CharacterBody2D

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement()

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement():
	input = get_input()
	
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
		
	else:
		velocity += (input * 3)
		
	move_and_slide()
