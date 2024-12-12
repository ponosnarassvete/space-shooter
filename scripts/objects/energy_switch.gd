class_name Energy_Switch
extends Node3D

signal ping
signal switched

@export var interaction_area: Interaction_Area_3D

var switch: bool = false

func _ready():
	if interaction_area != null: interaction_area.interact = Callable(self, "press")

func pulse(energy: Energy_Parameters):
	print(self.name, "_pulsed")
	if switch:
		ping.emit(energy)

func press():
	print("switched_to_", switch)
	switched.emit()
	if !switch: 
		switch = true
	else: switch = false
