extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_node("Button")
	var main = get_tree().root.get_node("Main")
	button.connect("pressed",main,"_on_GameOver") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
