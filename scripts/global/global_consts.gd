class_name Globals
extends Node

const CONNECTION_BOARD_GROUP = "Connection_Board"

const SAVE_FILE = "res://saves/save.txt"
const PUZZLE_SAVE_FILE = "res://saves/save.txt"
const PUZZLE_BOX_SCENE = "res://scenes/objects/puzzle_box_test.tscn"
const PUZZLE_SCENE = "res://scenes/objects/puzzle_test.tscn"
const RUBBISH_SCENE = "res://scenes/objects/base_rubbish.tscn"
const WIRE_SCENE = "res://scenes/objects/wire.tscn"
var PREVIOUS_SCENE = "res://scenes/test_scene_node.tscn"
const LEVEL_1_SCENE = "res://scenes/levels/tutorial/room_1.tscn"

enum TOOLS {NONE, GRABBING_TOOL, REPAIRING_TOOL, HACKING_TOOL, ATTACKING_TOOL}
enum DAMAGE_TYPES {CLOSE_DAMAGE, RANGE_DAMAGE}
enum LAYERS {HIT_BOX_LAYER = 8}
