extends Node3D

signal activate()
signal disactivate()

var triggered: int = 0

func signal_enter(positive: bool):
	if positive:
		triggered +=1
	else:
		triggered -=1
	
	if triggered == 2:
		activate.emit()
	else:
		disactivate.emit()
