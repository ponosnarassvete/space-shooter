class_name Energy_Target
extends Sprite2D

signal connected

@export var id: int = -1

@export var energy_par: Energy_Parameters

var wire: Energy_Wires

func wire_connected(new_wire: Energy_Wires = null, new_id: int = -1): #connected to wire
	print(new_id)
	if new_id == id:
		print("target_wire_connected")
		wire = new_wire
		if wire.activated:
				energy_par = wire.get_energy()

func wire_disconnected(new_id: int = -1):
	print(new_id)
	if new_id == id:
		print("target_wire_disconnected")
		wire = null
		energy_par = null

func _process(delta: float) -> void:
	if wire != null:
		connected.emit()
