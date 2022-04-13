extends Node2D

# Pausa outras músicas e toca a de vitória ao ganhar o jogo
func _ready():
	Music.stop_organ_music()
	Music.pause_regular_music()
	$AudioStreamPlayer.play()
	# Reinicia métricas
	Global.SpawnTimer.stop()
	Global.organsUnderAttack.clear()
	get_tree().paused = false

# Retorna o jogador para a cena inicial e reinicia o jogo
func _on_RestartButton_pressed():
	print("restartbutton pressed")
	Global.restart_game()
	Global.tree = get_tree().change_scene("res://scenes/Menu.tscn")
