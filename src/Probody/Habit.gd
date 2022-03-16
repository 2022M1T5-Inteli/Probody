# Nó de hábito
extends Sprite

# Define preço do hábito
func set_price(price):
	$PriceNumber.text = str(price)

# Valida se o hábito pode ser comprado
func _process(delta):
	if Global.playerScore >= int($PriceNumber.text):
		$Button.disabled = false
	
# Troca ícone do hábito
func set_icon(path):
	$Button.icon = load(path)

# Efetua a compra do hábito
func _on_Button_pressed():
	if Global.playerScore >= int($PriceNumber.text):
		Global.change_score(-int($PriceNumber.text))
		$PointsIcon.hide()
		$PriceNumber.hide()
		set_icon("res://assets/habitIcons/nosmoking.png")
		
