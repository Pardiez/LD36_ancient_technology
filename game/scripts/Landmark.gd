extends Node2D

func _ready():
	get_node("Station").connect("exitStation",self,"_ship_exit_station")
	get_node("Station").connect("enterStation",self,"_ship_enter_station")
		
	set_process_input(true)

func _ship_enter_station():
	get_node("UICanvas/Landmark").fade_in()
	get_node("UICanvas/Spin").fade_in()

func _ship_exit_station():
	get_node("UICanvas/Landmark").fade_out()
	get_node("UICanvas/Spin").fade_out()