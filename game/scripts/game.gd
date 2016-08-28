extends Node2D

onready var tween = Tween.new()
onready var ship = get_node("ship")
onready var character_story = get_node("UICanvas/CharacterStory")
var cam 
const SHOW_MAP_DURATION = 2
const MAP_ZOOM = 20
const NORMAL_ZOOM = 2

const MODE_MAP = 0
const MODE_NORMAL = 1
var mode = MODE_NORMAL

onready var scripts = {
	"intro" : {
			"text": ["Tantos años viajando...", "En los logs de esta estacion indica que la tripulacion abandono hace siglos..."],		
			"next": get_node("SpaceStation2").get_pos()
	},
	"body" : {
			"text": ["Estos aliens tenian la formula de la eterna juventud"],	
			"next": get_node("SpaceStation3").get_pos()
	},
	"theend" : {
			"text": ["Vaya, aqui se acaba todo"],	
	} 
}

var history = {}

func _ready():
	get_node("Boundary").connect("body_enter",self,"_ship_body_enter")
		
	cam = ship.get_node("Camera2D")
	add_child(tween)
	
	var x = get_node("Boundary/CollisionShape2D").get_pos().x
	var y = get_node("Boundary/CollisionShape2D").get_pos().y
	get_node("Asteroids").generate(x, y)
	get_node("PropShips").generate(x, y)
	
	for station in get_tree().get_nodes_in_group("stations"):
		station.connect("body_enter",self, "_ship_enter_in_station")
		station.connect("body_exit",self, "_ship_exit_in_station")
	
	set_process_input(true)

func _ship_enter_in_station(body):
	if body.get_name() != 'ship':
		return
	character_story.disable_messages()

func _ship_exit_in_station(body):
	if body.get_name() != 'ship':
		return
	character_story.enable_messages()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if mode == MODE_NORMAL:
			mode = MODE_MAP
			_zoom_interpolation(MAP_ZOOM)
		else:
			mode = MODE_NORMAL
			_zoom_interpolation(NORMAL_ZOOM)

func _ship_body_enter(body):
	if body.get_name() != 'ship':
		return
	get_node("UICanvas/ZoneTitle").fade_in()

func _zoom_interpolation(zoom):
	tween.stop_all()
	tween.interpolate_method(cam,'change_zoom',cam.zoom_scale,zoom,SHOW_MAP_DURATION, tween.TRANS_LINEAR,tween.EASE_IN)
	tween.start()