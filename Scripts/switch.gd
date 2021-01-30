extends Spatial


func openLeft():
  $AnimationPlayer.play("Armature|OpeningLeft")

func closeLeft():
  $AnimationPlayer.play_backwards("Armature|OpeningLeft")

func openRight():
  $AnimationPlayer.play("Armature|OpeningRight")

func closeRight():
  $AnimationPlayer.play_backwards("Armature|OpeningRight")

