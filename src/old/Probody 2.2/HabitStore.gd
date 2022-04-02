# Nó da loja de hábitos. 
extends Node2D

# Troca a cena para a tela principal quando o botão VOLTAR é pressionado
func _on_ReturnButton_pressed():
	Global.tree = get_tree().change_scene("res://Main.tscn")

func _ready():
	# Define imagens e preços para cada hábito
	$GridContainer/NoSmoking.set_icon("res://assets/habitIcons/no-smoking.png")
	$GridContainer/NoSmoking.set_price(10)
	$GridContainer/Exercise.set_icon("res://assets/habitIcons/barbell.png")
	$GridContainer/Exercise.set_price(10)
	$GridContainer/HealthyEating.set_icon("res://assets/habitIcons/salad.png")
	$GridContainer/HealthyEating.set_price(10)
	$GridContainer/Sunscream.set_icon("res://assets/habitIcons/suncream.png")
	$GridContainer/Sunscream.set_price(10)
	$GridContainer/Mammogram.set_icon("res://assets/habitIcons/mammogram.png")
	$GridContainer/Mammogram.set_price(10)
	$GridContainer/Urologist.set_icon("res://assets/habitIcons/urologist-visit.png")
	$GridContainer/Urologist.set_price(10)
	$GridContainer/NoAlcohol.set_icon("res://assets/habitIcons/no-alcohol.png")
	$GridContainer/NoAlcohol.set_price(10)
	$GridContainer/NoProcessedFood.set_icon("res://assets/habitIcons/no-processed-food.png")
	$GridContainer/NoProcessedFood.set_price(10)
	$GridContainer/Vaccine.set_icon("res://assets/habitIcons/vaccine.png")
	$GridContainer/Vaccine.set_price(10)
	
	# Mantém hábitos comprados com aparência de comprados se a página for recarregada.
	# Para tanto, se o hábito tiver sido comprado, o preço desaparace e o ícone muda.
	if Global.smoking == 0:
		$GridContainer/NoSmoking/PointsIcon.hide()
		$GridContainer/NoSmoking/PriceNumber.hide()
		$GridContainer/NoSmoking/Button.icon = load("res://assets/habitIcons/no-smoking-check.png")
	if Global.sedentary == 0:
		$GridContainer/Exercise/PointsIcon.hide()
		$GridContainer/Exercise/PriceNumber.hide()
		$GridContainer/Exercise/Button.icon = load("res://assets/habitIcons/barbell-check.png")
	if Global.unhealthyEating == 0:
		$GridContainer/HealthyEating/PointsIcon.hide()
		$GridContainer/HealthyEating/PriceNumber.hide()
		$GridContainer/HealthyEating/Button.icon = load("res://assets/habitIcons/salad-check.png")
	if Global.irresponsableSex == 0:
		$GridContainer/Vaccine/PointsIcon.hide()
		$GridContainer/Vaccine/PriceNumber.hide()
		$GridContainer/Vaccine/Button.icon = load("res://assets/habitIcons/vaccine-check.png")
	if Global.processedFood == 0:
		$GridContainer/NoProcessedFood/PointsIcon.hide()
		$GridContainer/NoProcessedFood/PriceNumber.hide()
		$GridContainer/NoProcessedFood/Button.icon = load("res://assets/habitIcons/no-processed-food-check.png")
	if Global.alcoholism == 0:
		$GridContainer/NoAlcohol/PointsIcon.hide()
		$GridContainer/NoAlcohol/PriceNumber.hide()
		$GridContainer/NoAlcohol/Button.icon = load("res://assets/habitIcons/no-alcohol-check.png")
	if Global.noMammogram == 0:
		$GridContainer/Mammogram/PointsIcon.hide()
		$GridContainer/Mammogram/PriceNumber.hide()
		$GridContainer/Mammogram/Button.icon = load("res://assets/habitIcons/mammogram-check.png")
	if Global.sunDaily == 0:
		$GridContainer/Sunscream/PointsIcon.hide()
		$GridContainer/Sunscream/PriceNumber.hide()
		$GridContainer/Sunscream/Button.icon = load("res://assets/habitIcons/sunscream-check.png")
	if Global.noUrologistVisit == 0:
		$GridContainer/Urologist/PointsIcon.hide()
		$GridContainer/Urologist/PriceNumber.hide()
		$GridContainer/Urologist/Button.icon = load("res://assets/habitIcons/urologist-visit-check.png")
