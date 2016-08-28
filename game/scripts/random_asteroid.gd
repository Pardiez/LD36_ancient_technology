extends Sprite

var speed = 10

func _ready():
	set_rotd(randi() % 360)
	speed = (randi() % 50) + 10
	set_process(true)

func _process(delta):
	set_rotd(get_rotd() + speed * delta)