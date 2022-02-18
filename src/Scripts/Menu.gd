extends Control

func _input(botao):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if botao.is_pressed():
		get_tree().change_scene("res://Cenas/Corpo.tscn")
#Quando um botão for clicado na tela de Menu, o jogador irá à tela de Corpo
