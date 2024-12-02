class_name Tools
extends Node

var tool_name = "Tool"

signal used

func tool_used(target: Area3D):
	target.used.emit(tool_name)
	print(self.name, "_target_", target.name)
