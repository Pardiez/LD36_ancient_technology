extends Area2D

export var IMPULSE_THROTTLE = 5
onready var sprite = get_node("Sprite")

func _ready():
	connect("body_enter", self, "_on_Area2D_area_enter")


func set_direction(pos):
	look_at(pos)
	set_rotd(get_rotd() + 180)
	

	
func _on_Area2D_area_enter(body):
	body.bump(IMPULSE_THROTTLE, get_rot())

	
