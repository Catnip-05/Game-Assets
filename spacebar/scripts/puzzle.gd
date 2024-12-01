extends Node2D

var selected = false
var offset = Vector2()

func _ready():
	add_to_group("draggable")

func _process(delta: float) -> void:
	if selected:
		followedMouse() 
		
func followedMouse():
	position = get_global_mouse_position() + offset
	
	
func _on_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
			offset = position - get_global_mouse_position()
		else:
			selected = false
