# Script global para guardar valores e coordenar ações entre várias cenas
extends Node

enum ORGANS {LUNGS = 1, STOMACH = 2, LIVER = 3, INTESTINES = 4, SKIN = 5, UTERUS = 6, PROSTATE = 7}
# Variáveis de riscos
# Elas servem principalmente para definir a porcentagem da barra dos pop-ups dos cânceres
# Os que valem 0.5 são os hábitos, caso sejam comprados na loja, passam a valer zero
# O risco basal é um risco que mudará conforme a idade do jogador
# As "justBought" servem para verificar se é a primeira vez que o hábito específico está sendo comprado
var unhealthyEating = 0.5
var sedentary = 0.5
var smoking = 0.5
var basalRisk = 10
var sunDaily = 0.5
var alcoholism = 0.5
var processedFood = 0.5
var irresponsableSex = 0.5
var noMammogram = 0.5
var noUrologistVisit = 0.5
var justBoughtUnhealthyEating = 0
var justBoughtsedentary = 0
var justBoughtsmoking = 0
var justBoughtsunDaily = 0
var justBoughtalcoholism = 0
var justBoughtprocessedFood = 0
var justBoughtirresponsableSex = 0
var justBoughtnoMammogram = 0
var justBoughtnoUrologistVisit = 0

# Variáveis gerais
var textFinished = false # Guarda a informação se o texto da cena "Main" está completo ou não
var organsUnderAttack = {} # Dicionário usado para guardar as informações de todos os específicos cânceres acontecendo no corpo
var gender # Guarda o gênero que o jogador escolheu
var chosenName = "" # Guarda o nome digitado na cena ChooseName
var organMouse = load("res://assets/metabolism.png") # Carrega a imagem de metabolismo do cursor 
var mouseHotspot = Vector2(64,64)
var cancerCellIsGrowing = false
var lastOrgan = "SKIN" # Guarda a informação do último órgão atacado para que os órgãos não se repitam
var attackHapenning = 0 # Guarda a informação da quantidade de ataques acontecendo momentaneamente
var inMain = false #Guarda a informação de se o jogador está na cena "Main" ou não
var changingAge = false # Guarda a informação de se o jogador está mudando de idade
var tree # É usado para diminuir a quantidade de erros do debugger ao usar comandos como "change_scene"
var hasBeenCalled = false
var tutorialFinished = false

# Variáveis de pontuação
var playerScore = 0
var organScore = 0
var explosion = false

#  Variáveis usadas para o tutorial
var tutorialHasStarted = false
var headlineVisibleCharacters = 0
var headlineText = ""
var rng

# Variáveis usadas para definir os estágios da vida que o jogador se encontra
var age = ["adolescente", "jovem", "adulto", "meia-idade", "idoso"]
var ageIndex = 1
var currentAge = "jovem"#age[ageIndex]
var AgeTimer = 0# Timer que controla a passagem dos estágios de vida
var SpawnTimer = Timer.new()
var DeathBarTimer = Timer.new()
var ageTimerRunning = false
var possibleOrgans = []

var cancerRisk = {ORGANS.LUNGS: 0, ORGANS.SKIN: 0, ORGANS.INTESTINES: 0, ORGANS.LIVER : 0, ORGANS.PROSTATE: 0, ORGANS.UTERUS: 0, ORGANS.STOMACH: 0}

func _ready():
	randomize()
	# Define timer para idade
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	SpawnTimer.set_wait_time(.75) # Define tempo de 10 segundos entre cada estágio de vida
	SpawnTimer.connect("timeout", self, "on_SpawnTimer_timeout")
	add_child(SpawnTimer)
	DeathBarTimer.set_wait_time(.075) # Define tempo de 10 segundos entre cada estágio de vida
	DeathBarTimer.connect("timeout", self, "on_DeathBarTimer_timeout")
	add_child(DeathBarTimer)

