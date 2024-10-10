class_name Navigation_Server_3D
extends Node

@export var navigation_region: NavigationRegion3D
var path = []
var map

func _ready() -> void:
	map = NavigationServer3D.map_create()
	NavigationServer3D.map_set_active(map, true)
	
	var region = NavigationServer3D.region_create()
	NavigationServer3D.region_set_transform(region, Transform3D())
	NavigationServer3D.region_set_map(region, map)
	
	var navigation_poly = NavigationMesh.new()
	navigation_poly = navigation_region.navigation_polygon
	NavigationServer3D.region_set_navigation_polygon(region, navigation_poly)

func _update_navigation_path(start_position, end_position):
	path = NavigationServer3D.map_get_path(map, start_position, end_position, true)
	path.remove_at(0)
	set_process(true)
