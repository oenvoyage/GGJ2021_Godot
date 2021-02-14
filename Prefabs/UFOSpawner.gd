extends Spatial

export var spawnerId = 1
var ufos = []
var currentUfo = null
var rng = RandomNumberGenerator.new()

func pop():
  if currentUfo != null:
    currentUfo.queue_free()
  var i = randi() % len(ufos)
  currentUfo = ufos[i].duplicate()
  currentUfo.translation = $Spawner.translation
  currentUfo.set_mode(RigidBody.MODE_RIGID)
  currentUfo.visible = true
  var animation = currentUfo.get_node("Alien/AnimationPlayer") 
  var animList = animation.get_animation_list()
  for animName in animList:
    if "Circle_animation" in  animName:
        animation.get_animation(animName).set_loop(false)
        animation.stop()
    elif "tictac_animation" in  animName:
        var anim = animation.get_animation(animName)
        anim.set_loop(true)
        animation.set_speed_scale(rng.randi_range(5,20))
        animation.play(animName)
  currentUfo.add_to_group("Spawner%s" % spawnerId)
  $Spawner.add_child(currentUfo)
  print_debug("Spawner %s spawning %s" % [spawnerId, currentUfo.name])
  return currentUfo.name

func _ready():
  Events.connect("ufo_spawned_exit%s" % spawnerId,self, "pop")
  for ufo in $TheUfo.get_children():
    ufo.set_mode(RigidBody.MODE_STATIC)
    ufo.visible = false
    ufos.append(ufo)
  
