class_name Connectable
extends Node

##signal with information to connect to another connectable
signal out(sender_id: int, sent_id: int)
signal changed(in_id: int)

var in_array: Array = []
var out_array: Array = []

var connection_list: Connections_List = ConnectionList

## {out_object_id:{out_id:[in_ids]}}
@export var inner_connections: Dictionary = {-1:{-1:[-1]}}
@export var object_id: int = -1

@export var pulsing: bool = false

func _process(_delta: float) -> void:
	if pulsing:
		pulse_in(1)

## For outside objects
func pulse_port(out_object_id: int = -1, out_id: int = -1):
	if !inner_connections.has(out_object_id):
		printerr(self.name,"_UNKNOWN_OBJECT_PULSED")
		return
		
	var in_ids = inner_connections[out_object_id].get(out_id, -1)
	
	for key in in_ids:
		if key in in_array:
			pulse_in(key)

func create_input(in_id: int = -1, amount: int = 1):
	for i in amount:
		connect_inner_port(in_id + i, true)	
		in_array.append(in_id+i)

func create_output(out_id: int = -1, amount: int = 1):
	for i in amount:
		out_array.append(out_id+i)

func connect_inner_port(in_id: int = -1, only_create:bool = false, out_ids: Array = []):
	connection_list.set_connection(object_id, connection_list.format_input(in_id, out_ids))
	if !only_create:
		_connection_pulse(in_id)
	changed.emit(object_id, in_id)

func disconnect_inner_port(in_id: int = -1):
	if in_id in in_array:
		if connection_list.in_out.get(object_id).has(in_id):
			connection_list.set_connection(object_id, {in_id:[]}, true)
		changed.emit(object_id, in_id)
	else: printerr(self.name,"_UNKNOWN_IN_ID")

## For pulsing inner connections
func pulse_in(in_id: int = -1):
	if in_id in in_array:
		var out_ids = _connection_pulse(in_id)
		
		for key in out_ids:
			pulse_out(key)
	else: printerr(self.name,"_UNKNOWN_IN_ID")

## Pulsing output
func pulse_out(out_id: int = -1):
	if out_id in out_array:
		out.emit(object_id, out_id)
	else: printerr(self.name,"_UNKNOWN_OUT_ID")

func _connection_pulse(in_id: int = -1):	
	var out_ids = connection_list.simulate_connection(object_id, in_id)
	return out_ids
