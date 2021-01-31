extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = null

# Called when the node enters the scene tree for the first time.
func _ready():
  score = get_tree().root.get_node("Main/Score") # Replace with function body.

func _on_Area_body_entered(body):
  if body is RigidBody:
    print("Luggage '%s' entered" % body.name)
    body.queue_free()
    score.addLuggage()
