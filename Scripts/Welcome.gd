extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
  Universe.playMenuMusic()
  get_tree().paused = false

func _on_Next_Scene():
  Universe.stopMenuMusic()
  get_tree().change_scene("res://Scenes/Game.tscn")

func _show_credits():
	get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_quit_game():
		get_tree().quit()

