class_name TopDown_Enemy_Wander_3D
extends Node

@export var input: TopDown_Movement_Input_3D
@export var actor: CharacterBody3D
@export var navigation: NavigationAgent3D
@export var navigation_area: NavigationRegion3D

func _process(_delta: float) -> void:
	pass#var random_point = Vector3(0,0,0)
	#navigation_area.navigation_polygon.
