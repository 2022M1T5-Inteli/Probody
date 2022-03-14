# Nó do carcinógeno que pode ser tornar célula cancerosa.
extends KinematicBody2D

var velocity # Variável velocidade, a qual é referenciada no script Lungs.gd
# Sorteia um número de hits nas paredes do órgão para que uma célula cancerosa apareça
var maximumHitNumber = rand_range(4, 8) 
var currentHitNumber = 0

var growingCounter = 0 # Conta o tamanho da célula cancerosa
var eatenByCelinha = false


func _ready():
	randomize() # randomiza semente do gerador de números aleatórios
	
# Função chamada em intervalos regulares para dar a impressão de movimento
func _physics_process(delta):
	# Movimenta o nó e salva as informações de uma possível colisão em uma variável
	var collisionInfo = move_and_collide(velocity * delta)
	if collisionInfo and collisionInfo.collider.name == "LungsRigidBody": # Se houver colisão
		# Faz os carcinógenos "quicarem" ao bater no pulmão, refletindo-se na normal da colisão,
		# se o hit atual for menor do que o mínimo para um câncer começar
		if currentHitNumber < maximumHitNumber:
			velocity = velocity.bounce(collisionInfo.normal) 
			currentHitNumber += 1
		else: # Transforma carcinógeno em célula cancerosa
			# Troca layers para que células cancerosas sejam detectáveis à Celinha 
			# e não impeçam carcinógenos de se mover
			set_collision_layer_bit(4, true)
			set_collision_layer_bit(3, false)
			$BadMoleculeImage.texture = load("res://assets/cells/cancer_cell.png") 
			velocity = Vector2.ZERO
			if growingCounter < 500: # Aumenta célula cancerosa por certo período segundo um timer
				var growTime = Timer.new()
				growTime.set_wait_time(0.1)
				growTime.set_one_shot(true)
				self.add_child(growTime)
				growTime.start()
				yield(growTime, "timeout")
				$BadMoleculeImage.scale.x *= 1.002
				$BadMoleculeImage.scale.y *= 1.002
				$BadMoleculeCollisionShape2D.scale.x *= 1.002
				$BadMoleculeCollisionShape2D.scale.y *= 1.002
				$Area2D/ClickCollisionShape.scale.x *= 1.002
				$Area2D/ClickCollisionShape.scale.y *= 1.002
				growingCounter += 1
			elif not eatenByCelinha: # Traz game over caso a célula não seja destruída em tempo hábil
				get_tree().change_scene("res://GameOver.tscn")
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	# Checa se alguma substância foi clicada com o mouse
	if currentHitNumber < maximumHitNumber and event is InputEventMouseButton and event.is_pressed():
		queue_free() # Deleta a substância que foi clicada
		# Reseta layers
		set_collision_layer_bit(4, false) 
		set_collision_layer_bit(3, true)
		Global.change_score(1) # Aumenta um ponto

func _on_Area2D_body_entered(body):
	# Verifica se o corpo que tocou nele se chama "Celinha"
	if currentHitNumber > maximumHitNumber and body.name == ("Celinha"): 
		queue_free()
		Global.change_score(1) # Aumenta um ponto
		eatenByCelinha = true
