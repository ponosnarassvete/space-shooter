extends Sprite2D

@export var scale_upper: float = 2.0
@export var scale_lower: float = 1.0
@export var child_offset: float = 500.0
@export var amount: int = 5
@export var id: int = -1
var z_index_count = self.z_index
var id_count = 0


func scatter(object):
		object.frame = randi() % hframes
		object.z_index = z_index_count
		z_index_count+=1
		object.id += id_count
		id_count +=1
		
		object.position.x += (randf()-0.5) * child_offset
		object.position.y += (randf()-0.5) * child_offset
		
		var obj_scale = randf_range(scale_lower, scale_upper)
		object.scale = Vector2(obj_scale, obj_scale) 
		
		object.show()

func init():
	print("rubbish_init")
	var rubbish = []
	for n in amount:
		var sprite2d = self.duplicate()
		rubbish.append(sprite2d)
		scatter(sprite2d)
		get_parent().add_child(sprite2d)
