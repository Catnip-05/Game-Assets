extends Node2D

var selected = false

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if selected: 
		followMouse()
		
func followMouse():
	position = get_global_mouse_position()
	



func _on_cross_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false
