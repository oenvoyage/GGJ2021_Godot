extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = null
export var exitNb = 1
var currentColors = []
var existingColors = ["Gris", "Jaune","Mauve","Turquois","Vert"]
var existingType = ["Ufo","Lug"]

# Called when the node enters the scene tree for the first time.
func _ready():
  score = get_tree().root.get_node("Main/Score") # Replace with function body.

func _on_Area_body_entered(body):
  if body.visible == false:
    print("Body not visible %s" % body.name)
    pass
  if !(body is  RigidBody):
    pass
  var isLug = false
  for tag in body.get_groups():
    if (tag in existingType) and (tag == "Lug"):
      isLug = true
      print("Got Luggage")
    elif (tag in existingType) and (tag == "Ufo"):
      print("Got Ufo Body")
      for t in body.get_groups():
        if t in existingColors:
          print("Ufo and color ...")
          currentColors.append(t)
          print(currentColors)
        
  if body is RigidBody && "Blue" in body.name:
    print("Luggage '%s' Match" % body.name)
    body.queue_free()
    score.removeLuggage(exitNb)
  elif body is RigidBody:
    score.addLuggage(exitNb)
