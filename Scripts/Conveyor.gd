extends Spatial

var steps = []

func speed_set(speed):
  $AnimationPlayer.playback_speed = speed

func _ready():
  for node in get_children():
    if node.name.begins_with("Step"):
      steps.append(node)

  var tmpl = steps[0]
  for i in range(1, len(steps)):
    for node in tmpl.get_children():
      steps[i].add_child(node.duplicate())

  $AnimationPlayer.get_animation("Scene").set_loop(true)
  speed_set(Universe.conveyor_speed)
  $AnimationPlayer.play("Scene")
