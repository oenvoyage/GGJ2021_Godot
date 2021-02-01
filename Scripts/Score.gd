extends Spatial

var score = 0
var maxScore = 2
var scoreNode = null
var maxNode = null
var gameOver = null
var UFOs = []

# Called when the node enters the scene tree for the first time.
func _ready():
  score = 0
  scoreNode = get_node("../HUD/Score/Current")
  maxNode = get_node("../HUD/Score/Max")
  gameOver = get_node("../HUD/GameOver")
  UFOs.append(get_node("../Convey/UFOSpawner1"))
  UFOs.append(get_node("../Convey/UFOSpawner2")) 
  UFOs.append(get_node("../Convey/UFOSpawner3"))    
  gameOver.visible = false
  
func addLuggage(nb):
  score += 1

func removeLuggage(nb):
  if score > 0 :
    score -= 1
  UFOs[nb-1].pop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  scoreNode.text = score as String
  maxNode.text = maxScore as String
  if score > maxScore:
    onGameOver()

func onGameOver():
  pass
#  gameOver.visible = true

func _on_Timer_timeout():
  score += 1
