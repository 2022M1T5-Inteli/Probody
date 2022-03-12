# Nó do carcinógeno. Controla a movimentação
extends KinematicBody2D

var velocity # Variável velocidade, a qual é referenciada no script Lungs.gd

# Função chamada em intervalos regulares para dar a impressão de movimento
func _physics_process(delta):
	# Movimenta o nó e salva as informações de uma possível colisão em uma variável
	var collisionInfo = move_and_collide(velocity * delta)
	if collisionInfo: # Se houver colisão
		# Faz os carcinógenos "quicarem" ao bater no pulmão, refletindo-se na normal da colisão
		velocity = velocity.bounce(collisionInfo.normal) 
	
