extends Control

func _continue_on_pressed() -> void:
	SceneController.next_scene(GlobalConsts.PREVIOUS_SCENE, false)

func _options_on_pressed() -> void:
	SceneController.next_scene("res://scenes/ui/menu/options_scene_node.tscn", false)

func _quit_on_pressed() -> void:
	get_tree().quit()
