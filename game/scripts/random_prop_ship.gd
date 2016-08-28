extends RigidBody2D

const SPEED_LIMIT = 100

func _ready():
	set_rotd(randi() % 360)
	set_process(true)

func _process(delta):
	if (get_linear_velocity().length() > SPEED_LIMIT):
    	set_linear_velocity(get_linear_velocity().normalized()*(SPEED_LIMIT-1))
	else:
		randomize()
		apply_impulse(Vector2(0,0), Vector2((randi() % 5) * rand_range(-1, 1), (randi() % 7)) * rand_range(-1, 1))