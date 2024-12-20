class_name Blinking_Light
extends OmniLight3D

signal pitch_black

var x: float = -2 * PI
var direction: bool = true

var energy: float
##If 0.0 it won't blink
@export var speed: float = 0.001
@export var energy_range: float = 5.0

func _ready() -> void:
	energy = light_energy

func _process(_delta: float) -> void:
	if speed != 0:
		if direction:
			x = move_toward(x, 2*PI, speed)
		else:
			x = move_toward(x, -2*PI, speed)
		
		if x == 2*PI or x == -2*PI:
			direction = !direction
		
		self.light_energy = sin(x)*energy_range + energy
		
		#print(light_energy)
		
	if self.light_energy <= 0:
		pitch_black.emit()
