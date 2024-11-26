class_name Interaction_Area_3D
extends Area3D

@export var action_name: String = "Interact"
@export var manager: Interaction_Manager
var interact: Callable = func():
	pass

func _on_body_entered(_body):
	manager.register_area(self)

func _on_body_exited(_body):
	manager.unregister_area(self)
