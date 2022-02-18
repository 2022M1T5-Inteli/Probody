extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Pulmao.tscn")
func _on_Button2_pressed():
	get_tree().change_scene("res://Cenas/Figado.tscn")
func _on_Button3_pressed():
	get_tree().change_scene("res://Cenas/Pele.tscn")
#Ao terem seus respectivos botões pressionados, leva o jogador às outras telas
