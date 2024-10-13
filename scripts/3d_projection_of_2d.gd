class_name Projection_3D
extends Node3D

@export var camera: Camera3D

func _process(delta: float) -> void:
	if camera:
		var dropPlane  = Plane(Vector3(0, 1, 0), 0)
		var position3D = dropPlane.intersects_ray(camera.project_ray_origin(get_parent().global_position),
												camera.project_ray_normal(get_parent().global_position))
		self.global_position = position3D
