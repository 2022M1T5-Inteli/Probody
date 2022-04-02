# Nó de hábito de exercício. Todos os outros seguem este padrão.
extends Sprite

var text_position

# Define preço
func set_price(price):
	$PriceNumber.text = str(price)

# Controla se o botão está ativado ou não de acordo com pontuação do jogador
func _process(_delta):
	if Global.playerScore >= int($PriceNumber.text):
		$Button.disabled = false

# Define ícone
func set_icon(path):
	$Button.icon = load(path)

# Se o jogador tiver pontos suficientes...
func _on_Button_pressed():
	if Global.playerScore >= int($PriceNumber.text) and Global.sedentary > 0:
		Music.play_buy_habit_sound() # Toca som de compra
		Global.change_score(-int($PriceNumber.text)) # Muda pontuação
		# Esconde preço
		$PointsIcon.hide()
		$PriceNumber.hide()
		# Troca ícone pelo de comprado e zera risco no script global
		$Button.icon = load("res://assets/habitIcons/barbell-check.png")
		Global.sedentary = 0
