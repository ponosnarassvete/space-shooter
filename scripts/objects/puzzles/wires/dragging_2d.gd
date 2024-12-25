class_name Dragging_2D
extends Area2D

@export var sprite: Sprite2D
@export var snap_threshold: int = 20 

signal dropped
signal picked

var dragging = false 
static var currently_sprited: Sprite2D = null

func is_mouse_over() -> bool:
	# Check if the mouse is over the sprite
	var mouse_pos = get_viewport().get_mouse_position()
	return (mouse_pos.x > sprite.global_position.x - sprite.get_rect().size.x * sprite.scale.x / 2 and
			mouse_pos.x < sprite.global_position.x + sprite.get_rect().size.x * sprite.scale.x / 2 and
			mouse_pos.y > sprite.global_position.y - sprite.get_rect().size.y * sprite.scale.y / 2 and
			mouse_pos.y < sprite.global_position.y + sprite.get_rect().size.y * sprite.scale.y / 2)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not event.pressed and dragging:
		if event.button_index == MOUSE_BUTTON_LEFT:
			currently_sprited = null
			#sprite.z_index -= 1
			print("dropped_", self.name)
			dropped.emit(self)
	
	
	if currently_sprited == sprite and event is InputEventMouseMotion and dragging:
		sprite.global_position += event.relative

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and dragging and ToolManager.active_tool == GlobalStuff.TOOLS.GRABBING_TOOL:
		if currently_sprited == null and is_mouse_over() and event.button_index == MOUSE_BUTTON_LEFT:
			currently_sprited = sprite
			#sprite.z_index += 1
			print("picked_", self.name)
			picked.emit(self)		


func _on_mouse_entered() -> void:
	if !dragging and !currently_sprited:
		print("mouse_entered")
		dragging = true

func _on_mouse_exited() -> void:
	if !is_mouse_over() and dragging and !currently_sprited:
		print("mouse_exited")
		dragging = false
