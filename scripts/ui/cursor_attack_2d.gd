class_name Cursor_Attack_2D
extends Node

@export var sprite: AnimatedSprite2D

func _process(delta: float) -> void:
	if Input.is_action_pressed("player_shoot"):
		sprite.set_frame_and_progress(1,0.0)
		sprite.play()

func _on_cursor_sprite_animation_finished() -> void:
	sprite.set_frame_and_progress(0,0.0)
	sprite.stop()
