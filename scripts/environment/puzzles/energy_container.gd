class_name Energy_Container
extends Node

var energy_par: Energy_Parameters

func _get_energy():
	return energy_par

func _set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy
