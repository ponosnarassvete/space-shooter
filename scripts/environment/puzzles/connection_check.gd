extends Node

@export var target_group_name: String = ""
@export var object_group_name: String = ""
@export var juiced_group_name: String = ""

var wire_target_map = {}
var wire_connected = {}  # To keep track of connected wires

func _ready():
	for child in get_tree().get_nodes_in_group(object_group_name):
		if child.name.begins_with("Wire"):
			var wire_id = child.name.replace("Wire", "")
			var target_node = get_parent().get_node("Target" + wire_id)
			if target_node:
				wire_target_map[child] = target_node.position  # Map wire to its target position
				wire_connected[child] = false  # Initially mark all wires as not connected

func _process(delta: float) -> void:
	pass

func _on_connected(object: Node2D, target: Node2D) -> void:
	if object.is_in_group(juiced_group_name):
		target.add_to_group(juiced_group_name)
