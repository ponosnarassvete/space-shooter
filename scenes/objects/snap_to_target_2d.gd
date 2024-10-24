extends Node2D

# Set the list of target positions
var target_positions = []  # Store target (endpoint) positions

# Called when the node enters the scene
func _ready():
	# Assume the nodes named "Target" are the endpoints
	for child in get_parent().get_children():
		if child.name == "Target":
			target_positions.append(child.position)  # Collect target positions (endpoints)

# Call this function when dragging ends (you can hook this into your reusable dragging node)
func on_drag_end(wire_node: Node2D):
	var snap_threshold = 20  # Distance threshold for snapping

	# Check if the wire is near any target position
	for target_pos in target_positions:
		if wire_node.position.distance_to(target_pos) < snap_threshold:
			wire_node.position = target_pos  # Snap the wire to the target
			break
