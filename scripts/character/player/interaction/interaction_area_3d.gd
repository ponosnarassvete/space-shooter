class_name Interaction_Area_3D
extends Area3D

@export var action_name: String = "Interact"
@export var manager: Interaction_Manager
var interact: Callable = func():
	pass

func _on_body_entered(_body):
	print(self.name, "_registered_by_", _body.name)
	manager.register_area(self)

func _on_body_exited(_body):
	print(self.name, "_unregistered_by_", _body.name)
	manager.unregister_area(self)
