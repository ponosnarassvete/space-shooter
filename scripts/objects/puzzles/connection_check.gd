extends Node

@export var object_group_name: String = "Wire"

var object_dict = {}

func _ready() -> void:
	for child in get_parent().get_children():
		if child.is_in_group(object_group_name):
			if "id" in child:
				object_dict.get_or_add(child.id)

func _process(delta: float) -> void:
	pass

func connect_objs(object: Node2D, target: Node2D, obj_id: int, trgt_id: int) -> void:
	object_dict[obj_id] = [trgt_id]
	target.energy_par = object.energy_par
	object.pulse.connect(target.connection)
	object.wire_connected()

func dissconnect_objs(object: Node2D, target: Node2D, obj_id: int, trgt_id: int):
	object_dict[obj_id] = []
	target.wire_disconnected()
