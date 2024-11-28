class_name Grabbing_Tool
extends Tools

func tool_used(target: Node):
	used.emit(target, "Grab")
