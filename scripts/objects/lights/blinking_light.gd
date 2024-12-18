extends OmniLight3D

signal pitch_black

var x: float = -2 * PI
var direction: bool = true

var energy: float
@export var speed: float = 0.001
@export var energy_range: float = 5.0

func _ready() -> void:
	energy = light_energy

func _process(delta: float) -> void:
	if direction:
		x = move_toward(x, 2*PI, speed)
	else:
		x = move_toward(x, -2*PI, speed)
	
	if x == 2*PI or x == -2*PI:
		direction = !direction
	
	self.light_energy = sin(x)*energy_range + energy
	
	print(light_energy)
	
	if self.light_energy <= 0:
		pitch_black.emit()
