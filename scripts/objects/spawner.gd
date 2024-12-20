extends Node3D

var enemy = preload("res://scenes/characters/enemy_test.tscn")
var enemy_list = []
var counter: int = 0
var can_spawn: bool = false

@export var timer: Timer

func activate():
	can_spawn = true

func disactivate():
	can_spawn = false

func spawn():
	if can_spawn:
		if timer.is_stopped():
			var enemy_instance = enemy.instantiate()
			enemy_instance.name = "Enemy_" + str(counter)
			enemy_list.append(enemy_instance)
			self.add_child(enemy_instance)
			counter += 1
		
		timer.start()
