extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
  deferedInitialisationOn(0.2)
  onEnterScene()	

func onEnterScene():
  pass

func onExitScene():
  Universe.stopBackGroundMusic()

func _on_GameOver():
  Universe.playGameOver()
  self.onExitScene()
  get_tree().change_scene("res://Scenes/Welcome.tscn")

func deferedInitialisationOn(t):
  yield(get_tree().create_timer(t), "timeout")
  Universe.playBackGroundMusic()
