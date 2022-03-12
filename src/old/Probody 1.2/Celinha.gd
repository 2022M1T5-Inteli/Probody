# Nó da célula. Como o movimento da Celinha é dependente de colisões que, por sua vez, são
# dependentes de cada órgão, todo o script de movimento é reescrito nos scritpts de cada órgão, 
# sob sugestão do Victor.
extends KinematicBody2D	
var velocity = Vector2.ZERO

func get_movement():
	var direction = get_direction()
	if Input.is_action_pressed("shift"):
		return direction * 5.5
	else:
		return direction * 2.5

func get_direction():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)
	return direction.normalized()
	
func move_cell(organ):
	velocity = get_movement()
	if velocity == Vector2.ZERO:
		$CelinhaAnimation.frame = 0
		$CelinhaAnimation.stop()
	else:
		$CelinhaAnimation.play()
	var collision = move_and_collide(velocity)
# Checa se houve uma colisão contra algum objeto exceto o pulmão. Se sim, deleta o objeto 
# colidido (carcinógeno) da árvore.
	if collision and collision.collider != organ:
		instance_from_id(collision.collider_id).queue_free()
		Global.change_score(1) # Aumenta um ponto
