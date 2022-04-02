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
var lastOrgan = ORGANS.SKIN
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
var ageTimerRunning = false

func _ready():
	randomize()
	# Define timer para idade
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	SpawnTimer.set_wait_time(1) # Define tempo de 10 segundos entre cada estágio de vida
	SpawnTimer.connect("timeout", self, "on_SpawnTimer_timeout") 
	add_child(SpawnTimer)

func _process(_delta):
	if ageTimerRunning:
		AgeTimer += 1
	if AgeTimer >= 1000:
		ageTimerRunning = false
		changingAge = true
		if inMain and organsUnderAttack.empty() and currentAge != "idoso":
			print("inside")
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
			if lastOrgan == ORGANS.SKIN:
				organsUnderAttack[ORGANS.INTESTINES] = {"carcinogens": 0, 
				"points": 0, "inScene": false, "maxCarcinogens": 5, "timer": Timer.new(), 
				"spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 5}
				lastOrgan = ORGANS.INTESTINES
			elif lastOrgan == ORGANS.INTESTINES:
				organsUnderAttack[ORGANS.SKIN] = {"carcinogens": 0, "points": 0, "inScene": false, 
				"maxCarcinogens": 5, "timer": Timer.new(), "spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, "deathCounter": 5}
				lastOrgan = ORGANS.SKIN
	if currentAge == "adulto":
		if organsUnderAttack.empty() and not changingAge:
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			attackHapenning = 1
			var possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER]
			if gender == "female":
				possibleOrgans.append(ORGANS.UTERUS)
			elif gender == "male":
				possibleOrgans.append(ORGANS.PROSTATE)
			var index = rng.randi_range(0, possibleOrgans.size() - 1)
			while possibleOrgans[index] == lastOrgan:
				index = rng.randi_range(0, possibleOrgans.size() - 1)
			lastOrgan = possibleOrgans[index]
			organsUnderAttack[possibleOrgans[index]] = {"carcinogens": 0, "points": 0, "inScene": false, 
			"maxCarcinogens": 5, "timer": Timer.new(), "spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, 
			"deathCounter": 5}
			print(organsUnderAttack.keys())
	if currentAge == "meia-idade":
		if organsUnderAttack.empty():
			headlineText = ""
			headlineVisibleCharacters = 0
			textFinished = false
			print("sorting")
			var possibleOrgans = [ORGANS.SKIN, ORGANS.INTESTINES, ORGANS.LIVER, ORGANS.LUNGS, ORGANS.STOMACH]
			if gender == "female":
				possibleOrgans.append(ORGANS.UTERUS)
			elif gender == "male":
				possibleOrgans.append(ORGANS.PROSTATE)
			for _i in range(2):
				attackHapenning = 2
				var index = rng.randi_range(0, possibleOrgans.size() - 1)
				while possibleOrgans[index] == lastOrgan:
					index = rng.randi_range(0, possibleOrgans.size() - 1)
				lastOrgan = possibleOrgans[index]
				organsUnderAttack[possibleOrgans[index]] = {"carcinogens": 0, "points": 0, "inScene": false, 
			"maxCarcinogens": 5, "timer": Timer.new(), "spawned": 0, "leftover": 0, "cancerCellIsGrowing": false, 
			"deathCounter": 5}
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
	for organ in organsUnderAttack.values():
		if not organ['inScene']:
			if organ["carcinogens"] < organ["maxCarcinogens"]:
				organ["carcinogens"] += 1
			else: 
				organ["deathCounter"] -= 1
				if organ["deathCounter"] <= 0:
					SpawnTimer.stop()
					Global.tree = get_tree().change_scene("res://GameOver.tscn")
			
# Altera a pontuação do jogador		
func change_score(score):
	playerScore += score
	organScore += score
