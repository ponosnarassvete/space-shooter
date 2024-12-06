extends Control

func _start_on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/core_scene_node.tscn")

func _options_on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/menu/options_scene_node.tscn")

func _quit_on_pressed() -> void:
	get_tree().quit()
