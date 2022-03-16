# Nó que controla o contêiner de notícias na parte superior da tela.
extends Node

# Inicia texto a partir do último caractere apresentado. Assim, caso o jogador
# entre e saia da cena, a headline não recomeçará.
func _ready():
	$PercentTimer.start() # Começa o timer para o aparecimento de cada caractere
	$News.visible_characters = Global.headlineVisibleCharacters
	$News.text = Global.headlineText

# Salva caractere atual
func _process(_delta):
	Global.headlineVisibleCharacters = $News.visible_characters
	$News.text = Global.headlineText
	
# Determina o texto a aparecer na barra
func set_news(news):
	Global.headlineText = news
	
# Mostra o texto
func display_news():
	if Global.headlineVisibleCharacters < Global.headlineText.length(): 
		$News.visible_characters += 1
		if Global.headlineVisibleCharacters == Global.headlineText.length():
			$PercentTimer.stop() # Para o timer se o texto tiver acabado
