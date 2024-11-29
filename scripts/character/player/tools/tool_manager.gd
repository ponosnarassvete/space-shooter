class_name Tool_Manager
extends Node

signal tool_used
signal tool_swapped
signal tool_added
signal tool_removed

@export var tool_use_area: Area2D
var active_tool: String = "Grabber"
var tool_bar: Array = [] # Grabber
						 # Repairer
						 # Hacker
						 # Attacker

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
			tool_used.emit()
			print(active_tool)


func tool_add(tool: String):
	pass

func tool_remove(tool: String):
	pass