func _process(_delta):
	if headlineVisibleCharacters <= 0:
		Global.DeathBarTimer.stop()
	if ageTimerRunning:
		AgeTimer += 1
	if AgeTimer >= 5625:
		ageTimerRunning = false
		changingAge = true
		if inMain and organsUnderAttack.empty() and currentAge != "idoso":
			ageIndex += 1
			currentAge = age[ageIndex]
			AgeTimer = 0
			ageTimerRunning = true
			changingAge = false
			Music.play_levelup_sound()
			get_tree().change_scene("res://scenes/LevelUp.tscn")
			yield(get_tree().create_timer(4), "timeout")
			Music.play_levelup_sound()
			
	if currentAge == "adolescente":
		if organsUnderAttack.empty():
			organsUnderAttack[ORGANS.SKIN] = {"carcinogens": 0, 
			"points": 0, "inScene": false, "maxCarcinogens": 10,
			"timer": Timer.new(), "spawned": 0}
	if currentAge == "jovem":
		if organsUnderAttack.empty() and not changingAge:
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			attackHapenning = 1
			get_cancer_risk()
			if lastOrgan == "SKIN":
				possibleOrgans = [ORGANS.INTESTINES]
			elif lastOrgan == "INTESTINE":
				possibleOrgans = [ORGANS.SKIN]
			organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 15, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 9, "deathCounterLimit": 9, "deathBar": 100}
	if currentAge == "adulto":
		if organsUnderAttack.empty() and not changingAge:
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			attackHapenning = 1
			if gender == "female":
				if lastOrgan == "SKIN":
					possibleOrgans = [ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.UTERUS]
				elif lastOrgan == "INTESTINE":
					possibleOrgans = [ORGANS.SKIN, ORGANS.LIVER, ORGANS.UTERUS]
				elif lastOrgan == "LIVER":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.UTERUS]
				elif lastOrgan == "UTERUS":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER]
				if !noMammogram and possibleOrgans.has(ORGANS.UTERUS):
					possibleOrgans.remove(ORGANS.UTERUS)
			elif gender == "male":
				if lastOrgan == "SKIN":
					possibleOrgans = [ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.PROSTATE]
				elif lastOrgan == "INTESTINE":
					possibleOrgans = [ORGANS.SKIN, ORGANS.LIVER, ORGANS.PROSTATE]
				elif lastOrgan == "LIVER":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.PROSTATE]
				elif lastOrgan == "PROSTATE":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER]
				if !noUrologistVisit and possibleOrgans.has(ORGANS.PROSTATE):
					possibleOrgans.remove(ORGANS.PROSTATE)
			get_cancer_risk()
			organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 15, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 9, "deathCounterLimit": 9, "deathBar": 100}
	if currentAge == "meia-idade":
		SpawnTimer.set_wait_time(.75)
		DeathBarTimer.set_wait_time(.075)
		if organsUnderAttack.empty():
			get_cancer_risk()
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.LUNGS, ORGANS.STOMACH]
			if gender == "female":
				possibleOrgans.append(ORGANS.UTERUS)
			elif gender == "male":
				possibleOrgans.append(ORGANS.PROSTATE)
			if !noUrologistVisit and possibleOrgans.has(ORGANS.PROSTATE):
					possibleOrgans.remove(ORGANS.PROSTATE)
			if !noMammogram and possibleOrgans.has(ORGANS.UTERUS):
					possibleOrgans.remove(ORGANS.UTERUS)
			for _i in range(2):
				attackHapenning = 2
				organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 15, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 24, "deathCounterLimit": 24, "deathBar": 100}
	if currentAge == "idoso":
		ageTimerRunning = false
		Global.tree = get_tree().change_scene("res://scenes/VictoryScene.tscn")
	if ageIndex == 0 :
		basalRisk = 10
	if ageIndex == 1 :
		basalRisk = 20
	if ageIndex == 2 :
		basalRisk = 30
	if ageIndex == 3 :
		basalRisk = 40
	if ageIndex == 4 :
		basalRisk = 50
		
func get_cancer_risk():
	cancerRisk[ORGANS.SKIN] = basalRisk + int(unhealthyEating) * 5 + int(sedentary) * 5 + sunDaily * 80
	cancerRisk[ORGANS.INTESTINES] = basalRisk + int(unhealthyEating) * 5 + int(sedentary) * 5 + processedFood * 80
	cancerRisk[ORGANS.UTERUS] = irresponsableSex * 90
	cancerRisk[ORGANS.LIVER] = basalRisk + int(unhealthyEating) * 5 + int(sedentary) * 5 + alcoholism * 80
	cancerRisk[ORGANS.PROSTATE] = noUrologistVisit * 90
	cancerRisk[ORGANS.STOMACH] = basalRisk + int(unhealthyEating) * 5 + int(sedentary) * 5 + unhealthyEating * 80
	cancerRisk[ORGANS.LUNGS] = basalRisk + int(unhealthyEating) * 5 + int(sedentary) * 5 + smoking * 80

