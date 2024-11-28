class_name Hacking_Tool
extends Tools

func tool_used(target: Node):
	used.emit(target, "Hack")
