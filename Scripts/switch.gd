extends Spatial


func openLeft():
  $AnimationPlayer.play("Armature|OpeningLeft")
  Universe.switchOn()

func closeLeft():
  $AnimationPlayer.play_backwards("Armature|OpeningLeft")
  Universe.switchOff()

func openRight():
  $AnimationPlayer.play("Armature|OpeningRight")
  Universe.switchOn()

func closeRight():
  $AnimationPlayer.play_backwards("Armature|OpeningRight")
  Universe.switchOff()

