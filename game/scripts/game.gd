
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("Station").connect("enterStation",self,"_ship_enter_station")
	get_node("Boundary").connect("body_enter",self,"_ship_body_enter")

func _ship_enter_station():
	get_node("UICanvas/CenterLabel").fade_in()

func _ship_body_enter(body):
	if body.get_name() != 'ship':
		return
	get_node("UICanvas/ZoneTitle").fade_in()