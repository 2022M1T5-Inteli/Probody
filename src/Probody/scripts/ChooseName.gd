extends Node2D



# Possibilita que o código seja acionado ao pressionar "Enter"
func _input(_event):
	if Input.is_action_pressed("ui_accept"):
		Global.ageTimerRunning = true
		Global.tree = get_tree().change_scene("res://scenes/Main.tscn")


# Muda a veriável de nome da com base no que o jogador escolher
func _on_Button_pressed():
	Global.chosenName = $BoxContainer/InsertNameBox.text
	Global.ageTimerRunning = true
	Global.tree = get_tree().change_scene("res://scenes/Main.tscn")
