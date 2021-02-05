extends Node

const CONVEYOR_WOBBLING_MAX = 42

var conveyor_speed: float = 0.5
var conveyor_speed_target: float = 1.0
var conveyor_wobbling: int = CONVEYOR_WOBBLING_MAX

var spawner_speed: float = 1

func conveyor_speed_set(speed: float):
  conveyor_speed_target = speed

func _conveyor_speed_update():
  $NoiseConveyor.pitch_scale = conveyor_speed
  for conveyor in get_tree().get_nodes_in_group("conveyors"):
    conveyor.speed_set(conveyor_speed)

func playBackGroundMusic():
  $Music.play()
  $NoiseConveyor.play()

func stopBackGroundMusic():
  $NoiseConveyor.stop()
  $Music.stop()

func switchOn(nb):
  match nb:
    1:
      switchOn_1()
    2:
      switchOn_2()
    3:
      switchOn_3()

func switchOff(nb):
  match nb:
    1:
      switchOff_1()
    2:
      switchOff_2()
    3:
      switchOff_3()

func switchOn_1():
  $SwitchOff1.stop()  
  $SwitchOn1.play()
  
  
func switchOff_1():
  $SwitchOn1.stop()  
  $SwitchOff1.play()

func switchOn_2():
  $SwitchOff2.stop()  
  $SwitchOn2.play()
  
func switchOff_2():
  $SwitchOn2.stop()  
  $SwitchOff2.play()

func switchOn_3():
  $SwitchOff3.stop()  
  $SwitchOn3.play()
  
func switchOff_3():
  $SwitchOn3.stop()  
  $SwitchOff3.play()

func playGameOver():
  print("")
  $MusicGameOver.play()
  
func playMenuMusic():
  $MusicMenu.play()

func stopMenuMusic():
  $MusicMenu.stop()

func _conveyor_wobbling():
  conveyor_wobbling -= 1
  if conveyor_wobbling == 0:
    conveyor_wobbling = randi() % CONVEYOR_WOBBLING_MAX
  var wobble = randf() / 100
  if randi() % 2 == 0:
    wobble = 0.0 - wobble
  $NoiseConveyor.pitch_scale = conveyor_speed + wobble

func _physics_process(_delta):
  pass
  _conveyor_wobbling()
  if conveyor_speed_target != conveyor_speed:
    if conveyor_speed < conveyor_speed_target:
      conveyor_speed += 0.01
    else:
      conveyor_speed -= 0.01
    _conveyor_speed_update()

