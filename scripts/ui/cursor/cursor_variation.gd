extends Node

@export var sprite: AnimatedSprite2D

@export var is_active: bool = true

func _ready() -> void:
	if is_active:
		if sprite == null: sprite = $"../Cursor_Sprite"
	
		ToolManager.tool_swapped.connect(tool_swap)

func tool_swap():
	match ToolManager.active_tool:
		GlobalEnums.TOOLS.GRABBING_TOOL:
			sprite.animation = "grabber"
		GlobalEnums.TOOLS.REPAIRING_TOOL:
			sprite.animation = "repairer"
		GlobalEnums.TOOLS.HACKING_TOOL:
			sprite.animation = "hacker"
		GlobalEnums.TOOLS.ATTACKING_TOOL:
			sprite.animation = "attacker"
