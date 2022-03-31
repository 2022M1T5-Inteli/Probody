# Script global para guardar valores e coordenar ações entre várias cenas

extends Node
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
var tree
var gender
var chosenName
var organMouse = load("res://assets/metabolism.png") # Carrega a imagem de metabolismo do cursor 
var mouseHotspot = Vector2(64,64)

# PONTUAÇÃO
var playerScore = 0
var organScore = 0
#  VARIÁVEIS DA TELA PRINCIPAL
var tutorialHasStarted = false
var headlineVisibleCharacters = 0
var headlineText = ""

# ESTÁGIOS DE VIDA
var age = ["adolescente", "jovem", "adulto", "meia-idade", "idoso"]
var ageIndex = 0
var currentAge = age[ageIndex]
var AgeTimer = Timer.new() # Timer que controla a passagem dos estágios de vida

# BACKGROUND MUSIC E EFEITOS
var regularMusic = load("res://assets/audios/regularMusic.mp3")
var organMusic = load("res://assets/audios/organMusic.mp3")
var currentMusicSecond = 0 # marca em qual segundo a música parou
var organMusicIsPlaying = false
var regularMusicIsPlaying = false
var soundIsActive = true
var pointSound = load("res://assets/audios/newPoint.wav")
var gameOverSound = load("res://assets/audios/gameOver.wav")
var buyHabitSound = load("res://assets/audios/buyItem.wav")

func _ready():
	# Define timer para idade
	AgeTimer.set_wait_time(10) # Define tempo de 10 segundos entre cada estágio de vida
	AgeTimer.connect("timeout", self, "on_AgeTimer_timeout") 
	add_child(AgeTimer)
	AgeTimer.start()
	# Conecta arquivo de áudio com cada tipo de música
	$RegularMusic.stream = regularMusic
	$OrganMusic.stream = organMusic
	$PointSound.stream = pointSound
	$GameOverSound.stream = gameOverSound
	$BuyHabitSound.stream = buyHabitSound
	
# Salva ponto atual da música, se ela estiver tocando
func _process(_delta):
	if regularMusicIsPlaying or organMusicIsPlaying:
		currentMusicSecond = $RegularMusic.get_playback_position()
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
# Toca música de tela principal e hábitos
func play_regular_music():
	if not regularMusicIsPlaying and not organMusicIsPlaying:
		$RegularMusic.play(currentMusicSecond) # Começa a tocar a partir do ponto em que a música parou
		regularMusicIsPlaying = true
		
# Pausa música de tela principal e hábitos
func pause_regular_music():
	if regularMusicIsPlaying and not organMusicIsPlaying:
		$RegularMusic.stop()
		regularMusicIsPlaying = false
		currentMusicSecond = 0
	
# Toca música das telas de órgãos
func play_organ_music():
	if not organMusicIsPlaying and not regularMusicIsPlaying:
		organMusicIsPlaying = true
		$OrganMusic.play()
	
# Para música das telas de órgãos
func stop_organ_music():
	if organMusicIsPlaying and not regularMusicIsPlaying:
		organMusicIsPlaying = false
		$OrganMusic.stop()

# Toca som de ganho de ponto
func play_point_sound():
	if soundIsActive:
		$PointSound.play()

# Toca som de game over
func play_game_over():
	if soundIsActive:
		$GameOverSound.play()

# Toca som de compra de hábito
func play_buy_habit_sound():
	if soundIsActive:
		$BuyHabitSound.play()

# Aumenta a idade quando o timer de idade acaba
func on_AgeTimer_timeout():
	if ageIndex < age.size() - 1: # Esta condição impede um erro "out of bounds" no array de idades
		ageIndex += 1
		currentAge = age[ageIndex]

# Altera a pontuação do jogador		
func change_score(score):
	playerScore += score
	organScore += score
