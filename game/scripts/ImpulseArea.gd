extends Area2D

export var IMPULSE_THROTTLE = 5

func _ready():
	connect("body_enter", self, "_on_Area2D_area_enter")
	
func _on_Area2D_area_enter(body):
	print(get_rot())
	body.impulse(IMPULSE_THROTTLE, get_rot())

