extends Node2D

signal landmark_visited
onready var ui = get_node("UI")
onready var station = get_node("Station")

func _ready():
	add_to_group("landmarks")
	station.connect("exitStation",self,"_ship_exit_station")
	station.connect("enterStation",self,"_ship_enter_station")
	ui.connect("landmark_visited", self, "_landmark_visited")
				
	set_process_input(true)

func set_script(script_map):
	ui.set_script(script_map)

func _landmark_visited(text_code):
	emit_signal("landmark_visited", text_code)

func _ship_enter_station():
	ui.fade_in()

func _ship_exit_station():
	ui.fade_out()