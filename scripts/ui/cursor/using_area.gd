extends Area3D

@export var max_tool_distance: float = 5.0
@export var player: CharacterBody3D
@export var tool_use_area: Area2D

func _ready() -> void:
	if tool_use_area == null: tool_use_area = $Tool_Use_Area
	if player == null: player = $"../../3D_Viewport/SubViewport/Characters/Player_Node/Player"
	tool_layering()

func _input(_event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("tool_swap_1") or Input.is_action_just_pressed("tool_swap_2") or Input.is_action_just_pressed("tool_swap_3") or Input.is_action_just_pressed("tool_swap_4") or Input.is_action_just_pressed("tool_swap_down") or Input.is_action_just_pressed("tool_swap_up"):
		tool_layering()
	
	if Input.is_action_just_pressed("player_shoot"):
		var mouse_pos = get_viewport().get_mouse_position()
		if tool_use_area.get_viewport_rect().has_point(mouse_pos):
			print("target_list:", ToolManager.target_list)
			if self.global_position.distance_to(player.global_position) <= max_tool_distance and !ToolManager.target_list.is_empty():
				ToolManager.tool_used.emit(ToolManager.target_list[0], ToolManager.active_tool)
				print("tool_used_", GlobalEnums.TOOLS.find_key(ToolManager.active_tool))

func tool_layering():
	match ToolManager.active_tool:
		GlobalEnums.TOOLS.GRABBING_TOOL:
			self.collision_mask = 5
		GlobalEnums.TOOLS.REPAIRING_TOOL:
			self.collision_mask = 6
		GlobalEnums.TOOLS.HACKING_TOOL:
			self.collision_mask = 7
		GlobalEnums.TOOLS.ATTACKING_TOOL:
			self.collision_mask = 8
	print(self.name, "_collision_mask_", self.collision_mask)


func _on_area_entered(area: Area3D) -> void:
	ToolManager.target_list_add(area)


func _on_area_exited(area: Area3D) -> void:
	ToolManager.target_list_remove(area)
