extends Spatial

onready var anim = get_node("Sphere/DangerSign/AnimationPlayer")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(ev):
    if Input.is_action_just_pressed("ui_right"):
        print("K pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("DangerSignRotation")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
