class_name Clickable_2D
extends Area2D

signal click

var id: int = -1

func _ready() -> void:
	var parent_obj = get_parent()
	if "id" in parent_obj:
		id = get_parent().id

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		click.emit(id)

func on_click():
	print("Click")
