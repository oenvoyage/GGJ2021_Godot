extends Spatial


var currentLuggage = 0
var maxLuggage = 10
var point = 0
var UFOs = []
var notGameOver = true

func _enter_tree():
  Events.connect("luggage_added", self,"addLuggage")
  Events.connect("luggage_removed", self,"removeLuggage")
  Events.connect("luggage_Matched", self, "matched")
  
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  Events.emit_hud_max_luggage_set(maxLuggage)
  Events.emit_hud_current_luggage_set(currentLuggage)
  
func addLuggage() -> void:
  setCurrentLuggage(currentLuggage + 1)

func removeLuggage(nb) -> void:
  if currentLuggage > 0 :
    setCurrentLuggage(currentLuggage - 1)

func setCurrentLuggage(value) -> void:
  currentLuggage = value
  Events.emit_hud_current_luggage_set(currentLuggage)

func matched():
  point += 1
  Events.emit_hud_scored(point)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  if currentLuggage > maxLuggage and notGameOver:
    onGameOver()

func onGameOver():
  notGameOver = false
  get_tree().paused = true
  Universe.stopBackGroundMusic()
  Universe.playGameOver()
  Events.emit_hud_gameover()
