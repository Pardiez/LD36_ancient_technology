extends CanvasLayer

onready var label = get_node("Landmark/AnimationPlayer")
onready var spin_opacity = get_node("Spin/ShowAnimation")
onready var spin_animation = get_node("Spin/SpinAnimation")
	
func fade_in():
	label.play("show")
	spin_opacity.play("show")
	spin_animation.play("spin")
		
func fade_out():
	label.play("hide")
	spin_opacity.play("hide")