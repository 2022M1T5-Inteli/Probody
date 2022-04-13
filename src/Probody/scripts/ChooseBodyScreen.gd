# Nó da tela de seleção de sexo. Troca a variável global 'gender' de acordo com a seleção do jogador.
extends Node2D

func _on_female_pressed():
	Global.gender = "female"
	Global.tree = get_tree().change_scene("res://scenes/ChooseName.tscn")

func _on_male_pressed():
	Global.gender = "male"
	Global.tree = get_tree().change_scene("res://scenes/ChooseName.tscn")
