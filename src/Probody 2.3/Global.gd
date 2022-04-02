# Script global para guardar valores e coordenar ações entre várias cenas
extends Node

enum ORGANS {LUNGS = 1, STOMACH = 2, LIVER = 3, INTESTINES = 4, SKIN = 5, UTERUS = 6, PROSTATE = 7}
# RISCOS (combatidos pelos hábitos)
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

# Variáveis gerais
var textFinished = false
var organsUnderAttack = {}
var gender
var chosenName = ""# Guarda o nome digitado na cena ChooseName
var organMouse = load("res://assets/metabolism.png") # Carrega a imagem de metabolismo do cursor 
var mouseHotspot = Vector2(64,64)
var cancerCellIsGrowing = false
var lastOrgan = "SKIN"
var attackHapenning = 0
var inMain = false
var inMainForTheFirstTime = false
var changingAge = false
var tree
# PONTUAÇÃO
var playerScore = 0
var organScore = 0
var explosion = false
#  VARIÁVEIS DA TELA PRINCIPAL
var tutorialHasStarted = false
var headlineVisibleCharacters = 0
var headlineText = ""
var rng

# ESTÁGIOS DE VIDA
var age = ["adolescente", "jovem", "adulto", "meia-idade", "idoso"]
var ageIndex = 1
var currentAge = "jovem"#age[ageIndex]
var AgeTimer = 0# Timer que controla a passagem dos estágios de vida
var SpawnTimer = Timer.new()
var DeathBarTimer = Timer.new()
var ageTimerRunning = false
var possibleOrgans = []

var cancerRisk = {ORGANS.LUNGS: 0, ORGANS.SKIN: 0, ORGANS.INTESTINES: 0, ORGANS.LIVER : 0, ORGANS.PROSTATE: 0, ORGANS.UTERUS: 0, ORGANS.STOMACH: 0}

func get_cancer_risk():
	cancerRisk[ORGANS.SKIN] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + sunDaily * 50
	cancerRisk[ORGANS.INTESTINES] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + processedFood * 50
	cancerRisk[ORGANS.UTERUS] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + irresponsableSex * 50
	cancerRisk[ORGANS.LIVER] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + alcoholism * 50
	cancerRisk[ORGANS.PROSTATE] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + noUrologistVisit * 50
	cancerRisk[ORGANS.STOMACH] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + smoking * 50
	cancerRisk[ORGANS.LUNGS] = basalRisk + int(unhealthyEating) * 20 + int(sedentary) * 20 + smoking * 50

func _ready():
	randomize()
	# Define timer para idade
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	SpawnTimer.set_wait_time(1) # Define tempo de 10 segundos entre cada estágio de vida
	SpawnTimer.connect("timeout", self, "on_SpawnTimer_timeout") 
	add_child(SpawnTimer)
	DeathBarTimer.set_wait_time(.1) # Define tempo de 10 segundos entre cada estágio de vida
	DeathBarTimer.connect("timeout", self, "on_DeathBarTimer_timeout") 
	add_child(DeathBarTimer)

func _process(_delta):
	if headlineVisibleCharacters <= 0:
		Global.DeathBarTimer.stop()
	if ageTimerRunning:
		AgeTimer += 1
	if AgeTimer >= 1000:
		ageTimerRunning = false
		changingAge = true
		if inMain and organsUnderAttack.empty() and currentAge != "idoso":
			ageIndex += 1
			currentAge = age[ageIndex]
			AgeTimer = 0
			ageTimerRunning = true
			changingAge = false
			Music.play_levelup_sound()
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
			print(possibleOrgans)
			organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 5, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 9, "deathBar": 0}
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
			elif gender == "male":
				if lastOrgan == "SKIN":
					possibleOrgans = [ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.PROSTATE]
				elif lastOrgan == "INTESTINE":
					possibleOrgans = [ORGANS.SKIN, ORGANS.LIVER, ORGANS.PROSTATE]
				elif lastOrgan == "LIVER":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.PROSTATE]
				elif lastOrgan == "PROSTATE":
					possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER]
			get_cancer_risk()
			organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 5, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 9, "deathBar": 0}
	if currentAge == "meia-idade":
		if organsUnderAttack.empty():
			get_cancer_risk()
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			print("sorting")
			possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.LUNGS, ORGANS.STOMACH]
			if gender == "female":
				possibleOrgans.append(ORGANS.UTERUS)
			elif gender == "male":
				possibleOrgans.append(ORGANS.PROSTATE)
			for _i in range(2):
				attackHapenning = 2
				organsUnderAttack[pick_weighted_random()] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 5, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 19, "deathBar": 0}
	if currentAge == "idoso":
		ageTimerRunning = false
		Global.tree = get_tree().change_scene("res://VictoryScene.tscn")
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

func on_SpawnTimer_timeout():
	var countDeath
	for organ in organsUnderAttack.values():
		if not organ['inScene']:
			if organ["carcinogens"] < organ["maxCarcinogens"]:
				organ["carcinogens"] += 1
			else: 
				pass
				if organ["deathCounter"] <= 0:
					SpawnTimer.stop()
					DeathBarTimer.stop()
					#Global.tree = get_tree().change_scene("res://GameOver.tscn")
		if currentAge == "meia-idade":
			organ["deathCounter"] -= 1.2
		else:
			organ["deathCounter"] -= 1
					
func on_DeathBarTimer_timeout():
	for organ in organsUnderAttack.values():
		if currentAge == "meia-idade":
			organ["deathBar"] += .6
		else:
			organ["deathBar"] += 1
			
# Altera a pontuação do jogador		
func change_score(score):
	playerScore += score
	organScore += score

func pick_weighted_random():
	var rawRisks = []
	var sumRisk = 0.0
	for organ in possibleOrgans:
		rawRisks.append(cancerRisk[organ])
		sumRisk += cancerRisk[organ]
	var risks = []
	print(rawRisks)
	for rawRisk in rawRisks:
		risks.append(rawRisk / sumRisk)
	print(risks)
	var cumulative_weight = []
	var current_cumulative_weight = 0
	for risk in risks:
		current_cumulative_weight += risk
		cumulative_weight.append(current_cumulative_weight)
	print(cumulative_weight)
	var choice = randf()
	print(choice)
	var index = 0
	for i in cumulative_weight.size():
		if choice < cumulative_weight[i]:
			choice = cumulative_weight[i]
			index = i
			break
	return possibleOrgans[index]

func restart_game():
	print("aaa")
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
	gender
	organMouse = load("res://assets/metabolism.png") # Carrega a imagem de metabolismo do cursor 
	mouseHotspot = Vector2(64,64)
	cancerCellIsGrowing = false
	lastOrgan = ORGANS.SKIN
	attackHapenning = 0
	inMain = false
	inMainForTheFirstTime = false
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

	cancerRisk = {ORGANS.LUNGS: 0, ORGANS.SKIN: 0, ORGANS.INTESTINES: 0, ORGANS.LIVER : 0, ORGANS.PROSTATE: 0, ORGANS.UTERUS: 0, ORGANS.STOMACH: 0}

		
	
