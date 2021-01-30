extends Spatial


# Declare member variables here. Examples:
# var a = 2
var velocity = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity += 1
	if Input.is_action_pressed("ui_left"):
		velocity -= 1
	if Input.is_action_pressed("ui_down"):
		velocity += 1
		#$AnimationPlayer.play(
	if Input.is_action_pressed("ui_up"):
		velocity -= 1
