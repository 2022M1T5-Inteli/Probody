extends Control


func _on_Start_pressed():
	Global.tree = get_tree().change_scene("res://choose_body.tscn")

func _on_Exit_pressed():
	get_tree().quit()


