extends Node
var regularMusic = load("res://assets/audios/regularMusic.mp3")
var organMusic = load("res://assets/audios/organMusic.mp3")
var currentMusicSecond = 0 # marca em qual segundo a música parou
var organMusicIsPlaying = false
var regularMusicIsPlaying = false
var levelUpPlaying = false
var soundIsActive = true
var pointSound = load("res://assets/audios/newPoint.wav")
var gameOverSound = load("res://assets/audios/gameOver.wav")
var buyHabitSound = load("res://assets/audios/buyItem.wav")
var levelUpSound = load("res://assets/audios/levelupSound.mp3")

func _ready():
	# Define timer para idade
	# Conecta arquivo de áudio com cada tipo de música
	$RegularMusic.stream = regularMusic
	$OrganMusic.stream = organMusic
	$PointSound.stream = pointSound
	$GameOverSound.stream = gameOverSound
	$BuyHabitSound.stream = buyHabitSound
	#$LevelUpSound.stream = levelUpSound

func _process(_delta):
	if regularMusicIsPlaying or organMusicIsPlaying:
		currentMusicSecond = $RegularMusic.get_playback_position()

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

func play_levelup_sound():
	if soundIsActive and levelUpPlaying == false:
		$LevelUpSound.play()
		levelUpPlaying = true
	else:
		$LevelUpSound.stop()
