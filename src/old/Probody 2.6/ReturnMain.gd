extends Button


# Retorna para a cena "Main"
func _on_ReturnMain_pressed():
	Global.tree = get_tree().change_scene("res://Main.tscn")
	Global.ageIndex = 0
