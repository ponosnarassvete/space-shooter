class_name Using_Area
extends Area3D
## For tool to activate code inside the using area
signal used
signal activate

@export var target: Interaction_Area_3D
@export var needed_tool: GlobalStuff.TOOLS = GlobalStuff.TOOLS.NONE
@export var fixed: bool

func _ready() -> void:
	if target == null: target = $"../Interaction_Area_3D"
	
	if fixed: target.ready_for_interaction = true
	else: target.ready_for_interaction = false

	match needed_tool:
		GlobalStuff.TOOLS.NONE:
			target.collision_mask = 1
		GlobalStuff.TOOLS.GRABBING_TOOL:
			self.collision_layer = 16
		GlobalStuff.TOOLS.REPAIRING_TOOL:
			self.collision_layer = 32
		GlobalStuff.TOOLS.HACKING_TOOL:
			self.collision_layer = 64
		GlobalStuff.TOOLS.ATTACKING_TOOL:
			self.collision_layer = 128
		
	print(self.name, "_collision_layer_", self.collision_layer)


func tool_check(tool: GlobalStuff.TOOLS = GlobalStuff.TOOLS.NONE):
	if tool == needed_tool or needed_tool == GlobalStuff.TOOLS.NONE:
		print(target.name, "_used_by_", GlobalStuff.TOOLS.find_key(tool))
		
		target.ready_for_interaction = true
		activate.emit()
		
		return true
	
	return false
