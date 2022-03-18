# Nó da tela principal
extends Node

# Ao carregar, a cena inicia o tutorial e a música caso isso ainda não tenha sido feito
func _ready():
	print(Global.soundIsActive)
	if Global.soundIsActive:
		Global.play_regular_music()
	if not Global.tutorialHasStarted:
		tutorial()
	print(Global.soundIsActive)
	

	if Global.gender > 0:
		$FemaleBody.hide()
		$MaleBody.show()

# Coordena o tutorial
func tutorial():
	Global.tutorialHasStarted = true
	# Define e mostra o texto na barra do âncora
	$Headline.set_news("NOME estava esperando o ônibus quando um colega lhe ofereceu um cigarro." +
	" NOME aceitou, e agora há carcinógenos entrando em seu pulmão. Clique no pulmão para combatê-los.")
	
# Troca a cena para a loja de hábitos no clique do botão de hábitos.
func _on_HabitsButton_pressed():
	Global.tree = get_tree().change_scene("res://HabitStore.tscn")

