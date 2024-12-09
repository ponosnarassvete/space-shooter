extends Node3D

@export var health: Health

var counter: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health.sync_healthbar()
	if counter == 500:
		counter = 0
		print(self.name, "_health.amount_", health.amount)
	else:
		counter +=1
