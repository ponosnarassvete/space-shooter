class_name Energy_Target
extends Sprite2D

signal connected

@export var energy_par: Energy_Parameters
@export var wire: Energy_Wires

var switch: bool = false

var connection: Callable = func wire_connected(new_wire: Energy_Wires): #connected to wire
	wire = new_wire
	if wire.activated:
		energy_par = wire.get_energy()
		switch = true

func wire_disconnected():
	wire = null
	energy_par = null
	switch = false

func _process(delta: float) -> void:
	if switch:
		connected.emit(energy_par)