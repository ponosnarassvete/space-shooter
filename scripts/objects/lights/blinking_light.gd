class_name Blinking_Light
extends OmniLight3D

signal pitch_black

var x: float = -2 * PI
var direction: bool = true
var stop: bool = false

var energy: float
##If 0.0 it won't blink
@export var speed: float = 0.1
@export var energy_range: float = 5.0

func _ready() -> void:
	energy = light_energy

func make_it_stop():
	light_color = 0x00ff00ff
	stop = true

func _process(_delta: float) -> void:
	if stop:
		return
	
	if speed != 0:
		if direction:
			x = move_toward(x, 2*PI, speed/100)
		else:
			x = move_toward(x, -2*PI, speed/100)
		
		if x == 2*PI or x == -2*PI:
			direction = !direction
		
		self.light_energy = sin(x)*energy_range + energy
		
		#print(light_energy)
		
	if self.light_energy <= 0:
		pitch_black.emit()
