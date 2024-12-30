class_name TopDown_Enemy_Chase_3D
extends Node

@export var input: TopDown_Movement_Input_3D
@export var actor: CharacterBody3D
@export var target: Node3D
@export var navigation_agent: NavigationAgent3D

func _ready() -> void:
	if get_tree().has_group("Target") and target == null:
		target = get_tree().get_first_node_in_group("Target")

func _physics_process(_delta: float) -> void:
	if target:
		if Engine.get_frames_drawn()%10 == 0:
			navigation_agent.set_target_position(target.global_position)
	
		#input.dir = Vector3(Vector3(target.global_position) - Vector3(actor.global_position))
	
		var destination = navigation_agent.get_next_path_position()
		var local_destination = destination - actor.global_position
		input.dir = local_destination
		
		#actor.rotation.y = lerp_angle(actor.rotation.y, actor.position.angle_to(local_destination), 0.5)
		if actor.global_position != destination:
			actor.look_at(destination,Vector3(0,1,0), true)
