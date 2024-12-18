class_name Tool_Manager_Class
extends Node

signal tool_used
signal tool_swapped
#signal tool_added
#signal tool_removed

var target_list: Array = []
var active_tool: GlobalEnums.TOOLS = GlobalEnums.TOOLS.GRABBING_TOOL
var tool_bar: Array = [] # Grabbing_Tool
						 # Repair_Tool
						 # Hacking_Tool
						 # Attacking_Tool

func _ready() -> void:
	for node in get_tree().get_nodes_in_group("Active_Tool"):
		if node.tool_name != active_tool:
			tool_bar.push_back(node.tool_name)

func target_list_add(target_area: Area3D):
	print("target_list_add_", target_area.name)
	if !(target_area in target_list):
		target_list.append(target_area)

func target_list_remove(target_area: Area3D):
	print("target_list_remove_", target_area.name)
	if target_area in target_list:
		target_list.erase(target_area)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("tool_swap_up"):
		tool_bar.insert(0, active_tool)
		active_tool = tool_bar.pop_back()
		tool_swapped.emit()
		print(GlobalEnums.TOOLS.find_key(ToolManager.active_tool), "_from_", tool_bar)
		
	elif Input.is_action_pressed("tool_swap_down"):
		tool_bar.append(active_tool)
		active_tool = tool_bar.pop_front()
		tool_swapped.emit()
		print(GlobalEnums.TOOLS.find_key(ToolManager.active_tool), "_from_", tool_bar)

func tool_add(_tool: String):
	pass

func tool_remove(_tool: String):
	pass
