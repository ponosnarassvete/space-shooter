extends Node

var previous_scene: Node

func _on_tree_exiting() -> void:
	previous_scene = get_tree().current_scene
	
