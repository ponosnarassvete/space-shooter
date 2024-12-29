class_name Global_Stuff
extends Node

const WIRE_TARGET_GROUP = "Target_Wire"
const INTERACTION_MANAGER_GROUP = "Interaction_Manager"
const HEALTH_BAR_GROUP = "Health_Bar"
const CAMERA_GROUP = "Camera"
const CURSOR_GROUP = "Cursor"
const TEMP_DUMP_GROUP = "Temp"

const SAVE_FILE = "res://saves/save.txt"

const TUTORIAL_LEVEL_SCENE = "res://scenes/levels/tutorial/tutorial.tscn"
var PREVIOUS_SCENE = "res://scenes/test_scene_node.tscn"
const MENU_SCENE = "res://scenes/ui/menu/menu_screen_scene_node.tscn"

const PUZZLE_SCENE = "res://scenes/objects/puzzle_test.tscn"
const BULLET_SCENE = "res://scenes/objects/bullet.tscn"
const ENEMY_SCENE = "res://scenes/characters/enemy_swarmer.tscn"

enum TOOLS {NONE, GRABBING_TOOL, REPAIRING_TOOL, HACKING_TOOL, ATTACKING_TOOL}
enum DAMAGE_TYPES {CLOSE_DAMAGE, RANGE_DAMAGE}
enum LAYERS {HIT_BOX_LAYER = 8}
enum OPENED_UI_BOTTOM {PUZZLE_VIEW, LOG_VIEW}

const LOGS: Dictionary = {"log_1": "
>[color=yellow]TASK 1[/color]:
[Movement on [color=white]WASD[/color]]
[[color=white]ALT[/color] to turn on the flashlight]", "log_2":"
>[color=yellow]TASK 2[/color]:
[[color=white]MMB[/color] changes your current tool]
[[color=white]WIRING_TOOL[/color] used to repair [color=white]ELECTRIC_BOX[/color]]
[[color=white]GRABBING_TOOL[/color] used to move wires inside [color=white]ELECTRIC_BOX[/color]]", "log_3":"
>[color=yellow]TASK 3[/color]:
[[color=white]DERELICTS[/color] are still being protected]
[[color=white]SWARMERS[/color] only appear when it's dark]"}
