# Nó do pulmão. Controla atuação da Celinha, carcinógenos e células cancerosas.
extends Node2D

# Exporta cena do carcinógeno e da célula cancerosa como PackedScenes 
# para que elas possam ser instanciadas inúmeras vezes
export (PackedScene) var badMolecule

# Variáveis básicas para controle dos carcinógenos
var velocity = Vector2.ZERO 
var badMoleculeCounter = 0 
var rng = RandomNumberGenerator.new() # Cria gerador de números aleatórios
var THIS_ORGAN = Global.ORGANS.SKIN

# Randomiza a semente do gerador assim que o nó carrega
func _ready():
	rng.randomize()
	Input.set_custom_mouse_cursor(Global.organMouse, 0, Global.mouseHotspot)
	if Music.soundIsActive:
		Music.play_organ_music() # Começa música a ser tocada nos órgãos
	if Global.organsUnderAttack.has(THIS_ORGAN) and Global.textFinished:
		var loop = Global.organsUnderAttack[Global.ORGANS.SKIN]["carcinogens"] - \
		Global.organsUnderAttack[Global.ORGANS.SKIN]["spawned"] + \
		Global.organsUnderAttack[Global.ORGANS.SKIN]["leftover"]
		for i in loop:
			spawn()
			Global.organsUnderAttack[Global.ORGANS.SKIN]["leftover"] -= 1
		Global.organsUnderAttack[THIS_ORGAN]["inScene"] = true
		$SpawnTimer.start()

# Movimenta Celinha conforme função move_cell em script próprio.
func _physics_process(_delta):
	$Celinha.move_cell()
	if Global.organsUnderAttack.has(Global.ORGANS.SKIN) and \
	(Global.organsUnderAttack[THIS_ORGAN]['points'] >= Global.organsUnderAttack[THIS_ORGAN]['maxCarcinogens']):
		Global.organsUnderAttack.erase(Global.ORGANS.SKIN)
		Global.organsUnderAttack.erase(THIS_ORGAN)
		Global.attackHapenning -= 1
		if Global.attackHapenning == 0:
			Global.headlineText = ""
			Global.headlineVisibleCharacters = 0
			Global.textFinished = false
			Global.lastOrgan = "SKIN"
			Global.SpawnTimer.stop()
		Global.tree = get_tree().change_scene("res://Main.tscn")
		
# Função para criar carcinógenos toda vez que o timer se completar
func _on_SpawnTimer_timeout():
	Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] += 1
	if Global.organsUnderAttack.has(THIS_ORGAN):
		spawn()
		
# Se o botão voltar for pressionado, mudar a cena para a tela principal
func spawn():
	if Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] <= Global.organsUnderAttack[THIS_ORGAN]["maxCarcinogens"]:
		Global.organsUnderAttack[THIS_ORGAN]["spawned"] += 1
		var badMoleculeScene = badMolecule.instance() # Cria o carcinógeno
		var locationPoint = rng.randi_range(1, 7) # Sorteia ponto de spawning
		badMoleculeScene.organRigidBody = "SkinRigidBody"
		badMoleculeScene.organ = THIS_ORGAN
		# Escolhe um dentre oito pontos para gerar carcinógenos. Também sorteia a velocidade.
		if locationPoint == 1:
			badMoleculeScene.position = Vector2(210, 120)
			badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
		elif locationPoint == 2:
			badMoleculeScene.position = Vector2(460, 180)
			badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
		elif locationPoint == 3:
			badMoleculeScene.position = Vector2(710, 190)
			badMoleculeScene.velocity = Vector2(rand_range(20, 100), rand_range(-160, -70))
		elif locationPoint == 4:
			badMoleculeScene.position = Vector2(200, 240)
			badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
		elif locationPoint == 5:
			badMoleculeScene.position = Vector2(340, 490)
			badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-100, -20))
		elif locationPoint == 6:
			badMoleculeScene.position = Vector2(570, 530)
			badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
		elif locationPoint == 7:
			badMoleculeScene.position = Vector2(760, 410)
			badMoleculeScene.velocity = Vector2(rand_range(-160, -70), rand_range(160, 70))
		add_child(badMoleculeScene) # Adiciona o carcinógeno à árvore, fazendo-o aparecer na tela
		# Se cem carcinógenos forem criados, para o timer, o que impede que 
		# novos carcinógenos sejam criados
		if Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] >= Global.organsUnderAttack[THIS_ORGAN]["maxCarcinogens"]:
			$SpawnTimer.stop()
	
func _on_ReturnButton_pressed():
	Music.stop_organ_music() # Para a música
	if Global.organsUnderAttack.has(THIS_ORGAN):
		Global.organsUnderAttack[THIS_ORGAN]["inScene"] = false
		Global.organsUnderAttack[THIS_ORGAN]['leftover'] = get_tree().get_nodes_in_group("Carcinogens").size()
		if Global.organsUnderAttack[THIS_ORGAN]["spawned"] >= 5:
			Global.organsUnderAttack[THIS_ORGAN]["spawned"] = 5
			Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] = 5
	Global.tree = get_tree().change_scene("res://Main.tscn")
	
