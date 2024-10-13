extends MeshInstance3D

@export var target: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_position = Vector3(target.global_position.x, 0, target.global_position.y)
	self.global_position = target_position
	print(target_position)
