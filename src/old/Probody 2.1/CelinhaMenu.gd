# Nó que controla o movimento da Celinha no menu principal
extends KinematicBody2D

# Define velocidade escalar e direção
onready var speed = 8
onready var direction = Vector2(15, 15)

# Determina velocidade vetorial (velocidade escalar x direção) e movimenta Celinha de acordo
func _physics_process(delta):
	# Guarda informações de uma colisão, caso ela ocorra
	var collision = move_and_collide(direction * speed * delta)
	if collision:
	# Se houver colisão, reflita a direção do movimento  na normal (bounce)
		direction = direction.bounce(collision.normal)
