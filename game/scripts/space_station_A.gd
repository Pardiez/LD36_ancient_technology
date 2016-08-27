extends KinematicBody2D

export (Texture) var center_texture 
export (Texture) var arm_texture 
var rotation = 0.2

func _ready():
	if center_texture != null:
		get_node("CollisionPolygon2D/Sprites/centerSprite1").set_texture(center_texture)
		get_node("CollisionPolygon2D/Sprites/centerSprite1").set_texture(center_texture)
	if arm_texture != null:
		for arm in get_node("CollisionPolygon2D/Sprites/Arms").get_children():
			arm.set_texture(arm_texture)
	set_fixed_process(true)

func _fixed_process(delta):
	rotate(rotation*delta)


