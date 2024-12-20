extends SpotLight3D

var energy: float = 0.0
var omni_energy: float = 0.0
var on: bool = false

func _ready() -> void:
	energy = light_energy
	omni_energy = get_child(0).light_energy
	light_energy = 0.0
	get_child(0).light_energy = 0.0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("flashlight"):
		if !on:
			light_energy = energy
			get_child(0).light_energy = omni_energy
		else:
			light_energy = 0.0
			get_child(0).light_energy = 0.0
		on = !on
