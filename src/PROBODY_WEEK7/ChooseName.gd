# Nó de escolha de nome
extends Node2D

func _process(delta):
	Global.chosenName = $Box/InsertNameBox.text # Manda o nome digitado para a Global.

# Troca a cena ao apertar o botão
func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")

func _input(event):
	if Input.is_action_pressed("ui_accept"): # Muda a cena com a tecla "enter".
		get_tree().change_scene("res://Main.tscn")
