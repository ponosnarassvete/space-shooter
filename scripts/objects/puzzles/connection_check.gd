extends Node

@export var object_group_name: String = "Wire"

var object_dict = {}

func _ready() -> void:
	for child in get_parent().get_children():
		if child.is_in_group(object_group_name):
			if "id" in child:
				object_dict.get_or_add(child.id)

func connect_objs(object: Node2D, target: Node2D, obj_id: int = -1, trgt_id: int = -1) -> void:
	print("Connection_Table connect_objs_", obj_id)
	object_dict[obj_id] = [trgt_id]
	target.energy_par = object.energy_par
	target.wire_connected(object, trgt_id)

func disconnect_objs(_object: Node2D, target: Node2D, obj_id: int = -1, trgt_id: int = -1):
	print("Connection_Table_disconnect_objs_", obj_id)
	object_dict[obj_id] = []
	if target != null:
		target.wire_disconnected(trgt_id)
