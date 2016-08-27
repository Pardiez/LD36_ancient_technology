
extends Label


func _ready():
	pass

func fade_in():
	get_node("AnimationPlayer").play("show")

