# Nó da loja de hábitos. 
extends Node2D


# Troca a cena para a tela principal quando o botão VOLTAR é pressionado
func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Main.tscn")

func _ready():
	print(Global.boughtHabits)
	print($NoSmoking)
	$NoSmoking.set_icon("res://assets/habitIcons/no-smoking.png")
	$NoSmoking.set_price(10)

func _process(delta):
	if $NoSmoking in Global.boughtHabits:
		$NoSmoking/PointsIcon.hide()
		$NoSmoking/PriceNumber.text = "COMPRADO"
		$NoSmoking/PriceNumber.rect_position.x = $NoSmoking.text_position
		$NoSmoking/Button.disabled = true

