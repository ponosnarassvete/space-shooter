class_name TopDown_Player_Sprint_3D
extends Node

@export var mover: TopDown_Movement_Input_3D
@export var movement_stats: TopDown_Movement_Stats_3D

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("player_sprint"):
		mover.max_speed = movement_stats.GROUND_SPEED + movement_stats.SPRINT_SPEED
	if Input.is_action_just_released("player_sprint"):
		mover.max_speed = movement_stats.GROUND_SPEED
