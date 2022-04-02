extends Node2D

func _ready():
	Music.stop_organ_music()
	Music.pause_regular_music()
	$AudioStreamPlayer.play()
	# Reinicia métricas
	Global.SpawnTimer.stop()
	Global.organsUnderAttack.clear()
	




func _on_RestartButton_pressed():
	Global.restart_game()
	get_tree().change_scene("res://Menu.tscn")
