extends Node2D




# Leva o jogador à cena "Main" ao pressionar o botão de voltar
func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")
