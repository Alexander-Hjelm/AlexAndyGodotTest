extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var speed = 1
var animator

var lastMousePos = Vector2(0.0, 0.0)

var rightDir = Vector3(1.0, 0.0, 0.0)
var upDir = Vector3(0.0, 1.0, 0.0)
var forwardDir = Vector3(0.0, 0.0, 1.0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	animator = get_node("AnimationPlayer")
	animator.play("default")
	animator.playback_speed = 1
	
	lastMousePos = get_viewport().get_mouse_position()

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	var AnimationState = "default"
	var t = get_transform()
	
	if Input.is_action_pressed("ui_up"):
		t.origin -= forwardDir * delta * speed
		AnimationState = "Running"
	if Input.is_action_pressed("ui_down"):
		t.origin += forwardDir * delta * speed
		AnimationState = "Running"
	if Input.is_action_pressed("ui_left"):
		t.origin -= rightDir * delta * speed
	if Input.is_action_pressed("ui_right"):
		t.origin += rightDir * delta * speed	

	set_transform(t)
	
	if animator.get_current_animation() != AnimationState:
		animator.play(AnimationState)

	pass