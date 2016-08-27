extends Node2D

func _ready():
	get_node("Station").connect("exitStation",self,"_ship_exit_station")
	get_node("Station").connect("enterStation",self,"_ship_enter_station")
	get_node("Boundary").connect("body_enter",self,"_ship_body_enter")

func _ship_enter_station():
	get_node("UICanvas/Landmark").fade_in()

func _ship_exit_station():
	get_node("UICanvas/Landmark").fade_out()

func _ship_body_enter(body):
	if body.get_name() != 'ship':
		return
	get_node("UICanvas/ZoneTitle").fade_in()