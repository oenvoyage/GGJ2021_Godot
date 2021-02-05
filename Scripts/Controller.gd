extends Spatial


onready var switch_1 = get_node("Switch_S_1")
onready var switch_2 = get_node("Switch_S_2")
onready var switch_3 = get_node("Switch_S_3")



# Called when the node enters the scene tree for the first time.
func _ready():
  get_node("Curve_NE_Back/curve_belt_elements").speed_set(-Universe.conveyor_speed)
  get_node("Curve_NE_Front/curve_belt_elements").speed_set(-Universe.conveyor_speed)
  get_node("Curve_NW_Back/curve_belt_elements").speed_set(-Universe.conveyor_speed)
  get_node("Curve_NW_Front/curve_belt_elements").speed_set(-Universe.conveyor_speed)
  
func _input(event):
  if event.is_action_pressed("switch1"):
    switch_1.switch()
  elif event.is_action_pressed("switch2"):
    switch_2.switch()
  elif event.is_action_pressed("switch3"):
    switch_3.switch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
