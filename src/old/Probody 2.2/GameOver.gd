# Tela de gameover
extends Node2D

func _ready():
	# Para todas as músicas
	Music.stop_organ_music()
	Music.pause_regular_music()
	# Toca gameover
	Music.play_game_over()
	# Reinicia métricas
	Global.playerScore = 0
	Music.currentMusicSecond = 0
	Global.cancerCellIsGrowing = false
	Global.SpawnTimer.stop()
	Global.organsUnderAttack.clear()
	
	
