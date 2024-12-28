extends Connectable

@export var puzzle_initiator: Puzzle_Initiator
@export var interaction_area: Interaction_Area_3D

var initiated: bool = false

func _ready() -> void:
	if interaction_area != null: interaction_area.interact = Callable(self, "activate_interaction")
	if puzzle_initiator == null: puzzle_initiator = $"../../../2D_Viewport/Background/Puzzle/Puzzle_UI"

func activate_interaction():
	puzzle_initiator.activated(self)
	initiated = !initiated


func _on_area_3d_body_exited(_body: Node3D) -> void:
	if interaction_area.ready_for_interaction and initiated:
		activate_interaction()
