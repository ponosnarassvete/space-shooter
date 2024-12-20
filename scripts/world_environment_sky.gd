extends WorldEnvironment

func _process(_delta: float) -> void:
	environment.sky_rotation.y += 0.0001
	environment.sky_rotation.x += 0.00001
	if environment.sky_rotation.y == 360:
		environment.sky_rotation.y = 0 
	if environment.sky_rotation.x == 360:
		environment.sky_rotation.x = 0 
