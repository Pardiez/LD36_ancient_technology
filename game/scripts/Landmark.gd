extends Node2D

signal landmark_visited
signal landmark_message_hide
onready var ui = get_node("UI")
onready var station = get_node("Station")
var timer 

func _ready():
	add_to_group("landmarks")
	station.connect("exitStation",self,"_ship_exit_station")
	station.connect("enterStation",self,"_ship_enter_station")
	ui.connect("landmark_visited", self, "_landmark_visited")
	
	timer = Timer.new()
	timer.set_wait_time(10)
	add_child(timer)
	set_process_input(true)

func set_text(text_map):
	ui.set_text(text_map)

func _landmark_visited(text_code):
	emit_signal("landmark_visited", text_code)

func _ship_enter_station():
	randomize()
	get_node("SamplePlayer2D").play("melody_0"+str(floor(rand_range(1, 2))))
	ui.fade_in()

func _ship_exit_station():
	timer.start()
	yield(timer,"timeout")
	emit_signal("landmark_message_hide")
	ui.fade_out()