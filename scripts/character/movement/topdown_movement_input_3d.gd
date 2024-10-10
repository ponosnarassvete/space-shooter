class_name TopDown_Movement_Input_3D
extends Node

@export var actor: CharacterBody3D
@export var dir: Vector3
@export var movement_stats: TopDown_Movement_Stats_3D
@export var ground_stats: Ground_Stats_3D

@onready var max_speed = movement_stats.GROUND_SPEED

func _process(_delta: float) -> void:
		
	if dir:
		actor.velocity.x = move_toward(actor.velocity.x, dir.normalized().x * max_speed, movement_stats.ACCELERATION)
		actor.velocity.z = move_toward(actor.velocity.z, dir.normalized().z * max_speed, movement_stats.ACCELERATION)
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, ground_stats.FRICTION)
		actor.velocity.z = move_toward(actor.velocity.z, 0, ground_stats.FRICTION)
