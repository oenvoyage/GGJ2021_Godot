extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var exitNb = 1
var currentColorsInArrival = {"Gris" : [], "Jaune": [],"Mauve": [],"Turquois": [],"Vert": []}
var currentAlienColor = ""
const existingColors = ["Gris", "Jaune","Mauve","Turquois","Vert"]
const existingType = ["Ufo","Lug"]
const existingSpawnerID = ["Spawner1","Spawner2", "Spawner3"]

onready var score = get_tree().root.get_node("Main/Score")
onready var spawner = get_tree().root.get_node("Main/Convey/UFOSpawner%s" % exitNb)


func _on_Area_body_entered(body):
  var dict = getTags(body)
  if dict.empty():
    return
  var tag = dict["tag"]
  if dict["type"] == "Ufo":
    currentAlienColor = tag
    var bods = currentColorsInArrival[currentAlienColor]
    if currentAlienColor in currentColorsInArrival:       
        var b = bods.pop_back()
        if b != null:
          currentColorsInArrival[currentAlienColor] = bods
          destroyLuggage(b, bods)
  elif dict["type"] == "Lug":
    print_debug("luggage %s entered in exit nb: %s" % [dict, exitNb])
    print_debug("current status: currentAlienColor:'%s', currentColorsInArrival: '%s'" % [currentAlienColor,currentColorsInArrival])
    if currentAlienColor == "":
      return
    var bodies = currentColorsInArrival[currentAlienColor]
    if tag == currentAlienColor: # directly destroy the luggage
      destroyLuggage(body, bodies)
    else: # check the match because the current alien might have changed, or add the luggage
      if currentAlienColor in currentColorsInArrival:       
        var b = bodies.pop_back()
        if b != null:
          currentColorsInArrival[currentAlienColor] = bodies
          destroyLuggage(b, bodies)
        else:
          addLuggage(tag, body)
      else:
        addLuggage(tag, body)


func addLuggage(color, body):
  var bodies = currentColorsInArrival[color]
  bodies.push_front(body)
  currentColorsInArrival[color] = bodies
  score.addLuggage(exitNb)

func destroyLuggage(body, bodies):
  body.queue_free()
  score.removeLuggage(exitNb) 
  popNewAlien()

func popNewAlien():
  currentAlienColor = ""
  spawner.pop()

func getTags(body):
  var ret = {}
  if body.visible == false:
    print("Body not visible %s" % body.name)
    return ret
  if !(body is  RigidBody):
    return ret
  
  var type = null
  var tagValue = null
  var spawnerID = null
  var groups = body.get_groups()
  print_debug("Exit-%s: %s" % [exitNb,groups])
  for tag in groups:
    if (tag in existingType):
      type = tag
    elif (tag in existingColors):
      tagValue = tag
    elif (tag in existingSpawnerID):
      spawnerID = tag     
  if(type == "Ufo"):
    if !(spawnerID.ends_with(exitNb)):
      return ret
    else:
      ret = {"type" : type, "tag" : tagValue, "spawnerID" : spawnerID}
  else:
    ret = {"type" : type, "tag" : tagValue, "spawnerID" : exitNb}
    
  return ret
