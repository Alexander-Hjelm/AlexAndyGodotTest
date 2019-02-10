extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


# Public properties
export var speed = 10.0
export var sensitivity = 10.0

# Private properties
var animator
var camera

var rightDir = Vector3(1.0, 0.0, 0.0)
var upDir = Vector3(0.0, 1.0, 0.0)
var forwardDir = Vector3(0.0, 0.0, 1.0)

var lastMousePos = Vector2(0.0, 0.0)


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	animator = get_node("AnimationPlayer")
	animator.play("default")
	animator.playback_speed = 1
	
	lastMousePos = get_viewport().get_mouse_position()
	camera = get_child(0)
	

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	var AnimationState = "default"
	
	var vel = Vector3(0,0,0)
	
	# Charater movement
	if Input.is_action_pressed("ui_up"):
		vel += forwardDir
		AnimationState = "Running"
	if Input.is_action_pressed("ui_down"):
		vel -= forwardDir
		AnimationState = "Running"
	if Input.is_action_pressed("ui_left"):
		vel += rightDir
	if Input.is_action_pressed("ui_right"):
		vel -= rightDir



	vel = vel.normalized() * speed

	vel.y = linear_velocity.y

	print(vel.z)

	set_linear_velocity(vel)

	# Charater rotation
	var currentMousePos = get_viewport().get_mouse_position()
	if currentMousePos.x != lastMousePos.x:
		var newRotation = Vector3(get_rotation().x, deg2rad(sensitivity), get_rotation().z)
		set_rotation(newRotation)
		pass
		#transform.rotate_object_local(Vector3(1, 0, 0), PI)
#		transform.basis = transform.basis.rotated(Vector3(1, 0, 0), PI)
	lastMousePos = currentMousePos
	
	if animator.get_current_animation() != AnimationState:
		animator.play(AnimationState)

	pass