extends Node2D

@export var left_door: Sprite2D
@export var right_door: Sprite2D
@export var offset_x: float = 200
@export var offset_speed: float = 1.0
var left_target_position: float = 0.0
var right_target_position: float = 0.0
var opening: bool = true
var init: bool = false

func _process(delta: float) -> void:
	if init:
		print("init_sesamed")
		left_door.global_position.x = move_toward(left_door.global_position.x, left_target_position, offset_speed)
		right_door.global_position.x = move_toward(right_door.global_position.x, right_target_position, offset_speed)
		if left_door.global_position.x == left_target_position and right_door.global_position.x == right_target_position:
			init = false

func sesame():
	print("sesame()")
	init = true
	if opening:
		opening = false
		left_target_position = left_door.global_position.x + offset_x
		right_target_position = right_door.global_position.x - offset_x
	else:
		opening = true
		left_target_position = left_door.global_position.x - offset_x
		right_target_position = right_door.global_position.x + offset_x
