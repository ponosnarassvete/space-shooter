class_name Tools
extends Node

var tool_name: Globals.TOOLS = Globals.TOOLS.NONE

#signal used

func tool_used(target: Area3D, tool_id: Globals.TOOLS = Globals.TOOLS.NONE):
	if tool_id == tool_name:
		target.used.emit(tool_name)
		print(self.name, "_target_", target.name)
