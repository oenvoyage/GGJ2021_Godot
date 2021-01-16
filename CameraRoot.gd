extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camController = get_node(".")
onready var isRotating = true
onready var speed = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isRotating == true:
		camController.rotate_y(deg2rad(speed))

func stopRotation():
	isRotating = false
	
func startRotation():
	isRotating = true
	

func setSpeedMax():
	$"../Control/Panel/HSlider".value = 3


func _on_HSlider_value_changed(value):
	print(" new value " + str(value))
	speed = (value * 3) - 1.5
