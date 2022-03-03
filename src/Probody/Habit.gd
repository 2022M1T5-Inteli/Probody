extends Node2D
var text_position
func set_price(price):
	$PriceNumber.text = str(price)

func _process(delta):
	if Global.playerScore >= int($PriceNumber.text):
		$Button.disabled = false
	
func set_icon(path):
	$Button.icon = load(path)

func _on_Button_pressed():
	if Global.playerScore >= int($PriceNumber.text):
		Global.change_score(-int($PriceNumber.text))
		$PointsIcon.hide()
		$PriceNumber.text = "COMPRADO"
		$PriceNumber.rect_position.x -= 50
		text_position = $PriceNumber.rect_position.x
		$Button.disabled = true
		Global.buy_habit(self)
