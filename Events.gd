extends Node

signal luggage_Matched()
func emit_luggage_Matched() -> void:
  emit_signal("luggage_Matched")
  
signal luggage_removed(exit_Nb)
func emit_luggage_removed(exit_Nb : int) -> void:
  emit_signal("luggage_removed", exit_Nb)

signal luggage_added()
func emit_luggage_added() -> void:
  emit_signal("luggage_added")
  
signal ufo_spawned_exit1()
signal ufo_spawned_exit2()
signal ufo_spawned_exit3()

func emit_ufo_spawned_exit(exitNb : int) -> void:
  emit_signal("ufo_spawned_exit%s" % exitNb)
  

signal hud_max_luggage_set(nb)
func emit_hud_max_luggage_set(nb : int) -> void:
  emit_signal("hud_max_luggage_set" , nb)
  
signal hud_current_luggage_set(nb)
func emit_hud_current_luggage_set(nb : int) -> void:
  emit_signal("hud_current_luggage_set" , nb)

signal hud_scored(score)
func emit_hud_scored(score : int) -> void:
  emit_signal("hud_scored" , score)
  
signal hud_gameover()
func emit_hud_gameover() -> void:
  emit_signal("hud_gameover")
