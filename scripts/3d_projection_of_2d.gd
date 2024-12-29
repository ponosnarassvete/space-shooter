class_name Projection_3D
extends Node3D

var scene_controller: Scene_Controller = SceneController

func _process(_delta: float) -> void:
	if scene_controller.current_camera:
		var camera = scene_controller.current_camera
		var dropPlane  = Plane(Vector3(0, 1, 0), 0)
		var position3D = dropPlane.intersects_ray(camera.project_ray_origin(get_parent().global_position),
												camera.project_ray_normal(get_parent().global_position))
		self.global_position = position3D
