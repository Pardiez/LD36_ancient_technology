extends Sprite
var show_animation 
var spin_animation

func _ready():
	show_animation = get_node("ShowAnimation")
	spin_animation = get_node("SpinAnimation")

func fade_in():
	show_animation.play("show")
	spin_animation.play("spin")
			
func fade_out():
	show_animation.play("hide")