# Nó da Celinha
extends KinematicBody2D	

# Varíáveis de movimento
var velocity = Vector2.ZERO
var isMoving = true

# Controla o movimento da Celinha, definindo a velocidade e coordenando a animação
func move_cell():
	velocity = get_velocity()
	if velocity == Vector2.ZERO:
		$CelinhaAnimation.frame = 0 # Força célula a retornar à primeira frame ao parar
		$CelinhaAnimation.stop()
	else:
		$CelinhaAnimation.play()
	Global.tree = move_and_collide(velocity) # Faz movimento
	
# Define velocidade a partir da direção multiplicada pelo valor escalar da velocidade.
func get_velocity():
	var direction = get_direction()
	if Input.is_action_pressed("shift"): # Ao pressionar shift, aumenta a velocidade
		return direction * 5.5
	else:
		return direction * 2.5

# Define direção do movimento a partir das teclas apertadas pelo jogador
func get_direction():
	var direction = Vector2.ZERO
	if isMoving:
		if Input.is_key_pressed(KEY_W):
			direction += Vector2(0, -1)
		if Input.is_key_pressed(KEY_S):
			direction += Vector2(0, 1)
		if Input.is_key_pressed(KEY_A):
			direction += Vector2(-1, 0)
		if Input.is_key_pressed(KEY_D):
			direction += Vector2(1, 0)
	return direction.normalized() # Normaliza para considerar apenas direção do vetor
