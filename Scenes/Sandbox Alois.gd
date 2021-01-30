extends Spatial

const RELEASE = 168

var release = RELEASE

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
  Universe.playBackGroundMusic()
  pass # Replace with function body.

func _physics_process(_delta):
	release -= 1
	if release == 0:
		var speed = Universe.conveyor_speed - 0.1
		if speed < 0.6:
		  speed = 1.618
		Universe.conveyor_speed_set(speed)
		print(Universe.conveyor_speed)
		release = RELEASE


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
