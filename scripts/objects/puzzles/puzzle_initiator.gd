class_name Puzzle_Initiator
extends Node

signal sesame

var puzzle = preload("res://scenes/objects/puzzle_test.tscn")
var initiated: bool = false
var sesame_in_action: bool = false
var puzzles = {}
var current_puzzle_id: int = -1
@export var doors: Node

func _ready() -> void:
	if doors == null: doors = $"../Panel"

func activated(id: int = -1):
	print("initiator_activated_as_", initiated)
	
	if !sesame_in_action:
		sesame.emit()
		sesame_in_action = true
		
		if !initiated:
			current_puzzle_id = id
			if !puzzles.has(id):
				create(id)
			else:
				add_child(puzzles[id])
			await doors.finished
		else:
			GameStateService.save_game_state(GSSConst.SAVE_FILE)
			await doors.finished
			print(puzzles)
			remove_child(puzzles[current_puzzle_id])
			#self.get_child(1).queue_free()
			
		
		sesame_in_action = false
		initiated = !initiated

func create(id: int = -1):
	var puzzle_instance = puzzle.instantiate(1)
	puzzles.merge({id: puzzle_instance})
	puzzle_instance.name = "puzzle" + str(id)
	self.add_child(puzzle_instance)
	puzzle_instance.puzzle_init()
