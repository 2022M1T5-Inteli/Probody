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

# Mostra o texto
func display_news():
	# Loop que deixa mais um caractere vísivel a cada 0,1 segundo enquanto 
	# o total de caracteres visíveis for menor do que o número caracteres do texto.
	while $News.visible_characters < $News.text.length():
		# Espera que um timer de 0,1 segundos termine (sinal "timeout") antes 
		# de somar 1 a número de caracteres visíveis
		yield(get_tree().create_timer(0.1), "timeout")
		$News.visible_characters += 1
	# Emitir sinal de que o texto apareceu por completo. Este sinal está conectado
	# ao yield() da função tutorial() no script FemaleBody.gd.
	emit_signal("textReady")
	

