extends Area2D

signal object_dropped(object)
signal object_left(object)

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")  
	connect("body_exited", self, "_on_body_exited") 




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("draggable"):
		print("Object entered the drop area:", body.name)
		emit_signal("object_dropped", body)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("draggable"):
		print("Object left the drop area:", body.name)
		emit_signal("object_left", body)
