class_name Trigger
extends Area3D

signal entered

@export var triggered_group_name: String

func f_entered():
	entered.emit()

func _on_area_entered(_area: Area3D) -> void:
	f_entered()

func _on_body_entered(_body: Node3D) -> void:
	f_entered()
