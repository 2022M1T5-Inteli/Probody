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
		Music.play_regular_music()
		
	if Global.gender == "male":
		$FemaleBody.hide()
		$MaleBody.show()
	elif Global.gender == "female":
		$FemaleBody.show()
		$MaleBody.hide()

func _process(_delta):
	if Global.headlineText == "":
		print("setting headline")
		if Global.organsUnderAttack.has(Global.ORGANS.SKIN):
			headline += Global.chosenName + " passou o dia na praia sem protetor solar.\n\n" 
		#" Agora, há agentes cancerígenos em sua pele.\n\n"
		if Global.organsUnderAttack.has(Global.ORGANS.INTESTINES):
			headline += Global.chosenName + " almoçou fast-food com comida altamente processada.\n\n" 
		#" Agora, há agentes cancerígenos em seu intestino.\n\n"
		if Global.organsUnderAttack.has(Global.ORGANS.LIVER):
			headline += Global.chosenName + " tomou alguns drinks em uma festa.\n\n" 
		#" Agora, há agentes cancerígenos em seu fígado.\n\n"
		if Global.organsUnderAttack.has(Global.ORGANS.PROSTATE):
			headline += Global.chosenName + " está com o metabolismo fraco e precisa de ajuda para combater agentes cancerígenos na próstata.\n\n"
		#" Agora, há agentes cancerígenos em seu intestino.\n\n"
		if Global.organsUnderAttack.has(Global.ORGANS.UTERUS):
			headline += Global.chosenName + " relacionou-se sem proteção e contraiu HPV.\n\n" 
		#" Agora, há agentes cancerígenos em seu útero.\n\n"
		if Global.organsUnderAttack.has(Global.ORGANS.LUNGS):
			headline += Global.chosenName + " fumou um cigarro com os amigos.\n\n" 
		if Global.organsUnderAttack.has(Global.ORGANS.STOMACH):
			headline += Global.chosenName + " sofreu muito estresse e desenvolveu úlceras no estômago.\n\n" 
		#" Agora, há agentes cancerígenos em seus pulmões.\n\n"
		if headline != "":
			$Headline.set_news(headline)
		
	
# Troca a cena para a loja de hábitos no clique do botão de hábitos.
func _on_HabitsButton_pressed():
	Global.tree = get_tree().change_scene("res://HabitStore.tscn")

func _on_Headline_textFinished():
	print("here")
	Global.textFinished = true
	Global.SpawnTimer.start()

func _on_Main_tree_exited():
	Global.inMain = false