# Adiciona um no valor da quantidade de cânceres criados no câncer que estiver acontecendo e
# remove um na quantidade de vida do jogador a cada um segundo
func on_SpawnTimer_timeout():
	var countDeath
	for organ in organsUnderAttack.values():
		if not organ['inScene']:
			if organ["carcinogens"] < organ["maxCarcinogens"]:
				organ["carcinogens"] += 1
			if organ["deathCounter"] <= 0:
				SpawnTimer.stop()
				DeathBarTimer.stop()
				Global.tree = get_tree().change_scene("res://scenes/GameOver.tscn")
		if currentAge == "meia-idade":
			organ["deathCounter"] -= 1.2
		else:
			organ["deathCounter"] -= 1
					

# Adiciona uma quantidade específica, que depende de outras variáveis, na variável da barra da cena "Main"
func on_DeathBarTimer_timeout():
	for organ in organsUnderAttack.values():
		if currentAge == "meia-idade":
			organ["deathBar"] -= ((10.0)/(organ["deathCounterLimit"] + 1)) + ((10.0)/(organ["deathCounterLimit"] + 1)) * 0.2
		else:
			organ["deathBar"] -= (10.0)/(organ["deathCounterLimit"] + 1)
			
			
# Altera a pontuação do jogador
func change_score(score):
	playerScore += score
	organScore += score
	
	
# Com base na probalidade de cada câncer acontecer, seleciona um câncer de forma aleatória
func pick_weighted_random():
	var rawRisks = []
	var sumRisk = 0.0
	for organ in possibleOrgans:
		rawRisks.append(cancerRisk[organ])
		sumRisk += cancerRisk[organ]
	var risks = []
	for rawRisk in rawRisks:
		risks.append(rawRisk / sumRisk)
	var cumulative_weight = []
	var current_cumulative_weight = 0
	for risk in risks:
		current_cumulative_weight += risk
		cumulative_weight.append(current_cumulative_weight)
	var choice = randf()
	var index = 0
	for i in cumulative_weight.size():
		if choice < cumulative_weight[i]:
			choice = cumulative_weight[i]
			index = i
			break
	return possibleOrgans[index]

# Volta o valor de todas as variáveis para seus valores iniciais, para assim, resetar o jogo
func restart_game():
	unhealthyEating = 0.5
	sedentary = 0.5
	smoking = 0.5
	basalRisk = 10
	sunDaily = 0.5
	alcoholism = 0.5
	processedFood = 0.5
	irresponsableSex = 0.5
	noMammogram = 0.5
	noUrologistVisit = 0.5
	textFinished = false
	organsUnderAttack = {}
	organMouse = load("res://assets/metabolism.png") # Carrega a imagem de metabolismo do cursor 
	mouseHotspot = Vector2(64,64)
	cancerCellIsGrowing = false
	lastOrgan = ORGANS.SKIN
	attackHapenning = 0
	inMain = false
	changingAge = false
	Music.currentMusicSecond = 0
	tree
# PONTUAÇÃO
	playerScore = 0
	organScore = 0
	explosion = false
#  VARIÁVEIS DA TELA PRINCIPAL
	tutorialHasStarted = false
	headlineVisibleCharacters = 0
	headlineText = ""
	lastOrgan = "SKIN"

	ageIndex = 1
	currentAge = "jovem"#age[ageIndex]
	AgeTimer = 0# Timer que controla a passagem dos estágios de vida
	ageTimerRunning = false
	possibleOrgans = []
	SpawnTimer.stop()
	DeathBarTimer.stop()

	cancerRisk = {ORGANS.LUNGS: 0, ORGANS.SKIN: 0, ORGANS.INTESTINES: 0, ORGANS.LIVER : 0, ORGANS.PROSTATE: 0, ORGANS.UTERUS: 0, ORGANS.STOMACH: 0}
