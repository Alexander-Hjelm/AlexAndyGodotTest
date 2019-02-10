extends MeshInstance

# Public properties
export var speed = 10.0

# Private properties
var t
var camera

var lastMousePos = Vector2(0.0, 0.0)

var rightDir = Vector3(1.0, 0.0, 0.0)
var upDir = Vector3(0.0, 1.0, 0.0)
var forwardDir = Vector3(0.0, 0.0, 1.0)

func _ready():
	t = get_transform()
	camera = get_child(0)
	lastMousePos = get_viewport().get_mouse_position()
	pass

func _process(delta):
	
	# Charater movement
	t = get_transform()
	if Input.is_action_pressed("ui_up"):
		t.origin -= forwardDir * delta * speed
	if Input.is_action_pressed("ui_down"):
		t.origin += forwardDir * delta * speed
	if Input.is_action_pressed("ui_left"):
		t.origin -= rightDir * delta * speed
	if Input.is_action_pressed("ui_right"):
		t.origin += rightDir * delta * speed	
	
	# Charater rotation
	#var currentMousePos = get_viewport().get_mouse_position()
	#if currentMousePos != lastMousePos:
	#	t.rotated(upDir, PI/12)
	
	set_transform(t)
	pass