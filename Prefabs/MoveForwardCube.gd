extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = self.transform
	t.origin += t.basis.z * speed * delta
	self.transform = t
