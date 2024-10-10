class_name TopDown_Enemy_Chase_3D
extends Node

@export var input: TopDown_Movement_Input_3D
@export var actor: CharacterBody3D
@export var target: Node3D

func _process(_delta: float) -> void:
	if target:
		input.dir = Vector3(Vector3(target.global_position) - Vector3(actor.global_position))
	else:
		pass
