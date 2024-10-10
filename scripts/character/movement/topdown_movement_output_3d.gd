class_name TopDown_Movement_Output_3D
extends Node

@export var actor: CharacterBody3D

func _physics_process(_delta: float) -> void:
	actor.move_and_slide()
