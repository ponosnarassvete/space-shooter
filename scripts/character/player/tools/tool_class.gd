class_name Tools
extends Node

signal used

func tool_used(target: Node):
	used.emit(target)
