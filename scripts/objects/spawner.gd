extends Node3D

var enemy = preload(GlobalStuff.ENEMY_SCENE)
var enemy_list = []
var counter: int = 0
var can_spawn: bool = false

@export var timer: Timer

func activate():		
	can_spawn = true

func disactivate():	
	can_spawn = false

func spawn():
	if counter == 10:
		return
		
	if can_spawn:
		if timer.is_stopped():
			var enemy_instance = enemy.instantiate()
			enemy_instance.name = "Enemy_" + str(counter)
			enemy_list.append(enemy_instance)
			self.add_child(enemy_instance)
			enemy_instance.global_position = self.global_position
			counter += 1
		
		timer.start()
