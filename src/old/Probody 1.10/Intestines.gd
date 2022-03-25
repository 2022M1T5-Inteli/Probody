# Nó do pulmão. Controla atuação da Celinha, carcinógenos e células cancerosas.
extends Node2D

# Variáveis básicas para controle dos carcinógenos
export (PackedScene) var badMolecule # Carrega cena de carcinógenos/células cancerosas
var velocity = Vector2.ZERO 
var badMoleculeCounter = 0 
var rng = RandomNumberGenerator.new() # Cria gerador de números aleatórios

# Randomiza a semente do gerador assim que o nó carrega
func _ready():
	rng.randomize()
	if Global.soundIsActive:
		Global.play_organ_music() # Começa música a ser tocada nos órgãos se o som estiver ativo

# Movimenta Celinha conforme função move_cell em script próprio
func _physics_process(_delta):
	$Celinha.move_cell()
	
# Função para criar carcinógenos toda vez que o timer se completar
func _on_SpawnTimer_timeout():
	badMoleculeCounter += 1
	var badMoleculeScene = badMolecule.instance() # Cria o carcinógeno
	var locationPoint = rng.randi_range(1, 8) # Sorteia ponto de spawning
	badMoleculeScene.organ = "IntestinesRigidBody" # Informa órgão ao script do carcinógeno 
	# para que ele quique nas paredes
	# Seleciona um dentre oito pontos para gerar carcinógenos. Também sorteia a velocidade.
	if locationPoint == 1:
		badMoleculeScene.position = $Position1.position
		badMoleculeScene.velocity = Vector2(rand_range(20, 100), rand_range(20, 100))
	elif locationPoint == 2:
		badMoleculeScene.position = $Position2.position
		badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
	elif locationPoint == 3:
		badMoleculeScene.position = $Position3.position
		badMoleculeScene.velocity = Vector2(rand_range(20, 100), rand_range(-160, -70))
	elif locationPoint == 4:
		badMoleculeScene.position = $Position4.position
		badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
	elif locationPoint == 5:
		badMoleculeScene.position = $Position5.position
		badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-100, -20))
	elif locationPoint == 6:
		badMoleculeScene.position = $Position6.position
		badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
	elif locationPoint == 7:
		badMoleculeScene.position = $Position7.position
		badMoleculeScene.velocity = Vector2(rand_range(-160, -70), rand_range(160, 70))
	elif locationPoint == 8:
		badMoleculeScene.position = $Position8.position
		badMoleculeScene.velocity = Vector2(rand_range(-160, -70), rand_range(-160, -70))
	add_child(badMoleculeScene) # Adiciona o carcinógeno à árvore, fazendo-o aparecer na tela
	# Se 10 carcinógenos forem criados, para o timer
	if badMoleculeCounter >= 10:
		$SpawnTimer.stop()

# Se o botão voltar for pressionado, muda a cena para a tela principal
func _on_ReturnButton_pressed():
	Global.stop_organ_music() # Para a música
	Global.tree = get_tree().change_scene("res://Main.tscn")
