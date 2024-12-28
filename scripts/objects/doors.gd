class_name Door_3D
extends Connectable

@export var left_door: StaticBody3D
@export var right_door: StaticBody3D

@export var offset_x: float = 1.0
@export var offset_speed: float = 0.5

@export var opened: bool = false

var left_target_position: float = 0.0
var right_target_position: float = 0.0

var opening: bool = true
var init: bool = false

func _ready() -> void:
	if left_door == null: left_door = $Left_Door
	if right_door == null: right_door = $Right_Door
	
	left_target_position = left_door.position.x
	right_target_position = right_door.position.x
	
	if opened:
		sesame()
		left_door.position.x = left_target_position
		right_door.position.x = right_target_position

func _process(_delta: float) -> void:
	if init:
		left_door.position.x = move_toward(left_door.position.x, left_target_position, offset_speed/100)
		right_door.position.x = move_toward(right_door.position.x, right_target_position, offset_speed/100)
		if left_door.position.x == left_target_position or right_door.global_position.x == right_target_position:
			init = false

func sesame():
	print("3d_sesame()")
	init = true
	if opening:
		opening = false
		left_target_position = left_target_position - offset_x
		right_target_position = right_target_position + offset_x
	else:
		opening = true
		left_target_position = left_target_position + offset_x
		right_target_position = right_target_position - offset_x
