class_name Projection_3D
extends Node3D

@export var scene_controller: Scene_Controller

func _process(_delta: float) -> void:
	if scene_controller.current_camera:
		var dropPlane  = Plane(Vector3(0, 1, 0), 0)
		var position3D = dropPlane.intersects_ray(scene_controller.current_camera.project_ray_origin(get_parent().global_position),
												scene_controller.current_camera.project_ray_normal(get_parent().global_position))
		self.global_position = position3D
