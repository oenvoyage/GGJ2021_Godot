extends Node2D

var main = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_node("Button")
	main = get_tree().root.find_node("Main", true, false)
	button.connect("pressed",main,"_on_GameOver") 

func _on_GameOver_input_event(viewport, event, shape_idx):
  print("restart...")
  if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.pressed:
     main._on_GameOver()
