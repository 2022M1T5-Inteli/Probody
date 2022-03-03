# Nó da loja de hábitos. 
extends Node2D

# Troca a cena para a tela principal quando o botão VOLTAR é pressionado
func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Main.tscn")
