extends Node2D


func _on_Button_pressed():
	Global.chosenName = $Box/InsertNameBox.text
	Global.ageTimerRunning = true
	Global.tree = get_tree().change_scene("res://Main.tscn")

func _input(_event):
	if Input.is_action_pressed("ui_accept"): # Muda a cena com a tecla "enter".
		Global.ageTimerRunning = true
		Global.tree = get_tree().change_scene("res://Main.tscn")
