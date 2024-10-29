class_name Clamp_2D
extends Node

@export var interface_rect: ReferenceRect
@export var object: Node2D
var switch: bool = false

func on_off():
	if switch:
		switch = false
	else:
		switch = true
	print(get_parent())

func _picked() -> void:
	if Input.is_anything_pressed():
		object.position.x = clamp(object.position.x, interface_rect.position.x, interface_rect.position.x + interface_rect.size.x)
		object.position.y = clamp(object.position.y, interface_rect.position.y, interface_rect.position.y + interface_rect.size.y)

func _process(delta: float) -> void:
	if switch:
		_picked()
