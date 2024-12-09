extends Node

@export var object_name: String = ""
@export var target_name: String = ""
var targets: Array = []
var objects: Array = []

func _ready() -> void:
	for child in get_parent().get_children():
		if child.name.begins_with(target_name):
			targets.append(child.position)
		else:
			if child.name.begins_with(object_name):
				objects.append(child)
