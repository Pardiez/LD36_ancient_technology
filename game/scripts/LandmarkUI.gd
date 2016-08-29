extends CanvasLayer

onready var label = get_node("Scanning/ScanningPlayer")
onready var spin_opacity = get_node("Scanning/Spin/ShowAnimation")
onready var spin_animation = get_node("Scanning/Spin/SpinAnimation")
onready var text = get_node("Text/AnimationPlayer")
signal landmark_visited
	
var selected_script

func set_script(script_map):
	var keys = script_map.keys()
	selected_script = keys[(randi() % keys.size())]
	get_node("Text").set_text(script_map[selected_script])

func fade_in():
	label.play("scanning")
	spin_opacity.play("show")
	spin_animation.play("spin")
	text.play("show")
	emit_signal("landmark_visited", selected_script)
	
func fade_out():
	text.play("hide")