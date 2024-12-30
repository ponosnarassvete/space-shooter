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
@export var damage_type: GlobalStuff.DAMAGE_TYPES

func on_area_entered(area: Area3D) -> void:
	print("on_area_entered_", area.name)
	if area is Hit_Area_3D and !get_parent().is_in_group("Enemy"):
		if !area.damaging or !hittable:
			return
		
		if damage_type == GlobalStuff.DAMAGE_TYPES.CLOSE_DAMAGE:
			print(area.name, "_", damage_type , "_hit_amount_", -area.damage_stat.CLOSE_DAMAGE)
			damaged.emit(-area.damage_stat.CLOSE_DAMAGE)
		else:	
			print(area.name, "_", damage_type, "_hit_amount_", -area.damage_stat.RANGE_DAMAGE)
			damaged.emit(-area.damage_stat.RANGE_DAMAGE)


func _on_body_entered(body: Node3D) -> void:
	print("on_body_entered_", body.name)
	if body.is_in_group("Projectiles"):
		if !body.damaging or !hittable:
			return
		
		if body is Bullet:
			if get_parent().is_in_group(body.shooter_group):
				return
		
		if damage_type == GlobalStuff.DAMAGE_TYPES.CLOSE_DAMAGE:
			print(body.name, "_", damage_type , "_hit_amount_", -body.damage_stat.CLOSE_DAMAGE)
			damaged.emit(-body.damage_stat.CLOSE_DAMAGE)
		else:	
			print(body.name, "_", damage_type, "_hit_amount_", -body.damage_stat.RANGE_DAMAGE)
			damaged.emit(-body.damage_stat.RANGE_DAMAGE)
