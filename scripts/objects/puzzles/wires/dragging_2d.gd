class_name Dragging_2D
extends Node

@export var sprite: Sprite2D
@export var snap_threshold: int = 20 

signal dropped
signal picked
signal connected

var id: int = -1 

var dragging = false  # Variable to track whether we are dragging
static var currently_sprited = false

var offset = Vector2()  # Offset from the mouse to the sprite position when starting drag


func get_id():
		if "id" in sprite:
			id = sprite.id
		else:
			id = -1	

func _input(event):
	
	if event is InputEventMouseButton:	
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_id()
			
			picked.emit(id)
			sprite.get_parent().move_child(sprite, 1)
			
			# Check if the mouse is over the sprite (collision detection)
			if is_mouse_over() and currently_sprited == false:
				dragging = true
				currently_sprited = true
				offset = sprite.global_position - event.position  # Calculate offset
			
		elif not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_id()
			
			sprite.get_parent().move_child(sprite, -1)
			dropped.emit(id)
			
			currently_sprited = false
			dragging = false  # Stop dragging when mouse button is released
	
	if event is InputEventMouseMotion and dragging:
		sprite.global_position = event.position + offset


func is_mouse_over() -> bool:
	# Check if the mouse is over the sprite
	var mouse_pos = get_viewport().get_mouse_position()
	return (mouse_pos.x > sprite.global_position.x - sprite.get_rect().size.x * sprite.scale.x / 2 and
			mouse_pos.x < sprite.global_position.x + sprite.get_rect().size.x * sprite.scale.x / 2 and
			mouse_pos.y > sprite.global_position.y - sprite.get_rect().size.y * sprite.scale.y / 2 and
			mouse_pos.y < sprite.global_position.y + sprite.get_rect().size.y * sprite.scale.y / 2)
