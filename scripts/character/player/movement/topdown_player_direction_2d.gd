class_name TopDown_Player_Direction_3D
extends Node

@export var input: TopDown_Movement_Input_3D

func _process(_delta: float) -> void:
	input.dir.x = Input.get_axis('player_left','player_right')
	input.dir.z = Input.get_axis('player_up','player_down')
	
