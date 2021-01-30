extends Spatial

var cubes = []

func _ready():
  for m in get_children():
    if m.name.begins_with("Mesh"):
      for cube in m.get_children():
        cubes.append(cube)
    
  var tmpl = cubes[0]
  for i in range(1, len(cubes)):
    for node in tmpl.get_children():
      cubes[i].add_child(node.duplicate())
  
  $AnimationPlayer.get_animation("Scene").set_loop(true)
  $AnimationPlayer.play("Scene")
