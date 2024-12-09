class_name Hacking_Tool
extends Tools

func _ready() -> void:
	tool_name = "Hacking_Tool"

func gor_used():
	used.emit("Hack")
