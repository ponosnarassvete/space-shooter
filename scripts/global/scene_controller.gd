class_name Scene_Controller
extends Node

func next_scene(scene_path: String = "res://scenes/ui/menu/title_screen_scene_node.tscn", overwrite_previous: bool = true):
	print("NEXT_SCENE_", scene_path)
	if overwrite_previous:
		GSSConst.PREVIOUS_SCENE = str(get_tree().current_scene.scene_file_path)
	GameStateService.save_game_state(GSSConst.SAVE_FILE)
	get_tree().call_deferred("change_scene_to_file", scene_path)
