extends Node

signal entered

@export var camera: Camera3D
@export var ui_controls: Control

@export var room_number: int
@export var start_triggered: bool = false
@export var logging: bool = false

var scene_controller: Scene_Controller = SceneController
var logged: bool = false

func _ready() -> void:
	if start_triggered:
		room_entered()

func room_entered():
	scene_controller.set_current_camera(camera)
	camera.make_current()
	entered.emit()
	
	if !logging:
		return
	
	if !logged:
		ui_controls.next_log("log_"+str(room_number))
		logged = true
