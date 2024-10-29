class_name Energy_Wires
extends Sprite2D

signal pulse

@export var energy_par: Energy_Parameters
@export var active_group_name: String = "Active"
var connection: Callable

@export var activated: bool = false
var connected: bool = false

func _ready() -> void:
	if energy_par:
		activated = true

func _process(delta: float) -> void:	
	if activated and connected:
		pulse.emit(self)


func wire_connected():# connected to target
	connected = true
	if activated:
		pulse.emit(self)
		add_to_group(active_group_name)

func wire_disconnected():
	connected = false
	#print("huh")
	remove_from_group(active_group_name)
	if get_connection() != null and pulse != null:
		pulse.disconnect(get_connection())


func set_connection(new_connection: Callable):
	connection = new_connection

func get_connection():
	#print(connection)
	return connection


func set_energy(new_energy: Energy_Parameters):
	energy_par = new_energy

func get_energy():
	return energy_par
