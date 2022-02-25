extends StaticBody2D

func _on_Area2D_body_entered(body):
	visible = false
	position.x = 999999
	position.y = 999999
#Ao ter sua forma de colisão invadida por outro corpo, faz a Nitrosamina tornar-se invisível e a envia para longe
