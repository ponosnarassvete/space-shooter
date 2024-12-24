class_name Energy_Target
extends Sprite2D

@export var target_id: int = -1

@export var display: String = "0"

var connected_wire: Energy_Wire

func wire_connected(object: Energy_Wire): #connected to wire
	print(self.name,"_target_wire_connected_", object)
	connected_wire = object

func wire_disconnected():
	print(self.name,"_target_wire_disconnected")
	connected_wire = null
