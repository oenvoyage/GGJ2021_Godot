extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	deferedInitialisationOn(1.0)
	
	
func onEnterScene():
	Universe.playBackGroundMusic()

func onExitScene():
	Universe.stopBackGroundMusic()
	
func _on_GameOver():
	self.onExitScene()
	get_tree().change_scene("res://Scenes/Welcome.tscn")

func deferedInitialisationOn(t):
	yield(get_tree().create_timer(t), "timeout")
	onEnterScene()
