class_name Bullet
extends StaticBody3D    
  
signal hit

var shooter_group: String

var damaging: bool = true
var damage_stat: Damage_Stats
var damage_type: GlobalStuff.DAMAGE_TYPES = GlobalStuff.DAMAGE_TYPES.RANGE_DAMAGE

var velocity:Vector3   

func _ready() -> void:
	self.add_to_group("Projectiles")
	self.collision_layer = GlobalStuff.LAYERS.HIT_BOX_LAYER

func launch(direction:Vector3, speed:float, stats: Damage_Stats):
	print("Bullet_shot")
	damage_stat = stats    
	velocity = direction * speed    
	print(velocity)

func _physics_process(_delta: float) -> void: 
	var collision = move_and_collide(velocity)
	if collision != null:    
		hit.emit()    
		queue_free()  
