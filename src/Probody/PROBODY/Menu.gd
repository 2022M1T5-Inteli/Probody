extends Control

func _ready():
	Global.soundIsActive = true
	Global.play_regular_music()
	print(Global.soundIsActive)
	
func _on_Start_pressed():
	Global.tree = get_tree().change_scene("res://choose_body.tscn")

func _on_Exit_pressed():
	get_tree().quit()


