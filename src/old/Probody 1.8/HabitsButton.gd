extends Area2D

signal habitsBoughtVisible

func _ready():
	$HabitsBoughtNode/HabitsBought.hide()


func _on_Area2D_mouse_entered():
	$HabitsBoughtNode/HabitsBought.show()
	emit_signal("habitsBoughtVisible")


func _on_Area2D_mouse_exited():
	$HabitsBoughtNode/HabitsBought.hide()
	emit_signal("habitsBoughtVisible")

