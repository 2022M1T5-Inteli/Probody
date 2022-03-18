# Nó da Celinha
extends KinematicBody2D	

# Varíáveis de movimento
var velocity = Vector2.ZERO
var isMoving = true

# Controla o movimeno da célula
func move_cell(_organ):
	velocity = get_velocity()
	if velocity == Vector2.ZERO:
		$CelinhaAnimation.frame = 0 # Força célula a retornar à primeira frame ao parar
		$CelinhaAnimation.stop()
	else:
		$CelinhaAnimation.play()
	var _collision = move_and_collide(velocity)

func get_velocity():
	var direction = get_direction()
	if Input.is_action_pressed("shift"): # Aumenta velocidade ao pressionar shift
		return direction * 5.5
	else:
		return direction * 2.5

func get_direction():
	var direction = Vector2.ZERO
	if isMoving: # Seleciona direção conforme input do jogador
		if Input.is_action_pressed("ui_up"):
			direction += Vector2(0, -1)
		if Input.is_action_pressed("ui_down"):
			direction += Vector2(0, 1)
		if Input.is_action_pressed("ui_left"):
			direction += Vector2(-1, 0)
		if Input.is_action_pressed("ui_right"):
			direction += Vector2(1, 0)
	return direction.normalized() # Normaliza para considerar apenas direção do vetor

# Faz com que Celinha apareça e desapareça confrome clique no botão
func _on_CelinhaAppear_toggled(_button_pressed):
	if visible:
		visible = false
		layers = 2
		isMoving = false
		
	else:
		layers = 1
		visible = true
		isMoving = true
