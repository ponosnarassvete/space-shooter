extends Control

@export var puzzle_window: TextureRect
@export var log_window: TextureRect
@export var logs: RichTextLabel
@export var FPS_label: FPS_Label

var opened_bottom: GlobalStuff.OPENED_UI_BOTTOM = GlobalStuff.OPENED_UI_BOTTOM.LOG_VIEW

func next_log(log_entry):
	print("new_log")
	logs.append_text(GlobalStuff.LOGS[log_entry])

func _on_wiring_button_pressed() -> void:
	pass # Replace with function body.

func _on_menu_button_pressed() -> void:
	SceneController.next_scene(GlobalStuff.MENU_SCENE)

func _on_swap_button_pressed() -> void:
	pass

func _on_activate_button_pressed() -> void:
	pass

func _on_logs_button_pressed() -> void:
	if opened_bottom == GlobalStuff.OPENED_UI_BOTTOM.PUZZLE_VIEW:
		opened_bottom = GlobalStuff.OPENED_UI_BOTTOM.LOG_VIEW
		_render_window()

func _on_puzzle_button_pressed() -> void:
	if opened_bottom == GlobalStuff.OPENED_UI_BOTTOM.LOG_VIEW:
		opened_bottom = GlobalStuff.OPENED_UI_BOTTOM.PUZZLE_VIEW
		_render_window()

func _render_window():
	match opened_bottom:
		GlobalStuff.OPENED_UI_BOTTOM.LOG_VIEW:
			puzzle_window.hide()
			log_window.show()
		GlobalStuff.OPENED_UI_BOTTOM.PUZZLE_VIEW:
			puzzle_window.show()
			log_window.hide()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug"):
		FPS_label.visible = true
