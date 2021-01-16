extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var anim = get_node("AnimationPlayer").get_animation("Armature|Idle")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	anim.set_loop(true)
	$AnimationPlayer.play("Armature|Idle")
	$AnimationPlayer.playback_speed = 10

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("Armature|Attack")
	if Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("Armature|Idle")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider2_value_changed(value):
	$AnimationPlayer.playback_speed = value
