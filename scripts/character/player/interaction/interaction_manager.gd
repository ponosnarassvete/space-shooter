class_name Interaction_Manager
extends Node

@export var player: Node
@export var label: Label

@export var offset_x: float = 0.0
@export var offset_y: float = 0.0

const base_text = "[F]"

var active_areas = []
var can_interact = true

func register_area(area: Interaction_Area_3D):
	active_areas.push_back(area)

func unregister_area(area: Interaction_Area_3D):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

func _process(delta: float) -> void:
	if active_areas.size() > 0 and can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = base_text + active_areas[0].action_name
		
		label.global_position.x = DisplayServer.mouse_get_position().x + offset_x*2
		label.global_position.y = DisplayServer.mouse_get_position().y + offset_y
		
		label.show()
	else:
		label.hide()

func _sort_by_distance_to_player(area1, area2):
	return (player.global_position.distance_to(area1.global_position)) < (player.global_position.distance_to(area2.global_position))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("player_interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			label.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true
