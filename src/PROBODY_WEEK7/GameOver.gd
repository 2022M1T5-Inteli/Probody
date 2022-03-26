# Tela de gameover
extends Node2D

func _ready():
	# Para todas as músicas
	Global.stop_organ_music()
	Global.pause_regular_music()
	# Toca gameover
	Global.play_game_over()
	# Reinicia métricas
	Global.playerScore = 0
	Global.currentMusicSecond = 0
	Global.currentAge = Global.age[0]
	Global.AgeTimer.start()
