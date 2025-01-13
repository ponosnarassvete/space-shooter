extends Node3D

signal activate(positive: bool)

var triggered: int = 0

func trigger_pinged():
	triggered+=1
	check()

func trigger_unpinged():
	triggered-=1
	
	if triggered == 5:
		activate.emit(false)

func check():
	if triggered == 6:
		activate.emit(true)
