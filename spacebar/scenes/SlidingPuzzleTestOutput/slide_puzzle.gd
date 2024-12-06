extends Area2D

var tiles = []
var solve = []
var mouse = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game():
	tiles = [$Row_1_Col_1, $Row_1_Col_2, $Row_1_Col_3, $Row_1_Col_4,
	$Row_2_Col_1, $Row_2_Col_2, $Row_2_Col_3, $Row_2_Col_4,
	$Row_3_Col_1, $Row_3_Col_2, $Row_3_Col_3, $Row_3_Col_4,
	$Row_4_Col_1, $Row_4_Col_2, $Row_4_Col_3, $Row_4_Col_4]
	
	solve = tiles.duplicate()
	shuffle_tiles()

func shuffle_tiles():
	var previous = 99
	var previous_1 = 98
	for i in range(0, 100):
		var tile = randi() % 16
		if tiles[tile] != $Row_4_Col_4 and tile != previous and tile != previous_1:
			var rows = int(tiles[tile].position.y / 192)
			var cols = int(tiles[tile].position.x / 192)
			check_neighbours(rows, cols)
			previous_1 = previous
			previous = tile

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse:
		var mouse_copy = mouse

		mouse = false
		var rows = int(mouse_copy.position.y / 192) 
		var cols = int(mouse_copy.position.x / 192)
		check_neighbours(rows, cols)
		if tiles == solve:
			print("SOLVED!!")

func check_neighbours(rows, cols):
	var empty = false
	var done = false
	var pos = rows * 4 + cols
	while !empty and !done:
		var new_pos = tiles[pos].position
		if rows < 3:
			new_pos.y += 192
			empty = find_empty(new_pos, pos)
			new_pos.y -= 192
		if rows > 0:
			new_pos.y -= 192
			empty = find_empty(new_pos, pos)
			new_pos.y += 192
		if cols < 3:
			new_pos.x += 192
			empty = find_empty(new_pos, pos)
			new_pos.x -= 192
		if cols > 0:
			new_pos.x -= 192
			empty = find_empty(new_pos, pos)
			new_pos.x += 192
		done = true
func find_empty(position, pos):
	var new_rows = int(position.y / 192)
	var new_cols = int(position.x / 192)
	var new_pos = new_rows * 4 + new_cols
	if tiles[new_pos] == $Row_4_Col_4:
		swap_tiles(pos, new_pos)
		return true
	else:
		return false
	
func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos
	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event
