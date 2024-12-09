class_name Hit_Area_3D
extends Area3D

signal damaged

#enum DAMAGE_TYPE {Close_Damage = 0, Range_Damage = 1}

## Could target be damaged?
@export var hittable: bool = true

## Could target damage?
@export var damaging: bool = true

## Target's damage stats
@export var damage_stat: Damage_Stats

## Damage Type
#@export var damage_type: DAMAGE_TYPE = DAMAGE_TYPE.Close_Damage
@export_enum("Close_Damage", "Range_Damage") var damage_type: int

func _process(delta: float) -> void:
	pass

func on_area_entered(area: Area3D) -> void:
	print("on_area_entered_", area.name)
	if area is Hit_Area_3D and hittable:
		if area.damaging:
			#if damage_type == DAMAGE_TYPE.Close_Damage:
			if damage_type == 0:
				print(area.name, "_", damage_type , "_hit_amount_", -area.damage_stat.CLOSE_DAMAGE)
				damaged.emit(-area.damage_stat.CLOSE_DAMAGE)
			else:	
				print(area.name, "_", damage_type, "_hit_amount_", -area.damage_stat.RANGE_DAMAGE)
				damaged.emit(-area.damage_stat.RANGE_DAMAGE)
