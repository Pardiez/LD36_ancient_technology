extends Node2D


onready var tween = Tween.new()
onready var ship = get_node("ship")
var cam 
const SHOW_MAP_DURATION = 2
const MAP_ZOOM = 20
const NORMAL_ZOOM = 2

const MODE_MAP = 0
const MODE_NORMAL = 1
var mode = MODE_NORMAL

func _ready():
	get_node("Station").connect("exitStation",self,"_ship_exit_station")
	get_node("Station").connect("enterStation",self,"_ship_enter_station")
	get_node("Boundary").connect("body_enter",self,"_ship_body_enter")
	
	cam = ship.get_node("Camera2D")
	add_child(tween)
	
	ship.set_point(get_node("Station").get_pos())
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if mode == MODE_NORMAL:
			mode = MODE_MAP
			_zoom_interpolation(MAP_ZOOM)
		else:
			mode = MODE_NORMAL
			_zoom_interpolation(NORMAL_ZOOM)

func _ship_enter_station():
	get_node("UICanvas/Landmark").fade_in()

func _ship_exit_station():
	get_node("UICanvas/Landmark").fade_out()

func _ship_body_enter(body):
	if body.get_name() != 'ship':
		return
	get_node("UICanvas/ZoneTitle").fade_in()

func _zoom_interpolation(zoom):
	tween.stop_all()
	tween.interpolate_method(cam,'change_zoom',cam.zoom_scale,zoom,SHOW_MAP_DURATION, tween.TRANS_LINEAR,tween.EASE_IN)
	tween.start()