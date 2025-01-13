class_name Interaction_Area_3D
extends Area3D

signal got_ready
signal not_ready

@export_category("Interactable")
@export var action_name: String = "Interact"
@export var manager: Interaction_Manager
@export var ready_for_interaction: bool = true

@export_category("Outline")
@export var interactable_mesh: Array[MeshInstance3D]
@export var outline_hull_color: Color = Color.WHITE
@export_range(0, 16, 0.01) var outline_grow_amount: float = 0.02

var outline_material: StandardMaterial3D

var interact: Callable = func():
	pass

func _ready() -> void:
	if manager == null: manager = get_tree().get_first_node_in_group("Interaction_Manager")
	
	match ready_for_interaction:
		true:
			got_ready.emit()
		false:
			not_ready.emit()
		

func get_ready_for_interaction():
	if !ready_for_interaction:
		got_ready.emit()
	ready_for_interaction = true

func disable_interaction():
	if ready_for_interaction:
		not_ready.emit()
	ready_for_interaction = false


func _on_body_entered(_body):
	print(self.name, "_registered_by_", _body.name)
	_apply_outline_shader()
	manager.register_area(self)

func _on_body_exited(_body):
	print(self.name, "_unregistered_by_", _body.name)
	_remove_outline_shader()
	manager.unregister_area(self)

func _apply_outline_shader() -> void:
	for mesh in interactable_mesh:
		if mesh:
			if not outline_material:
				outline_material = StandardMaterial3D.new()
				outline_material.grow = true
				outline_material.blend_mode = BaseMaterial3D.BLEND_MODE_PREMULT_ALPHA
				outline_material.cull_mode = BaseMaterial3D.CULL_FRONT
				outline_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
				
			outline_material.albedo_color = outline_hull_color
			outline_material.grow_amount = outline_grow_amount
			mesh.material_overlay = outline_material

func _remove_outline_shader() -> void:
	for mesh in interactable_mesh:
		if mesh:
			mesh.material_overlay = null
