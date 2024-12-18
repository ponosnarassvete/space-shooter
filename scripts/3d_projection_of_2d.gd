class_name Projection_3D
extends Node3D

@export var camera: Camera3D

func _ready() -> void:
	if get_tree().has_group("Camera"):
		camera = get_tree().get_first_node_in_group("Camera")

func _process(_delta: float) -> void:
	if camera:
		var dropPlane  = Plane(Vector3(0, 1, 0), 0)
		var position3D = dropPlane.intersects_ray(camera.project_ray_origin(get_parent().global_position),
												camera.project_ray_normal(get_parent().global_position))
		self.global_position = position3D
