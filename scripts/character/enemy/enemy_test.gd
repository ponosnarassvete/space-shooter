extends Node3D

@export var chase: TopDown_Enemy_Chase_3D
@export var in_chase: bool = true
@export var movement_input: TopDown_Movement_Input_3D
@export var navigation_agent: NavigationAgent3D
@export var light: OmniLight3D

var light_energy

func _ready() -> void:
	chase.in_chase = in_chase
	
	navigation_agent.max_speed = movement_input.movement_stats.GROUND_SPEED
	
	light_energy = light.light_energy
	light.light_energy = 0

func _process(_delta: float) -> void:
	if chase.in_chase and light.light_energy != light_energy:
		light.light_energy = move_toward(light.light_energy, light_energy, 0.005)

func activate():
	chase.in_chase = true

func disactivate():
	chase.in_chase = false

func death():
	self.queue_free()
