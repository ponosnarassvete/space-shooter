class_name Energy_Wires
extends Sprite2D

signal pulse
signal connecting
signal disconnecting

@export var id: int = -1

@export var energy_par: Energy_Parameters
@export var target_group_name: String = "Target_Wire"

var activated: bool = false
var connected: bool = false

var targets: Array = []
var target
var target_id = -1

var snap_threshold: int = 20


func _ready() -> void:
	targets = get_tree().get_nodes_in_group(target_group_name)
	if energy_par:
		activated = true

func _process(delta: float) -> void:# if both are true then it should pulse every tick	
	if activated:
		if connected:
			pulse.emit(self, id)


func wire_connected(trgt: Node2D, trgt_id: int = -1, obj_id: int = -1):# connected
	if obj_id == id and obj_id >= 0:	
		print(self.name, "_id: ", id, " - wire_connected_id: ", obj_id)
		connected = true
		target = trgt
		target_id = trgt_id
		connecting.emit(self, trgt, id, trgt_id)

func wire_disconnected(obj_id: int = -1): # disconnected
	if obj_id == id and obj_id >= 0:
		print(self.name, "_id: ", id, " - wire_disconnected_id: ", obj_id)
		connected = false
		disconnecting.emit(self, target, id, target_id)

func connection_check(obj_id: int = -1):
	if obj_id == id and obj_id >= 0:
		for trgt in targets:
			if self.position.distance_to(trgt.position) < snap_threshold:
				self.position = trgt.position
				if "id" in trgt:
					wire_connected(trgt, trgt.id, obj_id)
				else:
					wire_connected(trgt, -1, obj_id)
				break

func set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy

func get_energy():
	return energy_par
