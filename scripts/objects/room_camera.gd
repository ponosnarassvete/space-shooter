extends Camera3D

@export var scene_contoller: Scene_Controller

func become_current():
	make_current()
	scene_contoller.set_current_camera(self)
