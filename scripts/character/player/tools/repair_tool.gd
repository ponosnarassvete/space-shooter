class_name Repairing_Tool
extends Tools

func _ready() -> void:
	tool_name = "Repair_Tool"

func got_used():
	used.emit("Repair")
