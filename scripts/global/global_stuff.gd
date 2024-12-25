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

enum TOOLS {NONE, GRABBING_TOOL, REPAIRING_TOOL, HACKING_TOOL, ATTACKING_TOOL}
enum DAMAGE_TYPES {CLOSE_DAMAGE, RANGE_DAMAGE}
enum LAYERS {HIT_BOX_LAYER = 8}
