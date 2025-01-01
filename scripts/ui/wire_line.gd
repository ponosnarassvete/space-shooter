extends Line2D

@export var wire: Energy_Wire

func _ready() -> void:
	points[0] = global_position

func _process(delta: float) -> void:
	if Engine.get_frames_drawn() % 10 == 0:
		print(points)
	points[1] = wire.global_position
