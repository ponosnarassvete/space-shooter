class_name Bullet_Spawner_3D
extends Node3D

@export var target: Vector3
@export var bullet_speed: float = 1.0
@export var bullet_stat: Damage_Stats

var temp: Node 
var direction: Vector3

func _ready() -> void:
	if get_tree().has_group("Cursor") and target == null:
		target = get_tree().get_first_node_in_group("Cursor").global_position
	if get_tree().has_group("Temp") and temp == null:
		temp = get_tree().get_first_node_in_group("Temp")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("player_shoot"):
		print("yes!")
		if ToolManager.active_tool == GlobalEnums.TOOLS.ATTACKING_TOOL:
			var new_bullet = Bullet.new()
			temp.add_child(new_bullet)
			new_bullet.launch(direction.direction_to(target), bullet_speed, bullet_stat)
