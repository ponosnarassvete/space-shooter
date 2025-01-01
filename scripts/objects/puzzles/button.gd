extends StaticBody3D

signal activate()

@export var interaction_area: Interaction_Area_3D
@export var light: OmniLight3D

func _ready() -> void:
	interaction_area.interact = Callable(self, "button_pressed")
	light.light_color = 0xff0000ff

func button_pressed():
	activate.emit()
	
	light.light_color = 0x00ff00ff
	await get_tree().create_timer(1.0).timeout
	light.light_color = 0xff0000ff
