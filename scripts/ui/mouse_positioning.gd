class_name Mouse_Positioning
extends Node

@export var target: Node2D

func _process(delta: float) -> void:
	target.global_position = DisplayServer.mouse_get_position()
