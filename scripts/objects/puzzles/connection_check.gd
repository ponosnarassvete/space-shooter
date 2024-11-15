extends Node

@export var active_group_name: String = "Active"

func _process(delta: float) -> void:
	pass

func connect_objs(object: Node2D, target: Node2D, obj_id: int, trgt_id: int) -> void:
	target.energy_par = object.energy_par
	object.add_to_group(active_group_name)
	object.pulse.connect(target.connection)
	object.wire_connected()
