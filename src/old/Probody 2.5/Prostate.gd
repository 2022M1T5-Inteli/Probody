# Nó da próstata. Controla atuação da Celinha, carcinógenos e células cancerosas.
extends Node2D

# Exporta cena do carcinógeno e da célula cancerosa como PackedScene
export (PackedScene) var badMolecule

# Variáveis básicas para controle dos carcinógenos
var velocity = Vector2.ZERO 
var badMoleculeCounter = 0 
var rng = RandomNumberGenerator.new() # Cria gerador de números aleatórios
var THIS_ORGAN = Global.ORGANS.PROSTATE

# Randomiza a semente do gerador assim que o nó carrega
func _ready():
	rng.randomize()
		 # Muda o cursor original pelo do metabolismo e o hotspot fica no centro.
	Input.set_custom_mouse_cursor(Global.organMouse, 0, Global.mouseHotspot)
	if Music.soundIsActive:
		Music.play_organ_music() # Começa música a ser tocada nos órgãos
	if Global.organsUnderAttack.has(THIS_ORGAN) and Global.textFinished:
		var loop = Global.organsUnderAttack[Global.ORGANS.PROSTATE]["carcinogens"] - \
		Global.organsUnderAttack[Global.ORGANS.PROSTATE]["spawned"] + \
		Global.organsUnderAttack[Global.ORGANS.PROSTATE]["leftover"]
		for i in loop:
			spawn()
			Global.organsUnderAttack[Global.ORGANS.PROSTATE]["leftover"] -= 1
		Global.organsUnderAttack[THIS_ORGAN]["inScene"] = true
		$SpawnTimer.start()

# Movimenta Celinha conforme função move_cell em script próprio e impede que ela saia do pulmão.
func _physics_process(_delta):
	$Celinha.move_cell()
	if Global.organsUnderAttack.has(Global.ORGANS.PROSTATE) and \
	(Global.organsUnderAttack[THIS_ORGAN]['points'] >= Global.organsUnderAttack[THIS_ORGAN]['maxCarcinogens']):
		Global.organsUnderAttack.erase(THIS_ORGAN)
		Global.attackHapenning -= 1
		if Global.attackHapenning == 0:
			Global.headlineText = ""
			Global.headlineVisibleCharacters = 0
			Global.textFinished = false
			Global.lastOrgan = "PROSTATE"
			Global.SpawnTimer.stop()
		Global.tree = get_tree().change_scene("res://Main.tscn")
		
# Função para criar carcinógenos toda vez que o timer se completar
func _on_SpawnTimer_timeout():
	if Global.organsUnderAttack.has(THIS_ORGAN):
		Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] += 1
		spawn()
		
func spawn():
	if Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] <= Global.organsUnderAttack[THIS_ORGAN]["maxCarcinogens"]:
		Global.organsUnderAttack[THIS_ORGAN]["spawned"] += 1
		var badMoleculeScene = badMolecule.instance() # Cria o carcinógeno
		var locationPoint = rng.randi_range(1, 7) # Sorteia ponto de spawning
		badMoleculeScene.organRigidBody = "ProstateStaticBody2D"
		badMoleculeScene.organ = THIS_ORGAN
		match locationPoint:
			1:
				badMoleculeScene.position = $ProstateStaticBody2D/ProstatePosition1.position
				badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
			2:
				badMoleculeScene.position = $ProstateStaticBody2D/ProstatePosition2.position
				badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
			3:
				badMoleculeScene.position = $ProstateStaticBody2D/ProstatePosition3.position
				badMoleculeScene.velocity = Vector2(rand_range(20, 100), rand_range(-160, -70))
			4:
				badMoleculeScene.position = $ProstateStaticBody2D/ProstatePosition4.position
				badMoleculeScene.velocity = Vector2(rand_range(160, 70), rand_range(160, 70))
			_:
				badMoleculeScene.position = $ProstateStaticBody2D/ProstatePosition4.position
				badMoleculeScene.velocity = Vector2(rand_range(-100, -20), rand_range(-160, -70))
		add_child(badMoleculeScene) # Adiciona o carcinógeno à árvore, fazendo-o aparecer na tela
		# Se 10 carcinógenos forem criados, para o timer, o que impede que 
		# novos carcinógenos sejam criados
		if Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] >= Global.organsUnderAttack[THIS_ORGAN]["maxCarcinogens"]:
			$SpawnTimer.stop()

# Se o botão voltar for pressionado, mudar a cena para a tela principal
func _on_ReturnButton_pressed():
	Music.stop_organ_music() # Para a música
	if Global.organsUnderAttack.has(THIS_ORGAN):
		Global.organsUnderAttack[THIS_ORGAN]["inScene"] = false
		Global.organsUnderAttack[THIS_ORGAN]['leftover'] = get_tree().get_nodes_in_group("Carcinogens").size()
		if Global.organsUnderAttack[THIS_ORGAN]["spawned"] >= 5:
			Global.organsUnderAttack[THIS_ORGAN]["spawned"] = 5
			Global.organsUnderAttack[THIS_ORGAN]["carcinogens"] = 5
	Global.tree = get_tree().change_scene("res://Main.tscn")

	
