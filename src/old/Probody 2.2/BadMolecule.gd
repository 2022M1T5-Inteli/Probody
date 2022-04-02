# Nó do carcinógeno que pode ser tornar célula cancerosa.
extends KinematicBody2D

var velocity = Vector2.ZERO# Variável velocidade, a qual é referenciada no script Lungs.gd
# Sorteia um número de hits nas paredes do órgão para que uma célula cancerosa apareça
var maximumHitNumber = rand_range(4, 8) 
var currentHitNumber = 0
var moleculeColor = 1

var growingCounter = 0 # Conta o tamanho da célula cancerosa
var eatenByCelinha = false
var organ
var organRigidBody
var organscore
export (PackedScene) var cancerCell


func _ready():
	randomize() # randomiza semente do gerador de números aleatórios
	
# Função chamada em intervalos regulares para dar a impressão de movimento
func _physics_process(delta):
	# Movimenta o nó e salva as informações de uma possível colisão em uma variável
	var collisionInfo = move_and_collide(velocity * delta)
	if collisionInfo and collisionInfo.collider.name == organRigidBody: # Se houver colisão
		# Faz os carcinógenos "quicarem" ao bater no pulmão, refletindo-se na normal da colisão,
		# se o hit atual for menor do que o mínimo para um câncer começar
		if currentHitNumber < maximumHitNumber:
			velocity = velocity.bounce(collisionInfo.normal) 
			currentHitNumber += 1
		if currentHitNumber > maximumHitNumber: # Transforma carcinógeno em célula cancerosa
			# Troca layers para que células cancerosas sejam detectáveis à Celinha 
			collision_layer = 3
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
				$CollisionShapeAgainstWalls.scale.x *= 1.002
				$CollisionShapeAgainstWalls.scale.y *= 1.002
				$BadMoleculeImage.modulate = Color(moleculeColor, moleculeColor, 1, 1)
				moleculeColor *= 1.004
				growingCounter += 1
			else: # Traz game over caso a célula não seja destruída em tempo hábil
				Global.explosion = true
				var explosionTime = Timer.new()
				explosionTime.set_wait_time(0.02)
				explosionTime.set_one_shot(true)
				self.add_child(explosionTime)
				explosionTime.start()
				yield(explosionTime, "timeout")
				Input.set_custom_mouse_cursor(null) # Volta para o cursor original
				Global.tree = get_tree().change_scene("res://GameOver.tscn")
	
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	# Checa se alguma substância foi clicada com o mouse
	if currentHitNumber < maximumHitNumber and event is InputEventMouseButton and event.is_pressed():
		Music.play_point_sound() # Toca som de ponto
		Global.organsUnderAttack[organ]["points"] += 1
		Global.organsUnderAttack[organ]["leftover"] -= 1
		Global.organsUnderAttack[organ]["deathCounter"] += 1
		queue_free() # Deleta a substância que foi clicada
		# Reseta layers
		collision_layer = 3
		Global.change_score(1) # Aumenta um ponto
func _on_Area2D_body_entered(body):
	# Verifica se o corpo que tocou nele se chama "Celinha"
	if currentHitNumber > maximumHitNumber and body.name == "Celinha": 
		Music.play_point_sound()
		Global.organsUnderAttack[organ]["points"] += 1
		Global.organsUnderAttack[organ]["leftover"] -= 1
		Global.organsUnderAttack[organ]["deathCounter"] += 1
		queue_free()
		Global.change_score(1) # Aumenta um ponto
		eatenByCelinha = true
