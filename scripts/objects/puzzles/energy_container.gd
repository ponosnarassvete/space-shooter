class_name Energy_Container
extends Node

signal juiced

@export var energy_par: Energy_Parameters

@export var activated: bool = false
var connected: bool = false

func unconnect():
	connected = false

func inconnect():
	connected = true

func _process(delta: float) -> void:
	if activated and connected:
		activate()

func get_energy():
	return energy_par

func set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy

func activate():
	_juiced(energy_par)

func _juiced(new_energy: Energy_Parameters, switch: bool = false):
	print("Juiced in ", self.get_parent().name)
	if switch:
		energy_par = new_energy
	juiced.emit(new_energy)
	
