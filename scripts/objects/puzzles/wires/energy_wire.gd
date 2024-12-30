class_name Energy_Wire
extends Sprite2D

signal connecting(object:Energy_Wire, target:Energy_Target)
signal disconnecting(object:Energy_Wire)

@export var wire_id: int = -1

## All possible targets
var targets: Array = []
## Current target
var current_target

@export var display: String = "0"

var snap_threshold: int = 20


func _ready() -> void:
	targets = get_tree().get_nodes_in_group(Global_Stuff.WIRE_TARGET_GROUP)


func wire_connected(_object: Node2D, target: Node2D):# connected	
	print(self.name, "_connected:", target.name)
	connecting.emit(self, target)
	current_target = target

func wire_disconnected(_object: Node2D): # disconnected
	print(self.name, "_disconnected")
	if current_target != null:
		disconnecting.emit(self, current_target)
	current_target = null

func snap(object: Node2D):
	if !_check(object):
		return
	
	for target in targets:
		if self.position.distance_to(target.position) < snap_threshold and target.connected_wire == null:
			self.position = target.position
			wire_connected(object, target)
			break

func _check(object: Node2D):
	if object.get_parent() != self: return false
	else: return true
