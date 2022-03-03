extends Node2D


func _physics_process(delta):
	$Celinha.move_cell($LiverRigidBody)



func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Main.tscn")
