extends Area

export var exitNb = 1
var currentColorsInArrival = {"Gris" : [], "Jaune": [],"Mauve": [],"Turquois": [],"Vert": []}
var currentAlienColor = ""
const existingColors = ["Gris", "Jaune","Mauve","Turquois","Vert"]
const existingType = ["Ufo","Lug"]
const existingSpawnerID = ["Spawner1","Spawner2", "Spawner3"]


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
          Events.emit_signal("luggage_Matched")
          Events.emit_signal("luggage_removed", exitNb)
          destroyLuggage(b, bods)
  elif dict["type"] == "Lug":
    print_debug("luggage %s entered in exit nb: %s" % [dict, exitNb])
    print_debug("current status: currentAlienColor:'%s', currentColorsInArrival: '%s'" % [currentAlienColor,currentColorsInArrival])
    if currentAlienColor == "":
      return
    var bodies = currentColorsInArrival[currentAlienColor]
    if tag == currentAlienColor:
      Events.emit_signal("luggage_Matched")
      destroyLuggage(body, bodies)
    else: # check the match because the current alien might have changed, or add the luggage
      if currentAlienColor in currentColorsInArrival:       
        var b = bodies.pop_back()
        if b != null:
          currentColorsInArrival[currentAlienColor] = bodies
          Events.emit_signal("luggage_removed")          
          Events.emit_signal("luggage_Matched")          
          destroyLuggage(b, bodies)
        else:
          addLuggage(tag, body)
      else:
        addLuggage(tag, body)


func addLuggage(color, body):
  var bodies = currentColorsInArrival[color]
  bodies.push_front(body)
  currentColorsInArrival[color] = bodies
  Events.emit_signal("luggage_added")  

func destroyLuggage(body, bodies):
  body.queue_free() 
  popNewAlien()

func popNewAlien():
  currentAlienColor = ""
  Events.emit_signal("ufo_spawned_exit%s" % exitNb)

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
