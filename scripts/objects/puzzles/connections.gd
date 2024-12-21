class_name Connections_List
extends Node

signal changed(in_out: Dictionary)

@export var puzzle_id: int = get_parent().puzzle_id
@export var in_out: Dictionary = {-1:[-1]}

## {puzzle_id: only this part -> {out_id:[in_ids]} }
func set_connection(new_in_out: Dictionary = {-1:[-1]}):
	
	in_out.merge(new_in_out)
	
	changed.emit(in_out)

func connection_through(key_in: int = -1) -> Array:
	
	if in_out.has(key_in):
		return in_out.get(key_in)
	
	return []
