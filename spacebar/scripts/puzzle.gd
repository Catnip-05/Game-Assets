extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var initialPos: Vector2  
var offset: Vector2  
var is_dragging = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed('click'):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			is_dragging = true #.global
		if Input.is_action_just_pressed('click'):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released('click'):
			is_dragging = false  #.global
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(tween.EASE_OUT)


func _on_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body.modulate= Color(Color.REBECCA_PURPLE, 1)
		body_ref


func _on_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('droppable'):
		is_inside_droppable = false
		body.modulate= Color(Color.MEDIUM_PURPLE, 0.7)


func _on_area_mouse_entered() -> void:
	if not is_dragging:  #.global
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_mouse_exited() -> void:
	if not is_dragging:  #.global
		draggable = false
		scale = Vector2(1,1)
