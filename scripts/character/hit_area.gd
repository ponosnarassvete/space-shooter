class_name Hit_Area_3D
extends Area3D

signal damaged

## Could target be damaged?
@export var hittable: bool = true

## Could target damage?
@export var damaging: bool = true

## Target's damage stats
@export var damage_stat: Damage_Stats

## Damage Type
@export_enum("Range", "Close") var damage_type: String 

func _process(delta: float) -> void:
	pass

func on_area_entered(area: Area3D) -> void:
	print("on_area_entered_", area.name)
	if area is Hit_Area_3D and hittable:
		if area.damaging:
			if damage_type == "Close":
				print(area.name, "_hit_amount_", -area.damage_stat.CLOSE_DAMAGE)
				damaged.emit(-area.damage_stat.CLOSE_DAMAGE)
			else:	
				print(area.name, "_hit_amount_", -area.damage_stat.RANGE_DAMAGE)
				damaged.emit(-area.damage_stat.RANGE_DAMAGE)
