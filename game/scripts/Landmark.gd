extends Node2D

func _ready():
	get_node("Station").connect("exitStation",self,"_ship_exit_station")
	get_node("Station").connect("enterStation",self,"_ship_enter_station")
		
	set_process_input(true)

func _ship_enter_station():
	get_node("UI").fade_in()

func _ship_exit_station():
	get_node("UI").fade_out()