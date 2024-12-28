class_name Connections_List
extends Node

## {puzzle_id: {in_id:[out_ids]}}
var in_out: Dictionary = {-1:{-1:[-1]}}

## {puzzle_id: only this part -> {in_id:[out_ids]} }
func set_connection(object_id: int = -1, new_in_out: Dictionary = {-1:[-1]}, overwrite: bool = false):	
	
	if !in_out.has(object_id):
		in_out.get_or_add(object_id, new_in_out)
		print(object_id, "_key_wasnt_found__in_out_now:", in_out)
	else:
		var in_id = new_in_out.keys()
		
		if !overwrite:
			in_out[object_id][in_id[0]].append(new_in_out[in_id[0]])
		else:
			in_out[object_id][in_id[0]] = new_in_out[in_id[0]]

func simulate_connection(object_id: int = -1, in_id: int = -1) -> Array:
	if in_out.get_or_add(object_id, {}).has(in_id):
		return in_out.get(object_id).get(in_id)
	return []

func format_input(in_id: int = -1, out_ids: Array = []) -> Dictionary:
	var formated_input: Dictionary = {in_id:out_ids}
	return formated_input
