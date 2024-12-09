class_name Attacking_Tool
extends Tools

func _ready() -> void:
	tool_name = "Attacking_Tool"

func got_used():
	used.emit("Attack")
