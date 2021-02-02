extends Camera


# Declare member variables here. Examples:
var isCameraInHall = true
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# if event is InputEventKey and event.scancode == KEY_C:
	if event.is_action_pressed("ui_home"):
		switch_camera()

func switch_camera():
  if isCameraInHall == true:
    $AnimationPlayer.play("hall_to_belt")
    isCameraInHall = false
  else:
    $AnimationPlayer.play_backwards("hall_to_belt")
    isCameraInHall = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
