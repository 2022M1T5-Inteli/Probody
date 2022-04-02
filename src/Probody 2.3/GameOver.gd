# Tela de gameover
extends Node2D

func _ready():
	# Para todas as músicas
	Music.stop_organ_music()
	Music.pause_regular_music()
	# Toca gameover
	Music.play_game_over()
	# Reinicia métricas
	

	
	


func _on_RestartButton_pressed():
	Global.restart_game()
	get_tree().change_scene("res://Main.tscn")
