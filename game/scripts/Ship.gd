extends KinematicBody2D

const ROTATE_SPEED = 3

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var rot = get_rot()
	
	if (Input.is_action_pressed("ui_left")):
		rot = rot + ROTATE_SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		rot = rot - ROTATE_SPEED * delta
		
	set_rot(rot)