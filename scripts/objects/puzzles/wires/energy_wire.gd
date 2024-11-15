class_name Energy_Wires
extends Sprite2D

signal pulse
signal connecting
signal disconnecting

@export var id: int = -1

@export var energy_par: Energy_Parameters
@export var active_group_name: String = "Active"

@export var activated: bool = false
var connected: bool = false

func _ready() -> void:
	if energy_par: #
		activated = true


func _process(delta: float) -> void:# if both are true then it should pulse every tick	
	if activated:
		add_to_group(active_group_name)
		if connected:
			pulse.emit(self, id)
	else:
		remove_from_group(active_group_name)


func wire_connected():# connected
	connected = true
	connecting.emit()

func wire_disconnected(obj: Node2D, id: int): # disconnected
	connected = false
	disconnecting.emit()

func set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy

func get_energy():
	return energy_par
