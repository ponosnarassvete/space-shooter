@tool
class_name Puzzle_Saver_Loader
extends Node

var puzzle_key

func _on_tree_entered() -> void:
	print("Helpers_load_data")
	
	puzzle_key = str(get_parent().get_path())
	
	var scene_data: Dictionary = GameStateService._get_scene_data(GameStateService._get_scene_id(get_tree().current_scene), get_tree().current_scene)
	var node_data:Dictionary = scene_data["node_data"]
	
	check_node(node_data)
	
func check_node(node:Dictionary):
	for node_id:String in node.keys():
		if typeof(node[node_id]) != TYPE_DICTIONARY:
			continue
		var node_data: Dictionary = node[node_id]
		if !node_data.has(GameStateHelper.GAME_STATE_KEY_OWNER_NODE_PATH):
			continue
		else:	
			if node_data.get(GameStateHelper.GAME_STATE_KEY_OWNER_NODE_PATH) == puzzle_key:
				var global_state:Dictionary = GameStateService._game_state["global"]
				for helper: GameStateHelper in get_tree().get_nodes_in_group("Helpers"):
					if helper.get_parent().get_path() == node_data.get(GameStateHelper.GAME_STATE_KEY_NODE_PATH):
						if helper.debug:
							breakpoint
						if helper.global:
							helper.load_data(global_state)
						else:
							helper.load_data(node)
	
