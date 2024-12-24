extends Node

signal rubbish

@export var object_id: int = -1

var rubbished = false

func puzzle_init():
	if !rubbished:
		rubbish.emit()
		rubbished = true
