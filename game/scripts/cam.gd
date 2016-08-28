
extends Camera2D
const REF_HEIGHT = 1080
export var zoom_scale = 2

func _ready():
	get_viewport().connect("size_changed", self, "adjust_zoom")
	adjust_zoom()

func change_zoom(zoom):
	zoom_scale = zoom
	adjust_zoom()
	
func adjust_zoom():
	var screen = get_tree().get_root().get_rect().size
	var width = screen.x
	var height = screen.y
	var ratio = width / height
	var zoom_result = (REF_HEIGHT * ratio / width) * zoom_scale
	set_zoom( Vector2(zoom_result, zoom_result) )