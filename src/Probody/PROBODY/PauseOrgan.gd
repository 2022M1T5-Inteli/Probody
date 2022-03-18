extends Control

func _ready():
	$PauseScreen/ReturnButton.grab_focus() 
	if Global.soundIsActive:
		$PauseScreen/MusicButton.icon = load("res://assets/music-icon.png")
	else:
		$PauseScreen/MusicButton.icon = load("res://assets/mute-icon.png")
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

func _on_MusicButton_pressed():
	if Global.soundIsActive:
		$PauseScreen/MusicButton.icon = load("res://assets/mute-icon.png")
		Global.stop_organ_music()
		Global.soundIsActive = false
	else:
		$PauseScreen/MusicButton.icon = load("res://assets/music-icon.png")
		Global.play_organ_music()
		Global.soundIsActive = true
		


func _on_RestartButton_pressed():
	Global.playerScore = 0
	var scenes = get_tree()
	get_tree().change_scene("res://Menu.tscn")
	get_tree().paused = false
