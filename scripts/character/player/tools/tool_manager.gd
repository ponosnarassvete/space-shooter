class_name Tool_Manager
extends Node

signal tool_used
signal tool_swapped
signal tool_added
signal tool_removed

@export var player: CharacterBody3D
@export var using_area: Area3D
@export var max_tool_distance: float = 5.0
@export var tool_use_area: Area2D

var target_list: Array = []
var active_tool: String = "Grabber"
var tool_bar: Array = [] # Grabber
						 # Repairer
						 # Hacker
						 # Attacker

func _ready() -> void:
	using_area = $"../../SubViewportContainer/Cursor/Projection_3D/Using_Area"
	player = $"../../SubViewportContainer/SubViewport/Characters/Player_Node/Player"
	for node in get_tree().get_nodes_in_group("Active_Tool"):
		tool_bar.push_back(node.name)

func target_list_add(target_area: Area3D):
	if !(target_area in target_list):
		target_list.append(target_area)

func target_list_remove(target_area: Area3D):
	if target_area in target_list:
		target_list.erase(target_area)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("tool_swap_up"):
		tool_bar.insert(0, active_tool)
		active_tool = tool_bar.pop_back()
		tool_swapped.emit()
	elif Input.is_action_pressed("tool_swap_down"):
		tool_bar.append(active_tool)
		active_tool = tool_bar.pop_front()
		tool_swapped.emit()
	
	if Input.is_action_just_pressed("player_shoot"):
		var mouse_pos = get_viewport().get_mouse_position()
		if tool_use_area.get_viewport_rect().has_point(mouse_pos):
			if using_area.global_position.distance_to(player.global_position) <= max_tool_distance and !target_list.is_empty():
				tool_used.emit(target_list[0])
				print("tool_used_", active_tool)


func tool_add(tool: String):
	pass

func tool_remove(tool: String):
	pass
