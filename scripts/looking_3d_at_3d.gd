class_name Looking_3D_At_3D
extends Node

@export var actor: Node3D
@export var target: Node3D

func _process(_delta: float) -> void:
	if target and (actor.global_position != target.global_position):
		actor.look_at(target.global_position,Vector3(0,1,0),true)
	else:
		pass
