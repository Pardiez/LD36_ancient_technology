extends CanvasLayer

onready var label = get_node("Scanning/ScanningPlayer")
onready var spin_opacity = get_node("Scanning/Spin/ShowAnimation")
onready var spin_animation = get_node("Scanning/Spin/SpinAnimation")
onready var text = get_node("Text/AnimationPlayer")
signal landmark_visited
	
var selected_text_index
var assigned_section
func set_script(section, script):
	assigned_section = section
	selected_text_index = (randi() % script.size()+1)
	text.set_text(script[selected_text_index])

func fade_in():
	label.play("scanning")
	spin_opacity.play("show")
	spin_animation.play("spin")
	text.play("show")
	emit_signal("landmark_visited", assigned_section, selected_text_index)
	
func fade_out():
	text.play("hide")