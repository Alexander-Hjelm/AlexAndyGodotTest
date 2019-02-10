extends MeshInstance

# Public properties
export var speed = 10.0

# Private properties
var t
var camera

var rightDir = Vector3(1.0, 0.0, 0.0)
var upDir = Vector3(0.0, 1.0, 0.0)
var forwardDir = Vector3(0.0, 0.0, 1.0)

func _ready():
	t = get_transform()
	camera = get_child(0)
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
	set_transform(t)
	
	# Charater rotation
	
	pass