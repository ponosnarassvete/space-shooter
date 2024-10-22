extends Node

@export var interaction_area: Interaction_Area_3D
@export var base: Sprite2D

@export var offset: float = 500.0
@export var scale_upper: float = 2.0
@export var scale_lower: float = 1.0
@export var amount: int = 5

var interactable = true
var interaction
var test = Sprite2D

func scatter(object):
		object.frame = randi() % base.hframes
		object.position.x += (randf()-0.5) * offset
		object.position.y += (randf()-0.5) * offset
		var scale = randf_range(scale_lower, scale_upper)
		object.scale = Vector2(scale, scale) 
		object.show()

func puzzle_init():
	if interactable:
		var rubbish = []
		for n in amount:
			var sprite2d = base.duplicate()
			rubbish.append(sprite2d)
			scatter(sprite2d)
			add_child(sprite2d)
		interactable = false
		
func _ready() -> void:
	interaction_area.interact = Callable(self, "puzzle_init")

func _process(delta: float) -> void:
	pass
