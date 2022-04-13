extends Node2D

signal nextPressed
signal backPressed

#Emite o sinal de que o botão para prosseguir do tutorial foi pressionado para a cena principal
func _on_ButtonNext_pressed():
	emit_signal("nextPressed")

#Emite o sinal de que o botão para voltar do tutorial foi pressionado para a cena principal
func _on_ButtonBack_pressed():
	emit_signal("backPressed")

