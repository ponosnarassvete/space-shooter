class_name Looking_3D
extends Node

@export var actor: Node3D
@export var target: Node3D

func _ready() -> void:
	if get_tree().has_group("Target") and target == null:
		target = get_tree().get_first_node_in_group("Target")

func _process(_delta: float) -> void:
	if actor and target:
		if(actor.global_position != target.global_position):
			actor.look_at(target.global_position,Vector3(0,1,0), true)
