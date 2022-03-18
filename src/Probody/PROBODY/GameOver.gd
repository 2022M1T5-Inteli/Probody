extends Node2D

func _ready():
	Global.stop_organ_music()
	Global.pause_regular_music()
	Global.play_game_over()
	Global.playerScore = 0
	Global.currentMusicSecond = 0
	Global.currentAge = Global.age[0]
	Global.AgeTimer.start()
