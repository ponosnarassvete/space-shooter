extends Node3D

@export var needed_tool: String = "None"
@export var interaction_area: Interaction_Area_3D

func _ready() -> void:
	interaction_area = $Interaction_Area_3D
	interaction_area.collision_mask = 0

func activate_interaction(tool: String = "None"):
	print("activate_interaction_", self.name, "_using_", tool)
	if tool == needed_tool:
		interaction_area.collision_mask = 1
