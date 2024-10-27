extends Node

func _process(delta: float) -> void:
	pass

func _on_connected(object: Node2D, target: Node2D) -> void:
	target.energy_par = object.energy_par
	if object.position == target.position:
		print("Pulsing")
		var callable_func = target.connection 
		object.pulse.connect(callable_func)
		object.wire_connected()
