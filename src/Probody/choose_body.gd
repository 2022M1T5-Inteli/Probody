extends Node2D

func _on_female_pressed():
	Global.tree = get_tree().change_scene("res://Main.tscn")


func _on_male_pressed():
	Global.gender = 1
	Global.tree = get_tree().change_scene("res://Main.tscn")
