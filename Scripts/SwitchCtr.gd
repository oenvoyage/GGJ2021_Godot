extends Spatial


export var OnLeft : bool = false

var isClosed = true

# Called when the node enters the scene tree for the first time.
func _ready():
  pass
  #get_node("switch").closeLeft()


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
  var mouse_click = event as InputEventMouseButton
  if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
    if isClosed:
      get_node("switch").openLeft()
    else:
      get_node("switch").closeLeft()
    isClosed = !isClosed
  
