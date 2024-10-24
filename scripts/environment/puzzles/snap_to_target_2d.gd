class_name Snap_to_Target_2D
extends Node

@export var object_name: String = ""
@export var target_name: String = ""
@export var snap_threshold: int = 20 
var target_positions: Array = []
var objects: Array = []

func _ready():
	for child in get_parent().get_children():
		if child.name.begins_with(target_name):
			target_positions.append(child.position)
		else:
			if child.name.begins_with(object_name):
				objects.append(child)

func _process(delta: float) -> void:
	for target_pos in target_positions:
		for i in objects.size():
			if objects[i].position.distance_to(target_pos) < snap_threshold:
				objects[i].position = target_pos
				break
