class_name Cursor_Texturing_2D
extends Node

@export var crosshair: Node2D
@export var sprite: AnimatedSprite2D

func _process(_delta: float) -> void:
	Input.set_custom_mouse_cursor(sprite.sprite_frames.get_frame_texture('default',sprite.frame), 
								Input.CURSOR_ARROW, 
								Vector2(sprite.sprite_frames.get_frame_texture('default',sprite.frame).get_width(), 
									sprite.sprite_frames.get_frame_texture('default',0).get_height()) / 2)
