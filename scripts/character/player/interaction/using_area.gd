class_name Using_Area
extends Area3D
## For tool to activate code inside the using area
signal used
signal activate

@export var target: Node3D
@export var needed_tool: Globals.TOOLS = Globals.TOOLS.NONE
@export var fixed: bool

func _ready() -> void:
	if target == null: target = $"../Interaction_Area_3D"
	
	if !fixed:
		target.collision_mask = 0

		match needed_tool:
			Globals.TOOLS.NONE:
				target.collision_mask = 1
			Globals.TOOLS.GRABBING_TOOL:
				self.collision_layer = 16
			Globals.TOOLS.REPAIRING_TOOL:
				self.collision_layer = 32
			Globals.TOOLS.HACKING_TOOL:
				self.collision_layer = 64
			Globals.TOOLS.ATTACKING_TOOL:
				self.collision_layer = 128
			
		print(self.name, "_collision_layer_", self.collision_layer)


func tool_check(tool: Globals.TOOLS = Globals.TOOLS.NONE):
	if tool == needed_tool or needed_tool == Globals.TOOLS.NONE:
		print(target.name, "_used_by_", Globals.TOOLS.find_key(tool))
		
		target.collision_mask = 1
		activate.emit()
		
		return true
	
	return false
