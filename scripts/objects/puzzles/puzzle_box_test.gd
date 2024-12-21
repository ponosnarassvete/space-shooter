extends Node3D

@export var puzzle_initiator: Puzzle_Initiator
@export var interaction_area: Interaction_Area_3D
@export var connection_list: Connections_List
@export var puzzle_id: int = -1

func _ready() -> void:
	if interaction_area != null: interaction_area.interact = Callable(self, "activate_interaction")
	if puzzle_initiator == null: puzzle_initiator = $"../../../2D_Viewport/Background/Puzzle/Puzzle_UI"
	if connection_list == null: $Connection_Node
	
func activate_interaction():
	puzzle_initiator.activated(puzzle_id)
