# Segue padrão comentado no Exercise.gd
extends Sprite
var text_position
func set_price(price):
	$PriceNumber.text = str(price)

func _process(_delta):
	if Global.playerScore >= int($PriceNumber.text):
		$Button.disabled = false
	
func set_icon(path):
	$Button.icon = load(path)

func _on_Button_pressed():
	if Global.playerScore >= int($PriceNumber.text) and Global.noUrologistVisit > 0:
		Music.play_buy_habit_sound()
		Global.change_score(-int($PriceNumber.text))
		$PointsIcon.hide()
		$PriceNumber.hide()
		$Button.hide()
		texture = load("res://assets/habitIcons/urologist-visit-check.png")
		Global.noUrologistVisit = 0
