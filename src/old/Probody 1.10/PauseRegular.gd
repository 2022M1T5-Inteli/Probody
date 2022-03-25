# Nó que controla o botão de pausa nas cenas "Main" e "HabitStore"
extends Control

# Ao carregar, mostrar botão de som (mutado ou não) de acordo com condição atual do som
func _ready():
	# A linha abaixo destaca o botão de pausa quando o mouse passa por cima dele
	$PauseScreen/ReturnButton.grab_focus() 
	if Global.soundIsActive:
		$PauseScreen/MusicButton.icon = load("res://assets/music-icon.png")
	else:
		$PauseScreen/MusicButton.icon = load("res://assets/mute-icon.png")

func _physics_process(_delta):
	# A cada iteração do loop principal, destaque os botões sobre os quais o mouse passa.
	if $PauseScreen/ReturnButton.is_hovered():
		$PauseScreen/ReturnButton.grab_focus()
	if $PauseScreen/RestartButton.is_hovered():
		$PauseScreen/RestartButton.grab_focus()
	# Se 'ESC' for apertado, sair da tela de pausa
	if Input.is_action_just_pressed("ui_cancel"):
		$PauseScreen/ReturnButton.grab_focus()
		get_tree().paused = not get_tree().paused # "Despausa" jogo
		visible = not visible # Desliga visibilidade do painel
		
# Sai da tela de pausa
func _on_ReturnButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

# Ao clicar no botão de pausa, a música para, o jogo pausa e a tela de pausa fica visível
func _on_PauseButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

# Ao clicar no botão de música, som ora para ora reinicia
func _on_MusicButton_pressed():
	# Se som estiver ativo, ícone muda para o "mudo", música para e variável booleana é atualizada
	if Global.soundIsActive:
		$PauseScreen/MusicButton.icon = load("res://assets/mute-icon.png")
		Global.pause_regular_music()
		Global.soundIsActive = false
	# Se som estiver inativo, ícone muda para o "tocando", música recomeça e variável booleana é atualizada
	else:
		$PauseScreen/MusicButton.icon = load("res://assets/music-icon.png")
		Global.play_regular_music()
		Global.soundIsActive = true
		
# Ao clicar em "Início", a pontuação é zerada. A cena muda para "Menu" e o jogo é despausado.
func _on_RestartButton_pressed():
	Global.playerScore = 0
	get_tree().change_scene("res://Menu.tscn")
	get_tree().paused = false
