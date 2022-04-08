# Nó do menu
extends Control

# Inicia música e garante que o som esteja ativado
func _ready():
	Music.soundIsActive = true
	Music.play_regular_music()
	
# Troca cena ao apertar start
func _on_Start_pressed():
	Global.tree = get_tree().change_scene("res://ChooseBodyScreen.tscn")

# Sai do jogo
func _on_Exit_pressed():
	get_tree().quit()


