extends RigidBody2D

const ROTATE_SPEED = 3
var THROTTLE = 10
var SPEED_LIMIT

func _ready():
	SPEED_LIMIT = 500 #bug initializing above?
	set_fixed_process(true)
	
func _fixed_process(delta):
	input_rotation(delta)
	input_throttle(delta)
		
func input_throttle(delta):
	if (Input.is_action_pressed("ui_up")):
		impulse(THROTTLE*delta, get_rot())
	if (Input.is_action_pressed("ui_down")):
		impulse(-THROTTLE*delta, get_rot())
		
func input_rotation(delta):
	var rot = get_rot()
	if (Input.is_action_pressed("ui_left")):
		rot = rot + ROTATE_SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		rot = rot - ROTATE_SPEED * delta
	set_rot(rot)
		
func impulse(throttle, rot):
	if (get_linear_velocity().length() > SPEED_LIMIT):
    	set_linear_velocity(get_linear_velocity().normalized()*(SPEED_LIMIT-1))
	else: 
		apply_impulse(Vector2(0,0), Vector2(0, -throttle).rotated(rot))