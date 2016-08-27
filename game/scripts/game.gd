
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("Station").connect("enterStation",self,"_ship_enter_station")

func _ship_enter_station():
	get_node("CanvasLayer/CenterLabel").fade_in()

