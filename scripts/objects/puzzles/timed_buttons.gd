extends Node3D

signal activate()

@export var light_1: OmniLight3D
@export var light_2: OmniLight3D
@export var button_1_interaction_area: Interaction_Area_3D
@export var button_2_interaction_area: Interaction_Area_3D
@export var timer: Timer
var activated: bool = false

func _ready() -> void:
	light_1.light_color = 0xff0000ff
	light_2.light_color = 0xff0000ff
	button_1_interaction_area.interact = Callable(self, "button_1_pressed")
	button_2_interaction_area.interact = Callable(self, "button_2_pressed")
	

func start():
	timer.start()
	button_2_interaction_area.get_ready_for_interaction()
	
	light_1.light_color = 0x00ff00ff
	light_2.light_color = 0xffff00ff
	
	await timer.timeout
	
	if !activated:
		stopped()

func stopped():
	light_1.light_color = 0xff0000ff
	light_2.light_color = 0xff0000ff
	
	button_2_interaction_area.disable_interaction()

func button_1_pressed():
	if !activated:
		start()

func button_2_pressed():
	if !timer.is_stopped():
		activate.emit()
		activated = true
		light_2.light_color = 0x00ff00ff
	else:
		pass
