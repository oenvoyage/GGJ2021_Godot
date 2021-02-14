extends Node2D

var main = null

func _enter_tree():
  Events.connect("hud_current_luggage_set", self, "setCurrentLuggage")
  Events.connect("hud_max_luggage_set", self, "setMaxLuggage")
  Events.connect("hud_scored", self, "setScore")
  Events.connect("hud_gameover", self, "gameOver")
  
# Called when the node enters the scene tree for the first time.
func _ready():
  var button = get_node("Button")
  button.connect("pressed",main,"_on_GameOver")
  $GameOver.visible = false
  main = get_tree().root.find_node("Main", true, false)
  
func setCurrentLuggage(nb) -> void:
  $Score/WrongLuggagePanel/LabelCurrent/Current.text = str(nb)
  
func setMaxLuggage(nb) -> void:
  $Score/WrongLuggagePanel/LabelMax/Max.text = str(nb)
   
func setScore(score) -> void:
  $PointPanel/Point.text = str(score)
  
func gameOver() -> void:
  $GameOver.visible = true

func _on_Button_Load_Credits():
  get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_Button_Credits_End_pressed():
  get_tree().change_scene("res://Scenes/Welcome.tscn")

func _on_Button_Restart_Game():
  get_tree().paused = false
  get_tree().change_scene("res://Scenes/Game.tscn")

func _on_Button_ChangeView_pressed():
  main.get_node("Camera").switch_camera()
