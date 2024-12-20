class_name Trigger
extends Area3D

signal entered

@export var triggered_group_name: String

func f_entered():
	print("SKIBIDI")
	entered.emit()
	if triggered_group_name != null:
		get_tree().call_group(triggered_group_name, "activate")

func _on_area_entered(_area: Area3D) -> void:
	f_entered()

func _on_body_entered(_body: Node3D) -> void:
	f_entered()
