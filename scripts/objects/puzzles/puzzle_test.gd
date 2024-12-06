extends Node

signal sesame
signal rubbish

@export var id: int = -1

@export var interaction_area: Interaction_Area_3D

var interactable = true
var interaction
var test = Sprite2D

func puzzle_init():
	if interactable:
		interactable = false
		rubbish.emit()
		sesame.emit()
		
func _ready() -> void:
	if interaction_area != null: interaction_area.interact = Callable(self, "puzzle_init")
