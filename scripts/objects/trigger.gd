class_name Trigger
extends Area3D

signal entered

var unable: bool = true

func f_entered():
	if !unable:
		entered.emit()

func _on_area_entered(_area: Area3D) -> void:
	f_entered()

func _on_body_entered(_body: Node3D) -> void:
	f_entered()

func able():
	unable = false
