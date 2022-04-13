# Nó da loja de hábitos. 
extends Node2D
	
	
# Define imagens e preços para cada hábito e pausa o flow do jogo
func _ready():
	Global.SpawnTimer.stop()
	Global.DeathBarTimer.stop()
	$GridContainer/NoSmoking.set_icon("res://assets/habitIcons/no-smoking.png")
	$GridContainer/NoSmoking.set_price(35)
	$GridContainer/Exercise.set_icon("res://assets/habitIcons/barbell.png")
	$GridContainer/Exercise.set_price(40)
	$GridContainer/HealthyEating.set_icon("res://assets/habitIcons/salad.png")
	$GridContainer/HealthyEating.set_price(40)
	$GridContainer/Sunscream.set_icon("res://assets/habitIcons/suncream.png")
	$GridContainer/Sunscream.set_price(20)
	$GridContainer/Urologist.set_icon("res://assets/habitIcons/urologist-visit.png")
	$GridContainer/Urologist.set_price(25)
	$GridContainer/NoAlcohol.set_icon("res://assets/habitIcons/no-alcohol.png")
	$GridContainer/NoAlcohol.set_price(30)
	$GridContainer/NoProcessedFood.set_icon("res://assets/habitIcons/no-processed-food.png")
	$GridContainer/NoProcessedFood.set_price(25)
	$GridContainer/Vaccine.set_icon("res://assets/habitIcons/vaccine.png")
	$GridContainer/Vaccine.set_price(25)
	
	# Define qual hábito deve aparecer com base no gênero escolhido pelo jogador
	if Global.gender == "female":
		$GridContainer/Urologist.visible = false
	if Global.gender == "male":
		$GridContainer/Vaccine.visible = false
	
	
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
		
		
# Troca a cena para a tela principal quando o botão VOLTAR é pressionado
func _on_ReturnButton_pressed():
	Global.tree = get_tree().change_scene("res://scenes/Main.tscn")
	if Global.textFinished:
		Global.SpawnTimer.start()
		Global.DeathBarTimer.start()
	
	
#Função usada para verificar se algum hábito foi comprado
func buttonPressed():
	if Global.smoking == 0:
		Global.justBoughtsmoking += 1
	if Global.sedentary == 0:
		Global.justBoughtsedentary += 1
	if Global.unhealthyEating == 0:
		Global.justBoughtUnhealthyEating += 1
	if Global.irresponsableSex == 0:
		Global.justBoughtirresponsableSex += 1
	if Global.processedFood == 0:
		Global.justBoughtprocessedFood += 1
	if Global.alcoholism == 0:
		Global.justBoughtalcoholism += 1
	if Global.noMammogram == 0:
		Global.justBoughtnoMammogram += 1
	if Global.sunDaily == 0:
		Global.justBoughtsunDaily += 1
	if Global.noUrologistVisit == 0:
		Global.justBoughtnoUrologistVisit += 1

# Funções usadas para verificar se algum dos botões de compra da loja de hábitos foi pressionada
func _on_Exercise_buttonPressed():
	buttonPressed()
func _on_Sunscream_buttonPressed():
	buttonPressed()
func _on_Urologist_buttonPressed():
	buttonPressed()
func _on_NoAlcohol_buttonPressed():
	buttonPressed()
func _on_NoProcessedFood_buttonPressed():
	buttonPressed()
func _on_Vaccine_buttonPressed():
	buttonPressed()
func _on_NoSmoking_buttonPressed():
	buttonPressed()
