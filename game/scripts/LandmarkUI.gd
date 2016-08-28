extends CanvasLayer

onready var label = get_node("Scanning/ScanningPlayer")
onready var spin_opacity = get_node("Scanning/Spin/ShowAnimation")
onready var spin_animation = get_node("Scanning/Spin/SpinAnimation")
onready var text = get_node("Text/AnimationPlayer")
	
func fade_in():
	label.play("scanning")
	spin_opacity.play("show")
	spin_animation.play("spin")
	text.play("show")
	
func fade_out():
	text.play("hide")