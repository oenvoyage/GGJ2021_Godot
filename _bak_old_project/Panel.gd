extends Panel
var life = 1

func _ready():
	get_node("Button").connect("pressed",self,"_on_Button_pressed")

	

func _on_Button_pressed():
	life += 1
	
	

func _on_Button2_pressed():
	pass # Replace with function body.
	#lab.text = "HELLLO remaining life : " + str(life) 
