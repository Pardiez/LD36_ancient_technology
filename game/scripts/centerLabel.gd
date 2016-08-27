extends Label

var animation

func _ready():
	animation = get_node("AnimationPlayer")

func fade_in():
	animation.play("show")
	
func fade_out():
	animation.play("hide")