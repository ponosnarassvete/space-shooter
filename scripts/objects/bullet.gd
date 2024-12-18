extends StaticBody3D    
class_name Bullet
  
signal hit

## Could target damage?
@export var damaging: bool = true

## Target's damage stats
@export var damage_stat: Damage_Stats

## Damage Type
@export var damage_type: GlobalEnums.DAMAGE_TYPES = GlobalEnums.DAMAGE_TYPES.RANGE_DAMAGE

var velocity:Vector3   

func _ready() -> void:
	self.add_to_group("Projectiles")
	self.collision_layer = GlobalEnums.LAYERS.HIT_BOX_LAYER

func launch(direction:Vector3, speed:float, stats: Damage_Stats):
	print("Bullet_shot")
	damage_stat = stats    
	velocity = direction * speed    

func _physics_process(delta: float) -> void: 
	
	var collision = move_and_collide(velocity)
	if collision != null:    
		hit.emit()    
		queue_free()  
