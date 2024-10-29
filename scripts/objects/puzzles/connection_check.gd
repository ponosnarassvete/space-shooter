extends Node

func _process(delta: float) -> void:
	pass

func _on_connected(object: Node2D, target: Node2D) -> void:
	target.energy_par = object.energy_par
	object.pulse.connect(target.connection)
	object.wire_connected()
