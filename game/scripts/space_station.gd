extends Area2D

export (Texture) var center_texture 
export (Texture) var arm_texture 

signal enterStation
var rotation = 0.1

func _ready():
	if center_texture != null:
		get_node("Sprites/centerSprite1").set_texture(center_texture)
		get_node("Sprites/centerSprite").set_texture(center_texture)
	if arm_texture != null:
		for arm in get_node("Sprites/Arms").get_children():
			arm.set_texture(arm_texture)
	
	connect("body_enter",self,"_send_signal")
	set_fixed_process(true)

func _fixed_process(delta):
	rotate(rotation*delta)

func _send_signal(body):
	if body.get_name() != 'ship':
		return
	emit_signal("enterStation")
