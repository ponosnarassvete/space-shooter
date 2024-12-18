class_name Puzzle_Initiator
extends Node

signal sesame

var puzzle = preload("res://scenes/objects/puzzle_test.tscn")
var initiated: bool = false
var sesame_in_action: bool = false
@export var doors: Node

func _ready() -> void:
	if doors == null: doors = $"../Panel"

func activated(id: int = -1):
	print("initiator_activated_as_", initiated)
	
	if !sesame_in_action:
		sesame.emit()
		sesame_in_action = true
		
		if !initiated:
			create(id)
			await doors.finished
		else:
			GameStateService.save_game_state(GSSConst.SAVE_FILE)
			await doors.finished
			self.get_child(1).queue_free()
		
		sesame_in_action = false
		initiated = !initiated

func create(id: int = -1):
	var puzzle_instance = puzzle.instantiate()
	puzzle_instance.name = "puzzle_" + str(id)
	self.add_child(puzzle_instance)
	puzzle_instance.puzzle_init()
