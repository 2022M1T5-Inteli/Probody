extends Control

func _ready():
	$PauseScreen/ReturnButton.grab_focus() 
	$PauseScreen/MusicButton.icon = load("res://assets/music-icon.png")
	Global.stop_organ_music()
	
	
func _physics_process(delta):
	if $PauseScreen/ReturnButton.is_hovered() == true:
		$PauseScreen/ReturnButton.grab_focus()
	if $PauseScreen/RestartButton.is_hovered() == true:
		$PauseScreen/RestartButton.grab_focus()
	if Input.is_action_just_pressed("ui_cancel"): # Pausa o jogo com o esc
		$PauseScreen/ReturnButton.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible # Liga e desliga a visibilidade da cena de Pause
		
		
func _on_ReturnButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible

func _on_PauseButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_MusicButton_toggled(button_pressed):
	print("click")
	$PauseScreen/MusicButton.icon = load("res://assets/mute-icon.png")
	Global.stop_regular_music()
	Global.soundIsActive = false


func _on_RestartButton_pressed():
	Global.restart_game()
