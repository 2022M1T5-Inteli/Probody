extends Node2D

onready var maxDistance = 14

#Função para que a o olho direito da Celinha se movam nas telas em que ela aparece
func _process(_delta):
	var mousePosition = get_local_mouse_position()
	var direction = Vector2.ZERO.direction_to(mousePosition)
	var distance = mousePosition.length()
	$RightPupilSprite.position = direction * min(distance, maxDistance)
