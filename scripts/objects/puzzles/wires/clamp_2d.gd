class_name Clamp_2D
extends Node

@export var interface_rect: ReferenceRect
@export var object: Node2D
var switch: bool = false
var id = -1

func _ready() -> void:
	if "id" in get_parent():
		id = get_parent().id 

func id_check(new_id):
	if id >= 0:
		if new_id == id:
			return true
		else:
			return false
	else:
		return false

func _process(_delta: float) -> void:
	if Input.is_anything_pressed():
		object.position.x = clamp(object.position.x, interface_rect.position.x, interface_rect.position.x + interface_rect.size.x)
		object.position.y = clamp(object.position.y, interface_rect.position.y, interface_rect.position.y + interface_rect.size.y)
