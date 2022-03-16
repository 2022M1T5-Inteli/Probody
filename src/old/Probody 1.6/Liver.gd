# Nó do pulmão. Controla atuação da Celinha, carcinógenos e células cancerosas.
extends Node2D

# Exporta cena do carcinógeno e da célula cancerosa como PackedScenes 
# para que elas possam ser instanciadas inúmeras vezes
export (PackedScene) var cancerCell
export (PackedScene) var badMolecule

# Variáveis básicas para controle dos carcinógenos
var velocity = Vector2.ZERO 
var badMoleculeCounter = 0 
var rng = RandomNumberGenerator.new() # Cria gerador de números aleatórios

# Randomiza a semente do gerador assim que o nó carrega
func _ready():
	rng.randomize()
	Global.play_organ_music() # Começa música a ser tocada nos órgãos

# Movimenta Celinha conforme função move_cell em script próprio e impede que ela saia do pulmão.
func _physics_process(delta):
	$Celinha.move_cell($LiverRigidBody)
	
# Função para criar carcinógenos toda vez que o timer se completar
func _on_SpawnTimer_timeout():
	badMoleculeCounter += 1
	var badMoleculeScene = badMolecule.instance() # Cria o carcinógeno
	var locationPoint = rng.randi_range(1, 8) 
	badMoleculeScene.organ = "LiverRigidBody"
	# Escolhe um dentre oito pontos para gerar carcinógenos. Também sorteia a velocidade.
	if locationPoint == 1:
		badMoleculeScene.position = Vector2(713, 150)
		badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
	elif locationPoint == 2:
		badMoleculeScene.position = Vector2(216, 497)
		badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
	elif locationPoint == 3:
		badMoleculeScene.position = Vector2(826, 165)
		badMoleculeScene.velocity = Vector2(rand_range(20, 100), rand_range(-160, -70))
	elif locationPoint == 4:
		badMoleculeScene.position = Vector2(186, 344)
		badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
	elif locationPoint == 5:
		badMoleculeScene.position = Vector2(489, 384)
		badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-100, -20))
	elif locationPoint == 6:
		badMoleculeScene.position = Vector2(306, 147)
		badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
	elif locationPoint == 7:
		badMoleculeScene.position = Vector2(643, 334)
		badMoleculeScene.velocity = Vector2(rand_range(-160, -70), rand_range(160, 70))
	elif locationPoint == 8:
		badMoleculeScene.position = Vector2(510, 128)
		badMoleculeScene.velocity = Vector2(rand_range(-160, -70), rand_range(-160, -70))
	add_child(badMoleculeScene) # Adiciona o carcinógeno à árvore, fazendo-o aparecer na tela
	# Se cem carcinógenos forem criados, para o timer, o que impede que 
	# novos carcinógenos sejam criados
	if badMoleculeCounter >= 100:
		$SpawnTimer.stop()

# Se o botão voltar for pressionado, mudar a cena para a tela principal
func _on_ReturnButton_pressed():
	Global.stop_organ_music() # Para a música
	get_tree().change_scene("res://Main.tscn")
	
