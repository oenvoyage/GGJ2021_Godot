extends Spatial

var luggages = []

func pop():
  var i = randi() % len(luggages)
  var l = luggages[i].duplicate()
  l.translation = $Spawner.translation
  l.set_mode(RigidBody.MODE_RIGID)
  l.visible = true
  $Spawner.add_child(l)
  return l.name

func _ready():
  for luggage in $Luggages.get_children():
    luggage.set_mode(RigidBody.MODE_STATIC)
    luggage.visible = false
    luggages.append(luggage)
