extends Spatial

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
	
	# Charater movement
	if Input.is_action_pressed("ui_up"):
		transform = transform.translated(transform.basis.z * delta * speed)
		#transform.origin += transform.basis * delta * speed
		AnimationState = "Running"
	if Input.is_action_pressed("ui_down"):
		transform = transform.translated(-transform.basis.z * delta * speed)
		AnimationState = "Running"
	if Input.is_action_pressed("ui_left"):
		transform = transform.translated(transform.basis.x * delta * speed)
	if Input.is_action_pressed("ui_right"):
		transform = transform.translated(-transform.basis.x * delta * speed)

	# Charater rotation
	if currentMousePos != lastMousePos:
		var newRotation = get_rotation()
		var pitch = deg2rad(-Input.get_last_mouse_speed().y * delta * sensitivity)
		var yaw = deg2rad(-Input.get_last_mouse_speed().x * delta * sensitivity)
		transform.basis = transform.basis.rotated(transform.basis.y, yaw)
		pass
	lastMousePos = currentMousePos
	
	if animator.get_current_animation() != AnimationState:
		animator.play(AnimationState)

	pass