class_name Snap_to_Target_2D
extends Node

signal connected

@export var snap_threshold: int = 20 
@export var target_group_name: String = ""
@export var object_group_name: String = ""

var targets: Array = []
var objects: Array = []

func _ready() -> void:
	targets = get_tree().get_nodes_in_group(target_group_name)
	objects = get_tree().get_nodes_in_group(object_group_name)

func _on_dropped(object: Node2D) -> void:
	for target in targets:
		if object.position.distance_to(target.position) < snap_threshold:
			object.position = target.position
			connected.emit(object, target)
			break
