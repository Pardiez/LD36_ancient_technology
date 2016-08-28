extends Label

onready var animation = get_node("AnimationPlayer")

func _ready():
	pass
	
func fade_in():
	animation.play("show")
	
func fade_out():
	animation.play("hide")