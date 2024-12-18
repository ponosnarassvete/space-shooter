extends Control

var debug: bool = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug"):
		debug = true

func _start_on_pressed() -> void:
	GameStateService.new_game()
	if debug:
		get_tree().change_scene_to_file("res://scenes/test_scene_node.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/levels/tutorial/tutorial_start.tscn")

func _options_on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/menu/options_scene_node.tscn")

func _quit_on_pressed() -> void:
	get_tree().quit()
