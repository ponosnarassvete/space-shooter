extends Node


func _on_tree_exiting() -> void:
	GameStateService.on_scene_transitioning()
