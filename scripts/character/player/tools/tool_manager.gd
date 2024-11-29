class_name Tool_Manager
extends Node

@export var tool_use_area: Area2D
var active_tool: String = "Grabber"
var tool_bar: Array = [] # Grabber
						 # Repairer
						 # Hacker
						 # Attacker

func _ready() -> void:
	tool_use_area = $Tool_Use_Area

func _input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("tool_swap_up"):
		tool_bar.insert(0, active_tool)
		active_tool = tool_bar.pop_back()
	elif Input.is_action_pressed("tool_swap_down"):
		tool_bar.append(active_tool)
		active_tool = tool_bar.pop_front()

func used():
	if Input.is_action_pressed("player_shoot"):
		pass
		


func _on_tool_use_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
