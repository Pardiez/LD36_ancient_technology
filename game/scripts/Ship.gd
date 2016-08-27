extends RigidBody2D

const ROTATE_SPEED = 3
const THROTTLE = 0.3
const VELOCITY_LIMIT = 100
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var rot = get_rot()
	var motion = Vector2()
	
	if (Input.is_action_pressed("ui_left")):
		rot = rot + ROTATE_SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		rot = rot - ROTATE_SPEED * delta
	if (Input.is_action_pressed("ui_up") && get_linear_velocity().y > -VELOCITY_LIMIT):
		apply_impulse(Vector2(get_pos().x,get_pos().y), Vector2 (0,-THROTTLE).rotated(get_rot()))
	if (Input.is_action_pressed("ui_down") && get_linear_velocity().y < VELOCITY_LIMIT):
		apply_impulse(Vector2(get_pos().x,get_pos().y), Vector2 (0,THROTTLE).rotated(get_rot()))	
	set_rot(rot)