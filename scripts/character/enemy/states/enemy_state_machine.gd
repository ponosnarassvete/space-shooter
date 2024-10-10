class_name Enemy_State_Machine
extends Node

enum STATE{WANDERING, ATTACKING, DEAD}
var current_state = STATE.ATTACKING

#@export var test: Node
@export var states_node: Node
@export var wandering_state_node: Node
@export var attacking_state_node: Node
@export var dead_state_node: Node

func _ready() -> void:
	match current_state:
		STATE.WANDERING:
			change_state(wandering_state_node)
		STATE.ATTACKING:
			change_state(attacking_state_node)
		STATE.DEAD:
			change_state(dead_state_node)

func _process(_delta: float) -> void:
	pass#print("is it on? ",test.is_processing())

func change_state(new_state):
	tree_disable(states_node,true,false)
	states_node.set_process(true)
	tree_enable(new_state)

func tree_disable(node,process = true, physics = true):
	if process:
		node.set_process(false)  # Disable normal process
	if physics:
		node.set_physics_process(false)  # Disable physics process
		
	if node.get_children():
		for child in node.get_children():
			if child is Node:
				tree_disable(child)

func tree_enable(node,process = true, physics = true):
	if process:
		node.set_process(true)  # Enable normal process
	if physics:
		node.set_physics_process(true)  # Enable physics process
	if node.get_children():
		for child in node.get_children():
			if child is Node:
				tree_enable(child)
