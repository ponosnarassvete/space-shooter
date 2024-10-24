class_name Dragging_2D
extends Node

@export var sprite: Sprite2D

signal dropped
signal picked

var dragging = false  # Variable to track whether we are dragging
var offset = Vector2()  # Offset from the mouse to the sprite position when starting drag

static var current_sprite = false

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			picked.emit()
			sprite.get_parent().move_child(sprite, 1)
			# Check if the mouse is over the sprite (collision detection)
			if is_mouse_over() and current_sprite == false:
				dragging = true
				current_sprite = true
				offset = sprite.global_position - event.position  # Calculate offset
		elif not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			dropped.emit()
			sprite.get_parent().move_child(sprite, -1)
			current_sprite = false
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
