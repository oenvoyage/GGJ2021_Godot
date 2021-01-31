extends Spatial

var ufos = []

func pop():
  var i = randi() % len(ufos)
  var l = ufos[i].duplicate()
  l.translation = $Spawner.translation
  l.set_mode(RigidBody.MODE_RIGID)
  l.visible = true
  $Spawner.add_child(l)
  return l.name

func _ready():
  for ufo in $TheUfo.get_children():
    ufo.set_mode(RigidBody.MODE_STATIC)
    ufo.visible = false
    ufos.append(ufo)
  
