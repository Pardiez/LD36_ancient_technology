extends Label

var messages = ["Ground Control to Major Tom",
"Take your protein pills and put your helmet on",
"Now it's time to leave the capsule if you dare",
"And I'm floating in a most peculiar way"]

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
	if(next_message == messages.size()):
		timer.stop()
	
	
	