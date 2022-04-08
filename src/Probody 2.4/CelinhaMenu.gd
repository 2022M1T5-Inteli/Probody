# Nó que controla o movimento da Celinha no menu principal
extends KinematicBody2D

# Define velocidade escalar e direção
onready var speed = 8
onready var direction = Vector2(15, 15)

# Determina velocidade vetorial (velocidade escalar x direção) e movimenta Celinha de acordo]
# Verifica se houve colisão, e caso tenha tido colisão, faz a Celinha rebater
func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.normal)
