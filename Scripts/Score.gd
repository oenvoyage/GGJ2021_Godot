extends Spatial

onready var scoreNode = get_node("../HUD/Score/Current")
onready var pointNode = get_node("../HUD/PointPanel/Point")
onready var maxNode = get_node("../HUD/Score/Max")
onready var gameOverNode = get_node("../HUD/GameOver")
onready var main = get_tree().root.find_node("Main", true, false)

var score = 0
var maxScore = 1
var point = 0
var UFOs = []
var notGameOver = true

# Called when the node enters the scene tree for the first time.
func _ready():
  score = 0
  UFOs.append(get_node("../Convey/UFOSpawner1"))
  UFOs.append(get_node("../Convey/UFOSpawner2")) 
  UFOs.append(get_node("../Convey/UFOSpawner3"))    
  gameOverNode.visible = false
  
func addLuggage(nb):
  score += 1

func removeLuggage(nb):
  if score > 0 :
    score -= 1
  UFOs[nb-1].pop()

func matched():
  point += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  scoreNode.text = score as String
  maxNode.text = maxScore as String
  pointNode.text = point as String
  if score > maxScore and notGameOver:
    onGameOver()

func onGameOver():
  notGameOver = false
  get_tree().paused = true
  Universe.stopBackGroundMusic()
  Universe.playGameOver()
  gameOverNode.visible = true

func _on_Timer_timeout():
  score += 1
