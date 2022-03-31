# Nó da tela principal
extends Node

# Ao carregar, a cena inicia a música, se o som estiver ativo, e o tutorial,
# se isso ainda não tiver sido feito. O corpo condizente com o sexo escolhido
# também é apresentado.
func _ready():
	if Global.soundIsActive:
		Global.play_regular_music()
		
	if not Global.tutorialHasStarted:
		tutorial()
		
	if Global.gender == "male":
		$FemaleBody.hide()
		$MaleBody.show()
	elif Global.gender == "female":
		$FemaleBody.show()
		$MaleBody.hide()

# Coordena o tutorial
func tutorial():
	Global.tutorialHasStarted = true
	# Define e mostra o texto na barra do âncora
	$Headline.set_news("NOME estava esperando o ônibus quando um colega lhe ofereceu um cigarro." +
	" NOME aceitou, e agora há carcinógenos entrando em seu pulmão. Clique no pulmão para combatê-los.")
	
# Troca a cena para a loja de hábitos no clique do botão de hábitos.
func _on_HabitsButton_pressed():
	get_tree().change_scene("res://HabitStore.tscn")

