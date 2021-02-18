extends Spatial

class_name Switch

export var OnLeft : bool = false

var isClosed = true

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
  var mouse_click = event as InputEventMouseButton
  if mouse_click and mouse_click.button_index == 1 and mouse_click.pressed:
    switch()
  
func switch():
  if isClosed:
    get_node("switch").openLeft()
  else:
    get_node("switch").closeLeft()
  isClosed = !isClosed

func closeSwitch():
   if !isClosed:
      get_node("switch").closeLeft()
      isClosed = true
