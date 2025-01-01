extends Node3D

signal activate()

var triggered: int = 0

func trigger_pinged():
	triggered+=1
	check()

func trigger_unpinged():
	triggered-=1

func check():
	if triggered == 6:
		activate.emit
