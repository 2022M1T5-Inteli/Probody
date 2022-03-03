# Nó que controla o contêiner de notícias na parte superior da tela.
extends Node

# Cria sinal para indicar que o texto apareceu por completo
signal textReady

# Define os caracteres visíveis do texto para 0 assim que o nó carregar; assim, 
# não aparecerá nenhum texto logo no início.
func _ready():
	$News.visible_characters = 0

# Determina o texto a aparecer na barra
func set_news(news):
	$News.text = news
	$TextTimer.start()

# Mostra o texto
func display_news():
	if $News.visible_characters < $News.text.length():
		$News.visible_characters += 1
	else: 
		$TextTimer.stop()
		emit_signal("textReady")
	
	
	

