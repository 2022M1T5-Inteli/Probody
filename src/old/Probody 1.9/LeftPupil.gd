# Nó que faz o olho esquerdo da Celinha seguir o mouse
extends Node2D

# Raio máximo de movimento
onready var maxDistance = 14

# A cada iteração, troque a posição da sprite de pupila segundo um vetor que 
# indica o comprimento e a direção do movimento do mouse. 
func _process(_delta):
	var mousePosition = get_local_mouse_position()
	var direction = Vector2.ZERO.direction_to(mousePosition)
	var distance = mousePosition.length()
	# Se a distância for maior do que a distância máxima, use maxDistance.
	$LeftPupilSprite.position = direction * min(distance, maxDistance)
