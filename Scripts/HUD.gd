extends Node2D

var main = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_node("Button")
	main = get_tree().root.find_node("Main", true, false)
	button.connect("pressed",main,"_on_GameOver") 

func _on_Button_Load_Credits():
	get_tree().change_scene("res://Scenes/Credits.tscn")
	
func _on_Button_Credits_End_pressed():
	get_tree().change_scene("res://Scenes/Welcome.tscn")
	
func _on_Button_Restart_Game():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Game.tscn")
	
	


func _on_Button_ChangeView_pressed():
  main.get_node("Camera").switch_camera()
