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
    var rigid =  luggage.get_node("RigidBody")
    rigid.set_mode(RigidBody.MODE_STATIC)
    rigid.visible = false
    luggages.append(rigid)
  $Timer.wait_time = Universe.spawner_speed
  
