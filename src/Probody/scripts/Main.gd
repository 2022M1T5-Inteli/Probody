# Nó da tela principal
extends Node
var headline = ''

# Ao carregar, a cena inicia a música, se o som estiver ativo, e o tutorial,
# se isso ainda não tiver sido feito. O corpo condizente com o sexo escolhido
# também é apresentado.
func _ready():
	Global.inMain = true
	Input.set_custom_mouse_cursor(null) # Volta para o cursor original
	if Music.soundIsActive:
		Music.stop_organ_music()
		Music.play_regular_music()
		
	if Global.gender == "male":
		$FemaleBody.hide()
		$MaleBody.show()
	elif Global.gender == "female":
		$FemaleBody.show()
		$MaleBody.hide()

	if Global.hasBeenCalled == false:
		$PauseCanvasLayer/Tutorial.visible = true
		get_tree().paused = true
		Global.hasBeenCalled = true
	
	$DeathBar.value = 100
		
# Verifica os órgãos que estão sendo atacados, e com base nisso, define o texto do âncora
func _process(_delta):
	if Global.organsUnderAttack.has(Global.ORGANS.SKIN):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.SKIN]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.SKIN]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " deixou de utilizar o protetor solar ao tomar o sol do meio-dia mais uma vez.\n\n" 
	#" Agora, há agentes cancerígenos em sua pele.\n\n"
	if Global.organsUnderAttack.has(Global.ORGANS.INTESTINES):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.INTESTINES]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.INTESTINES]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " almoçou fast-food com comidas processadas novamente.\n\n" 
	#" Agora, há agentes cancerígenos em seu intestino.\n\n"
	if Global.organsUnderAttack.has(Global.ORGANS.LIVER):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.LIVER]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.LIVER]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " tomou drinks em uma festa com amigos de novo.\n\n" 
	#" Agora, há agentes cancerígenos em seu fígado.\n\n"
	if Global.organsUnderAttack.has(Global.ORGANS.PROSTATE):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.PROSTATE]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.PROSTATE]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " deixou de realizar o exame de toque deste ano.\n\n"
	#" Agora, há agentes cancerígenos em seu intestino.\n\n"
	if Global.organsUnderAttack.has(Global.ORGANS.UTERUS):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.UTERUS]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.UTERUS]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " tem relacionado-se sem proteção recentemente, e infectou-se com HPV.\n\n" 
	#" Agora, há agentes cancerígenos em seu útero.\n\n"
	if Global.organsUnderAttack.has(Global.ORGANS.LUNGS):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.LUNGS]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.LUNGS]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " fumou um cigarro com os amigos mais uma vez.\n\n" 
	if Global.organsUnderAttack.has(Global.ORGANS.STOMACH):
		if $DeathBar.value >= Global.organsUnderAttack[Global.ORGANS.STOMACH]["deathBar"]:
			$DeathBar.value = Global.organsUnderAttack[Global.ORGANS.STOMACH]["deathBar"]
		if Global.headlineText == "":
			headline += Global.chosenName + " não tem tratado sua gastrite.\n\n" 
	#" Agora, há agentes cancerígenos em seus pulmões.\n\n"
	if headline != "":
		$Headline.set_news(headline)
		
	
# Troca a cena para a loja de hábitos no clique do botão de hábitos.
func _on_HabitsButton_pressed():
	Global.tree = get_tree().change_scene("res://scenes/HabitStore.tscn")

# Muda variáveis e inicia timers do global quando o texto acaba
func _on_Headline_textFinished():
	Global.textFinished = true
	Global.SpawnTimer.start()
	Global.DeathBarTimer.start()

# Ao sair da cena, define que está fora dela mesma
func _on_Main_tree_exited():
	Global.inMain = false
