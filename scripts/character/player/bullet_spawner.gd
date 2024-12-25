class_name Bullet_Spawner_3D
extends Node3D

@export var target: Node3D
@export var bullet_speed: float = 0.5
@export var bullet_stat: Damage_Stats
@export var timer: Timer

var bullet_scene = preload(GlobalStuff.BULLET_SCENE)

var temp: Node 
var direction: Vector3

func _ready() -> void:
	if get_tree().has_group(GlobalStuff.CURSOR_GROUP) and target == null:
		target = get_tree().get_first_node_in_group(GlobalStuff.CURSOR_GROUP)
	if get_tree().has_group(GlobalStuff.TEMP_DUMP_GROUP) and temp == null:
		temp = get_tree().get_first_node_in_group(GlobalStuff.TEMP_DUMP_GROUP)
	
func _physics_process(_delta: float) -> void:
	if timer.is_stopped():
		if Input.is_action_just_pressed("player_shoot"):
			if ToolManager.active_tool == GlobalStuff.TOOLS.ATTACKING_TOOL:
				var new_bullet = bullet_scene.instantiate()
				temp.add_child(new_bullet)
				new_bullet.global_position = self.global_position
				var target_position = target.global_position
				direction = global_position.direction_to(target_position)
				direction.y = 0
				new_bullet.launch(direction, bullet_speed, bullet_stat)
				timer.start()
