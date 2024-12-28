class_name Repairable_Interaction_Area_3D
extends Interaction_Area_3D
## For tool to activate code inside the using area
signal used
signal repaired

@export var needed_tool: GlobalStuff.TOOLS = GlobalStuff.TOOLS.NONE

func _ready() -> void:	

		match needed_tool:
			GlobalStuff.TOOLS.NONE:
				ready_for_interaction = true
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
		print(self.name, "_used_by_", GlobalStuff.TOOLS.find_key(tool))
		if !ready_for_interaction:
			repaired.emit()
		ready_for_interaction = true
		
		
		return true
	
	return false
