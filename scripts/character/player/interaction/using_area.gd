class_name Using_Area
extends Area3D
## For tool to activate code inside the using area
signal used
signal activate

@export var target: Node3D
@export var needed_tool: GlobalEnums.TOOLS = GlobalEnums.TOOLS.NONE

func _ready() -> void:
	if target == null: target = $"../Interaction_Area_3D"
	
	target.collision_mask = 0
	
	match needed_tool:
		GlobalEnums.TOOLS.NONE:
			target.collision_mask = 1
		GlobalEnums.TOOLS.GRABBING_TOOL:
			self.collision_layer = 5
		GlobalEnums.TOOLS.REPAIRING_TOOL:
			self.collision_layer = 6
		GlobalEnums.TOOLS.HACKING_TOOL:
			self.collision_layer = 7
		GlobalEnums.TOOLS.ATTACKING_TOOL:
			self.collision_layer = 8
	print(self.name, "_collision_layer_", self.collision_layer)


func tool_check(tool: GlobalEnums.TOOLS = GlobalEnums.TOOLS.NONE):
	if tool == needed_tool or needed_tool == GlobalEnums.TOOLS.NONE:
		print(target.name, "_used_by_", GlobalEnums.TOOLS.find_key(tool))
		target.collision_mask = 1
		activate.emit()
