extends Node3D

@export var left_door: StaticBody3D
@export var right_door: StaticBody3D

@export var offset_x: float = 1.0
@export var offset_speed: float = 0.05

var left_target_position: float = 0.0
var right_target_position: float = 0.0

var opening: bool = true
var init: bool = false

func _ready() -> void:
	if left_door == null: left_door = $Left_Door
	if right_door == null: right_door = $Right_Door
	

func _process(delta: float) -> void:
	if init:
		left_door.position.x = move_toward(left_door.position.x, left_target_position, offset_speed)
		right_door.position.x = move_toward(right_door.position.x, right_target_position, offset_speed)
		if left_door.position.x == left_target_position and right_door.global_position.x == right_target_position:
			init = false
		print("left_door.position.x", left_door.position.x)
		print("right_door.position.x", right_door.position.x)

func sesame():
	print("3d_sesame()")
	init = true
	if opening:
		opening = false
		left_target_position = left_door.position.x - offset_x
		right_target_position = right_door.position.x + offset_x
	else:
		opening = true
		left_target_position = left_door.position.x + offset_x
		right_target_position = right_door.position.x - offset_x
