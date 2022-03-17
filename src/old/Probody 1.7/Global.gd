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

# PONTUAÇÃO
var playerScore = 100

#  VARIÁVEIS DA TELA PRINCIPAL
var tutorialHasStarted = false
var headlineVisibleCharacters = 0
var headlineText = ""

# ESTÁGIOS DE VIDA
var age = ["adolescente", "jovem", "adulto", "meia-idade", "idoso"]
var ageIndex = 0
var currentAge = age[ageIndex]
var AgeTimer = Timer.new() # Timer que controla a passagem dos estágios de vida

# BACKGROUND MUSIC (uma toca na tela principal e de hábitos, a outra apenas nas cenas de órgãos)
var regularMusic = load("res://assets/audios/regularMusic.mp3")
var organMusic = load("res://assets/audios/organMusic.mp3")
var currentMusicSecond = 0 # marca em qual segundo a música parou
var musicIsPlaying = false

func _ready():
	AgeTimer.set_wait_time(10) # Define tempo de 10 segundos entre cada estágio de vida
	AgeTimer.connect("timeout", self, "on_AgeTimer_timeout") 
	add_child(AgeTimer)
	AgeTimer.start()
	# Conecta arquivo de áudio com cada tipo de música
	$RegularMusic.stream = regularMusic
	$OrganMusic.stream = organMusic
	# Começa música ao carregar o jogo
	play_regular_music() 
	
# Salva ponto atual da música, se ela estiver tocando
func _process(_delta):
	if musicIsPlaying:
		currentMusicSecond = $RegularMusic.get_playback_position()

# Toca música de tela principal e hábitos
func play_regular_music():
	$RegularMusic.play(currentMusicSecond) # Começa a tocar a partir do ponto em que a música parou
	musicIsPlaying = true

# Pausa música de tela principal e hábitos
func pause_regular_music():
	$RegularMusic.stop()
	musicIsPlaying = false
	currentMusicSecond = 0
	
# Toca música das telas de órgãos
func play_organ_music():
	$OrganMusic.play()
	
# Para música das telas de órgãos
func stop_organ_music():
	$OrganMusic.stop()

# Aumenta a idade quando o timer de idade acaba
func on_AgeTimer_timeout():
	if ageIndex < age.size() - 1: # Esta condição impede um erro "out of bounds" no array de idades
		ageIndex += 1
		currentAge = age[ageIndex]

# Altera a pontuação do jogador		
func change_score(score):
	playerScore += score
