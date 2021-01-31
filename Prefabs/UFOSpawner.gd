extends Spatial

export var spawnerId = 1
var ufos = []
var currentUfo = null

func pop():
  if currentUfo != null:
    currentUfo.queue_free()
  var i = randi() % len(ufos)
  currentUfo = ufos[i].duplicate()
  currentUfo.translation = $Spawner.translation
  currentUfo.set_mode(RigidBody.MODE_RIGID)
  currentUfo.visible = true
  currentUfo.add_to_group("Spawner%s" % spawnerId)
  $Spawner.add_child(currentUfo)
  print_debug("Spawner %s spawning %s" % [spawnerId, currentUfo.name])
  return currentUfo.name

func _ready():
  for ufo in $TheUfo.get_children():
    ufo.set_mode(RigidBody.MODE_STATIC)
    ufo.visible = false
    ufos.append(ufo)
  
