class_name Energy_Target
extends Sprite2D

signal connected

@export var id: int = -1

@export var energy_par: Energy_Parameters = null

var wire: Energy_Wires

func wire_connected(new_wire: Energy_Wires = null, trgt_id: int = -1): #connected to wire
	if trgt_id == id:
		print("target_wire_connected_", id)
		wire = new_wire
		if wire.activated:
				energy_par = wire.get_energy()

func wire_disconnected(trgt_id: int = -1):
	if trgt_id == id:
		print("target_wire_disconnected_", id)
		wire = null
		energy_par = null

func _process(delta: float) -> void:
	if wire != null and energy_par != null:
		connected.emit()
