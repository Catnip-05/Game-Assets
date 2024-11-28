class_name MainMenu
extends Control


@onready var start_button = $"TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Start Button" as Button
@onready var exit_button = $"TextureRect/MarginContainer/HBoxContainer/VBoxContainer/Exit Button" as Button
# @export start_level = preload(main.tscn)

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	
	
func on_start_pressed() -> void:
	#get_tree().change_scene_to_packed(start_level)
	pass
	
func on_exit_pressed() -> void:
	get_tree().quit()
