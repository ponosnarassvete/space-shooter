class_name Puzzle_Initiator
extends Node

var puzzle = preload(GlobalStuff.PUZZLE_SCENE)
@export var doors: Node

var initiated: bool = false
var sesame_in_action: bool = false

#{puzzle_box_id:puzzle_instance}
var puzzles = {}
var current_puzzle_box_id: int = -1


func _ready() -> void:
	if doors == null: doors = $"../Panel"

func activated(puzzle_box: Connectable):
	
	var puzzle_box_id = puzzle_box.object_id
	
	print("initiator_activated_as_", initiated)
	
	if sesame_in_action:
		return

	doors.sesame()
	sesame_in_action = true
	
	if !initiated:
		
		current_puzzle_box_id = puzzle_box_id
		
		if !puzzles.has(puzzle_box_id):
			create(puzzle_box_id)
		else:
			add_child(puzzles[puzzle_box_id])
		
		await doors.finished
		
	else:
		
		GameStateService.save_game_state(GlobalStuff.SAVE_FILE)
		await doors.finished
		
		remove_child(puzzles[current_puzzle_box_id])
	
	sesame_in_action = false
	initiated = !initiated

func create(puzzle_box_id: int):
	
	var puzzle_instance = puzzle.instantiate()
	puzzle_instance.name = "puzzle_" + str(puzzle_box_id)
	puzzle_instance.object_id = puzzle_box_id
	self.add_child(puzzle_instance)
	puzzle_instance.puzzle_init()
	
	puzzles.merge({puzzle_box_id: puzzle_instance})
