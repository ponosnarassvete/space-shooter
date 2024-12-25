class_name Scene_Controller
extends Node

var current_camera: Camera3D

func _ready() -> void:
	if get_tree().has_group(GlobalStuff.CAMERA_GROUP) and current_camera == null:
		current_camera = get_tree().get_first_node_in_group(GlobalStuff.CAMERA_GROUP)

func set_current_camera(camera: Camera3D):
	current_camera = camera

func next_scene(scene_path: String = "res://scenes/ui/menu/title_screen_scene_node.tscn", overwrite_previous: bool = true):
	print("NEXT_SCENE_", scene_path)
	if overwrite_previous:
		GlobalStuff.PREVIOUS_SCENE = str(get_tree().current_scene.scene_file_path)
	GameStateService.save_game_state(GlobalStuff.SAVE_FILE)
	get_tree().call_deferred("change_scene_to_file", scene_path)
