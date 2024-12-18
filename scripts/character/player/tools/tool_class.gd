class_name Tools
extends Node

var tool_name: GlobalEnums.TOOLS = GlobalEnums.TOOLS.NONE

#signal used

func tool_used(target: Area3D, tool_id: GlobalEnums.TOOLS = GlobalEnums.TOOLS.NONE):
	if tool_id == tool_name:
		target.used.emit(tool_name)
		print(self.name, "_target_", target.name)
