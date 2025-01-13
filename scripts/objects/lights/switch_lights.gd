class_name Switch_Lights
extends Node3D

@export var on_light: OmniLight3D 
@export var off_light: OmniLight3D
@export var is_it_on: bool = false

func _ready() -> void:
	if is_it_on:
		on_light.visible = true
		off_light.visible = false
	else:
		on_light.visible = false
		off_light.visible = true

func switch():
	on_light.visible = !on_light.visible
	off_light.visible = !off_light.visible
	is_it_on!=is_it_on

func check(on_or_off: bool):
	if on_or_off != is_it_on:
		switch()
