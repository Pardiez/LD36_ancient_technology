extends RigidBody2D

const ROTATE_SPEED = 3
var THROTTLE = 100
const SPEED_LIMIT = 1000
var arrow_pointer
onready var arrow = get_node('arrow')
onready var bump_timer = get_node("BumpTimer")
var bumped = false

func _ready():
	bump_timer.connect("timeout", self, "_disable_bump")
	set_fixed_process(true)

func _fixed_process(delta):
	_input_rotation(delta)
	_input_throttle(delta)
	_update_arrow()

func _input_throttle(delta):
	if(bumped == true):
		return
	
	if (Input.is_action_pressed("ui_up")):
		_impulse(THROTTLE*delta, get_rot())
	if (Input.is_action_pressed("ui_down")):
		_impulse(-THROTTLE*delta, get_rot())

func _input_rotation(delta):
	var rot = get_rot()
	if (Input.is_action_pressed("ui_left")):
		rot = rot + ROTATE_SPEED * delta
	if (Input.is_action_pressed("ui_right")):
		rot = rot - ROTATE_SPEED * delta
	set_rot(rot)

func _impulse(throttle, rot):
	if (get_linear_velocity().length() > SPEED_LIMIT):
    	set_linear_velocity(get_linear_velocity().normalized()*(SPEED_LIMIT-1))
	else:
		apply_impulse(Vector2(0,0), Vector2(0, -throttle).rotated(rot))

func bump(throttle, rot):
	bumped = true
	bump_timer.start()
	apply_impulse(Vector2(0,0), Vector2(0, -throttle).rotated(rot))

func _disable_bump():
	bumped = false
	bump_timer.stop()

func set_radar(pos):
	arrow.set_opacity(1)
	arrow_pointer = pos
	
func hide_radar():
	arrow_pointer = null

func _update_arrow():
	if(arrow_pointer == null):
		arrow.set_opacity(0)
		return

	arrow.look_at(arrow_pointer)
	arrow.set_rotd(arrow.get_rotd() + 180)
