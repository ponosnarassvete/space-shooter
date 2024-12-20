extends Control

var debug: bool = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug"):
		debug = true

func _start_on_pressed() -> void:
	GameStateService.new_game()
	if debug:
		SceneController.next_scene("res://scenes/test_scene_node.tscn", false)
	else:
		SceneController.next_scene("res://scenes/levels/tutorial/tutorial_start.tscn", false)

func _options_on_pressed() -> void:
	SceneController.next_scene("res://scenes/ui/menu/options_scene_node.tscn", false)

func _quit_on_pressed() -> void:
	get_tree().quit()
