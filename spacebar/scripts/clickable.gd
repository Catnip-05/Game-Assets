extends Area2D

func show_popup():
	print("Object clicked! Show something here.")
	if $Label:
		$Label.visible = true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			show_popup()
			
# timer optional
