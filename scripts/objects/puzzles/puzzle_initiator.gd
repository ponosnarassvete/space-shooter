class_name Puzzle_Initiator
extends Node

var puzzle = preload("res://scenes/objects/puzzle_test.tscn")
@export var doors: Node

var initiated: bool = false
var sesame_in_action: bool = false

var puzzles = {}
var current_puzzle: Connectable

#var in_out: Dictionary = {}


func _ready() -> void:
	if doors == null: doors = $"../Panel"

#func _register_puzzle(id: int = -1):
	#if id != -1:
		#in_out.get_or_add(id, {"in":{},"out":{}})
	#else: printerr("ERROR_UNKNOWN_PUZZLE_ID")
#
#func add_in_out(id: int = -1, new_ins: Dictionary = {}, new_outs: Dictionary = {}):
	#
	#if !in_out.has(id):
		#_register_puzzle(id)
		#
	#var ins_set: Dictionary = in_out.get(id).get("in")
	#var outs_set: Dictionary = in_out.get(id).get("out")
	#
	#ins_set.merge(new_ins)
	#outs_set.merge(new_outs)
	#
	#in_out[id]["in"] = ins_set
	#in_out[id]["out"] = outs_set

func activated(puzzle_box: Connectable):
	
	print("initiator_activated_as_", initiated)
	
	if sesame_in_action:
		return

	doors.sesame()
	sesame_in_action = true
	
	if !initiated:
		
		current_puzzle = puzzle_box
		
		if !puzzles.has(puzzle_box):
			create(puzzle_box)
		else:
			add_child(puzzles[puzzle_box.object_id])
		
		await doors.finished
		
	else:
		
		GameStateService.save_game_state(GlobalStuff.SAVE_FILE)
		await doors.finished
		
		remove_child(puzzles[current_puzzle])
	
	sesame_in_action = false
	initiated = !initiated

func create(puzzle_box: Connectable):
	
	var puzzle_instance = puzzle.instantiate()
	puzzle_instance.name = "puzzle_" + str(puzzle_box.object_id)
	puzzle_instance.object_id = puzzle_box.object_id
	self.add_child(puzzle_instance)
	puzzle_instance.puzzle_init()
	
	puzzles.merge({puzzle_box: puzzle_instance})
