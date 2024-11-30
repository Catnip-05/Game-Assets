extends Area2D



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			show_popup()

func show_popup():
	print("Object clicked! Show something here.")
	if $Label:
		$Label.visible = true
