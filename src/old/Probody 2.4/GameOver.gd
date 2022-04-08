# Tela de gameover
extends Node2D

# Para todas as músicas que estiverem tocando e toca a música de game over
func _ready():
	Music.stop_organ_music()
	Music.pause_regular_music()
	Music.play_game_over()
	

	
	

# Roda uma função do global que reinicia todas as variáveis para começar o jogo do zero
func _on_RestartButton_pressed():
	Global.restart_game()
	Global.tree = get_tree().change_scene("res://Menu.tscn")
