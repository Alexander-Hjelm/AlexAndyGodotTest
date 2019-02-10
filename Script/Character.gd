extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var speed = 1
var animator

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	animator = get_node("AnimationPlayer")
	animator.play("default")
	animator.playback_speed = 1

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	var AnimationState = "default"
	var t = get_transform()
	
	if Input.is_action_pressed("ui_up"):
		t.origin += Vector3(0,0,speed*delta)
		AnimationState = "Running"
	set_transform(t)
	
	if animator.get_current_animation() != AnimationState:
		animator.play(AnimationState)
		