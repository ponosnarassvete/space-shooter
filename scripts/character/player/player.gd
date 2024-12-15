extends Node3D

@export var health: Health

var counter: int = 0

func _process(delta: float) -> void:
	health.sync_healthbar()
	if counter == 1000:
		counter = 0
		print(self.name, "_health.amount_", health.amount)
	else:
		counter +=1
