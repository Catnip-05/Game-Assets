extends Node2D

var puzzle_pieces = []  
var correct_positions = []  
var puzzle_solved = false

func _ready() -> void:
	puzzle_pieces = [get_node("PuzzleArea/Sprite2D"), get_node("PuzzleArea/Sprite2D2")] 
	correct_positions = [Vector2(100, 200), Vector2(200, 300)] 
	for piece in puzzle_pieces:
		piece.connect("input_event", self, "_on_piece_input_event")



func _process(delta: float) -> void:
	pass


func _on_cross_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
