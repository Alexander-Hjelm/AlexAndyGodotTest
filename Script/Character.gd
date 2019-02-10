extends RigidBody

# Public properties
export var speed = 10.0
export var sensitivity = 1.0

# Private properties
var animator
var camera

var lastMousePos = Vector2(0.0, 0.0)

func _ready():
	animator = get_node("AnimationPlayer")
	animator.play("default")
	animator.playback_speed = 1
	
	lastMousePos = get_viewport().get_mouse_position()
	camera = get_child(0)
	

func _process(delta):
	
	var AnimationState = "default"
	
	var vel = Vector3(0,0,0)
	
	# Charater movement
	if Input.is_action_pressed("ui_up"):
		vel += transform.basis.z
		AnimationState = "Running"
	if Input.is_action_pressed("ui_down"):
		vel -= transform.basis.z
		AnimationState = "Running"
	if Input.is_action_pressed("ui_left"):
		vel += transform.basis.x
	if Input.is_action_pressed("ui_right"):
		vel -= transform.basis.x



	vel = vel.normalized() * speed

	vel.y = linear_velocity.y

	print(vel.z)

	set_linear_velocity(vel)

	# Charater rotation
	var currentMousePos = get_viewport().get_mouse_position()
	if currentMousePos != lastMousePos:
		var pitch = deg2rad(-Input.get_last_mouse_speed().y * delta * sensitivity)
		var yaw = deg2rad(-Input.get_last_mouse_speed().x * delta * sensitivity)
		transform.basis = transform.basis.rotated(transform.basis.y, yaw)
		pass
	lastMousePos = currentMousePos
	
	if animator.get_current_animation() != AnimationState:
		animator.play(AnimationState)

	pass