extends Node

@export var object_group_name: String = "Wire"

var object_dict = {}

func _ready() -> void:
	for child in get_parent().get_children():
		if child.is_in_group(object_group_name):
			object_dict.get_or_add(child.wire_id)

func connect_objects(object: Energy_Wire, target: Energy_Target) -> void:
	print("Connection_Table_connect_object_", object.name,"_with_id_",object.wire_id)
	object_dict[object.wire_id] = [target.target_id]
	#ConnectionList.set_connection(get_parent().object_id, ConnectionList.format_input(object.wire_id,[target.target_id]))
	ConnectionList.set_connection(get_parent().object_id, object_dict, true)
	target.wire_connected(object)
	print("Object_dictionary:", object_dict)

func disconnect_objects(object: Energy_Wire, target: Energy_Target):
	print("Connection_Table_disconnect_object_", object.name)
	object_dict[object.wire_id] = []
	ConnectionList.set_connection(get_parent().object_id, ConnectionList.format_input(object.wire_id))
	if target != null:
		target.wire_disconnected()
	print("Object_dictionary:", object_dict)
