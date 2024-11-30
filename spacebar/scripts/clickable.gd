extends Area2D


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		# Check if the left mouse button was clicked
		if event.button_index == MOUSE_BUTTON_LEFT:
			show_popup()

# Function to show the popup
func show_popup():
	print("Object clicked! Show something here.")
