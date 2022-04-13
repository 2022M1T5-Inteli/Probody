# Segue padrão comentado no Exercise.gd
extends Sprite
var text_position
signal buttonPressed

# Define a descrição do hábito
func _ready():
	$Description.text = "Evitar comida processada" 
	
# Controla se o botão está ativado ou não de acordo com pontuação do jogador
func _process(_delta):
	if Global.playerScore >= int($PriceNumber.text):
		$Button.disabled = false
	if Global.processedFood == 0:
		$Button.disabled = false

# define preço	
func set_price(price):
	$PriceNumber.text = str(price)

# Define ícone
func set_icon(path):
	$Button.icon = load(path)

# Ao clicar para comprar o hábito, verifica se o jogador tem pontos suficientes
# caso ele tenha pontos suficientes, toca o som da compra, retira os pontos gastos para comprar o hábit
# e define ele como comprado
func _on_Button_pressed():
	if Global.playerScore >= int($PriceNumber.text) and Global.processedFood > 0:
		Music.play_buy_habit_sound()
		Global.change_score(-int($PriceNumber.text))
		$PointsIcon.hide()
		$PriceNumber.hide()
		$Button.hide()
		texture = load("res://assets/habitIcons/no-processed-food-check.png")
		Global.processedFood = 0
		emit_signal("buttonPressed")
