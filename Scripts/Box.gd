extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	set_translation(cast['position']) # Replace with function body.


func _on_Draggable_drag_start(node):
	print("Start dragging ...") # Replace with function body.


func _on_Draggable_drag_stop(node):
	print("Stop dragging...") # Replace with function body.
