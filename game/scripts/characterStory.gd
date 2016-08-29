extends Label

var messages = [tr("CH1"), tr("CH2")]

var next_message = 0
onready var timer = get_node("Timer")

func _ready():
	set_text(messages[next_message])
	timer.start()
	timer.connect("timeout", self, "_next_message")

func _next_message():
	get_node("CharacterMessageAnimation").play("show")
	set_text(messages[next_message])
	next_message += 1
	if(_no_left_mesagges()):
		timer.stop()
	
func _no_left_mesagges():
	return next_message == messages.size()
	
func disable_messages():
	timer.stop()
	hide()

func enable_messages():
	if(_no_left_mesagges()):
		return
	
	timer.start()
	show()