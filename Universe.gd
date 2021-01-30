extends Node

func _ready():
  pass


func playBackGroundMusic():
	$AudioStreamPlayer.play()
	
func stopBackGroundMusic():
	$AudioStreamPlayer.stop()
	
