extends Spatial

var score = 0
var maxScore = 2
var scoreNode = null
var maxNode = null
var gameOver = null

# Called when the node enters the scene tree for the first time.
func _ready():
  score = 0
  scoreNode = get_node("../HUD/Score/Current")
  maxNode = get_node("../HUD/Score/Max")
  gameOver = get_node("../HUD/GameOver")
  gameOver.visible = false
  
func addLuggage():
  score += 1

func removeLuggage():
  if score > 0:
    score -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  scoreNode.text = score as String
  maxNode.text = maxScore as String
  if score > maxScore:
    onGameOver()

func onGameOver():
  gameOver.visible = true

func _on_Timer_timeout():
  score += 1
