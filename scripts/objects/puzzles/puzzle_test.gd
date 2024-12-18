extends Node

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

@export var my_id: int = -1

@onready var wires_and_targets: Node2D = $Wires_and_Targets

var rubbished = false
var initiated = false

func puzzle_init():
	if !rubbished:
		rubbish.emit()

func f_first(energy: Energy_Parameters):
	first_out.emit(energy)

func f_second(energy: Energy_Parameters):
	second_out.emit(energy)

func f_third(energy: Energy_Parameters):
	third_out.emit(energy)

func f_fourth(energy: Energy_Parameters):
	fourth_out.emit(energy)

func f_fifth(energy: Energy_Parameters):
	fifth_out.emit(energy)

func f_sixth(energy: Energy_Parameters):
	sixth_out.emit(energy)
