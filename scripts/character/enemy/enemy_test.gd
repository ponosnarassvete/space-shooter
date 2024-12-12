extends Node3D

@export var switch: bool = true

func _ready() -> void:
	if switch: 
		for child in get_children():
			child.hide()
