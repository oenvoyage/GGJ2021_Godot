extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
  get_node("Curve_NE_Back/curve_belt_elements").speed_set(-Universe.conveyor_speed)
  get_node("Curve_NE_Front/curve_belt_elements").speed_set(-Universe.conveyor_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
