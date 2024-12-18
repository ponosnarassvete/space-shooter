extends Node3D

@export var puzzle_initiator: Puzzle_Initiator
@export var interaction_area: Interaction_Area_3D
@export var id: int = -1

func _ready() -> void:
	if interaction_area != null: interaction_area.interact = Callable(self, "activate_interaction")
	if puzzle_initiator == null: puzzle_initiator = $"../../../2D_Viewport/Background/Puzzle/Puzzle_UI"
	#interaction_area = $Interaction_Area_3D
	#interaction_area.collision_mask = 0

func activate_interaction():
	puzzle_initiator.activated(id)
	
	#print("activate_interaction_", self.name, "_using_", tool)
	#if tool == needed_tool:
		#interaction_area.collision_mask = 1
