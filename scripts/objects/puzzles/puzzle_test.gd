extends Node

signal sesame
signal rubbish

signal first_out
signal second_out
signal third_out
signal fourth_out
signal fifth_out
signal sixth_out

signal first_in
signal second_in
signal third_in
signal fourth_in
signal fifth_in
signal sixth_in

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

func f_first(energy: Energy_Container):
	first_out.emit(energy)

func f_second(energy: Energy_Container):
	second_out.emit(energy)

func f_third(energy: Energy_Container):
	third_out.emit(energy)

func f_fourth(energy: Energy_Container):
	fourth_out.emit(energy)

func f_fifth(energy: Energy_Container):
	fifth_out.emit(energy)

func f_sixth(energy: Energy_Container):
	sixth_out.emit(energy)
