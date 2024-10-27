class_name Energy_Wires
extends Sprite2D

signal pulse

@export var energy_par: Energy_Parameters
@export var active_group_name: String = "Active"

@export var activated: bool = false
var connected: bool = false

func _ready() -> void:
	if energy_par:
		activated = true

func wire_connected():# connected to target
	connected = true
	if activated:
		pulse.emit(energy_par)
		self.add_to_group(active_group_name)

func wire_disconnected():
	connected = false
	self.remove_from_group(active_group_name)


func set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy

func get_energy():
	return energy_par


func _process(delta: float) -> void:	
	if activated and connected:
		pulse.emit(energy_par)
