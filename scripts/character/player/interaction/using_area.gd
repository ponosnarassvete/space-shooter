class_name Using_Area
extends Area3D
signal used
signal activate

@export var needed_tool: String = "None"

func tool_check(tool: String = "None"):
	if tool == needed_tool:
		activate.emit()
