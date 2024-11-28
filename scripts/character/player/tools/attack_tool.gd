class_name Attacking_Tool
extends Tools

func tool_used(target: Node):
	used.emit(target, "Attack")
