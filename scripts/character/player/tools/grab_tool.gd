class_name Grabbing_Tool
extends Tools

func _ready() -> void:
	tool_name = "Grabbing_Tool"

func got_used():
	used.emit("Grab")
