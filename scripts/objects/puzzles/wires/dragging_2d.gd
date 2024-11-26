class_name Dragging_2D
extends Area2D

@export var sprite: Sprite2D
@export var snap_threshold: int = 20 

signal dropped
signal picked

var id: int = -1 

var dragging = false  # Variable to track whether we are dragging
static var currently_sprited = false

var offset = Vector2()  # Offset from the mouse to the sprite position when starting drag

func _ready() -> void:
	get_id()

func get_id():
		if "id" in sprite:
			id = sprite.id
		else:
			id = -1	

func clicked():
	if Input.is_action_just_released("player_shoot"):
		currently_sprited = false
		print("dropped_", id)
		sprite.z_index -= 1
		dropped.emit(id)
	elif Input.is_action_pressed("player_shoot"):
		currently_sprited = true
		print("picked_", id)
		sprite.z_index += 1
		picked.emit(id)

#func _input(event):
#		
	#if event is InputEventMouseButton:	
		#if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#get_id()
			#
			## Check if the mouse is over the sprite (collision detection)
			#if is_mouse_over() and currently_sprited == false:
				#print("picked_", id)
				#picked.emit(id)
				#sprite.z_index += 1
				#dragging = true
				#currently_sprited = true
				#offset = sprite.global_position - event.position  # Calculate offset
			#
		#elif not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#get_id()
			#if is_mouse_over():
				#sprite.z_index -= 1
				#print("dropped_", id)
				#dropped.emit(id)
			#
			#currently_sprited = false
			#dragging = false  # Stop dragging when mouse button is released
	#
	#if event is InputEventMouseMotion and dragging:
		#sprite.global_position = event.position + offset


#func is_mouse_over() -> bool:
	## Check if the mouse is over the sprite
	#var mouse_pos = get_viewport().get_mouse_position()
	#return (mouse_pos.x > sprite.global_position.x - sprite.get_rect().size.x * sprite.scale.x / 2 and
			#mouse_pos.x < sprite.global_position.x + sprite.get_rect().size.x * sprite.scale.x / 2 and
			#mouse_pos.y > sprite.global_position.y - sprite.get_rect().size.y * sprite.scale.y / 2 and
			#mouse_pos.y < sprite.global_position.y + sprite.get_rect().size.y * sprite.scale.y / 2)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print("input_", viewport)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		
		if currently_sprited:
			sprite.global_position = event.position + offset


func _on_mouse_entered() -> void:
	print("mouse_entered")
	dragging = true

func _on_mouse_exited() -> void:
	print("mouse_exited")
	dragging = false
