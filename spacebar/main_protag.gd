extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProtagAnimation.play("walk_right")
	$ProtagAnimation.play("walk_up")
