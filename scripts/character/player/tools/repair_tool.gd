class_name Repairing_Tool
extends Tools

func tool_used(target: Node):
	used.emit(target, "Repair")
