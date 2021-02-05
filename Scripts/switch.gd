extends Spatial

export var switch_nb = 1

func openLeft():
  $AnimationPlayer.play("Armature|OpeningLeft")
  Universe.switchOn(switch_nb)

func closeLeft():
  $AnimationPlayer.play_backwards("Armature|OpeningLeft")
  Universe.switchOff(switch_nb)

func openRight():
  $AnimationPlayer.play("Armature|OpeningRight")
  Universe.switchOn(switch_nb)

func closeRight():
  $AnimationPlayer.play_backwards("Armature|OpeningRight")
  Universe.switchOff(switch_nb)

