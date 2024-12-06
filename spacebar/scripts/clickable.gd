extends Area2D

var clue1_shown = false

func show_popup():
	print("Object clicked! Show something here.")
	if $Label:
		$Label.visible = true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			show_popup()
			
# timer optional


func _on_button_pressed() -> void:
	$Label.text = "This compass belonged to your father. It's engraved with his initials."
	$Label.visible = true

func _on_button_2_pressed() -> void:
	$Label2.text = "A photo of you and your father. It's a reminder of better times."
	$Label2.visible = true
