extends Node2D
var noMammogramCheck = true
var noMammogram = Sprite.new()
var processedFoodCheck = true
var processedFood = Sprite.new()
var alcoholismCheck = true
var alcoholism = Sprite.new()
var unhealthyEatingCheck = true
var unhealthyEating = Sprite.new()
var noUrologistVisitCheck = true
var noUrologistVisit = Sprite.new()
var irresponsableSexCheck = true
var irresponsableSex = Sprite.new()
var sunDailyCheck = true
var sunDaily = Sprite.new()
var sedentaryCheck = true
var sedentary = Sprite.new()
var smokingCheck = true
var smoking = Sprite.new()
func _process(_delta):
	pass
func _on_HabitsBoughtArea2D_habitsBoughtVisible():
	
	if Global.smoking == 0 and smokingCheck:
		smoking.texture = load("res://assets/habitIcons/no-smoking.png")
		smoking.position = Vector2(115, 240)
		smoking.scale = Vector2(0.3, 0.3)
		add_child(smoking)
		smokingCheck = false
		smoking.visible = false
		
	if Global.sedentary == 0 and sedentaryCheck:
		sedentary.texture = load("res://assets/habitIcons/barbell.png")
		sedentary.position = Vector2(115, 280)
		sedentary.scale = Vector2(0.3, 0.3)
		add_child(sedentary)
		sedentaryCheck = false
		sedentary.visible = false
		
	if Global.sunDaily == 0 and sunDailyCheck:
		sunDaily.texture = load("res://assets/habitIcons/suncream.png")
		sunDaily.position = Vector2(115, 320)
		sunDaily.scale = Vector2(0.3, 0.3)
		add_child(sunDaily)
		sunDailyCheck = false
		sunDaily.visible = false
		
	if Global.irresponsableSex == 0 and irresponsableSexCheck:
		irresponsableSex.texture = load("res://assets/habitIcons/vaccine.png")
		irresponsableSex.position = Vector2(115, 360)
		irresponsableSex.scale = Vector2(0.3, 0.3)
		add_child(irresponsableSex)
		irresponsableSexCheck = false
		irresponsableSex.visible = false
		
	if Global.noUrologistVisit == 0 and noUrologistVisitCheck:
		noUrologistVisit.texture = load("res://assets/habitIcons/urologist-visit.png")
		noUrologistVisit.position = Vector2(115, 400)
		noUrologistVisit.scale = Vector2(0.3, 0.3)
		add_child(noUrologistVisit)
		noUrologistVisitCheck = false
		noUrologistVisit.visible = false
		
	if Global.unhealthyEating == 0 and unhealthyEatingCheck:
		unhealthyEating.texture = load("res://assets/habitIcons/salad.png")
		unhealthyEating.position = Vector2(115, 440)
		unhealthyEating.scale = Vector2(0.3, 0.3)
		add_child(unhealthyEating)
		unhealthyEatingCheck = false
		unhealthyEating.visible = false
		
	if Global.alcoholism == 0 and alcoholismCheck:
		alcoholism.texture = load("res://assets/habitIcons/no-alcohol.png")
		alcoholism.position = Vector2(155, 240)
		alcoholism.scale = Vector2(0.3, 0.3)
		add_child(alcoholism)
		alcoholismCheck = false
		alcoholism.visible = false
		
	if Global.processedFood == 0 and processedFoodCheck:
		processedFood.texture = load("res://assets/habitIcons/no-processed-food.png")
		processedFood.position = Vector2(155, 280)
		processedFood.scale = Vector2(0.3, 0.3)
		add_child(processedFood)
		processedFoodCheck = false
		processedFood.visible = false
		
	if Global.noMammogram == 0 and noMammogramCheck:
		noMammogram.texture = load("res://assets/habitIcons/mammogram.png")
		noMammogram.position = Vector2(155, 320)
		noMammogram.scale = Vector2(0.3, 0.3)
		add_child(noMammogram)
		noMammogramCheck = false
		noMammogram.visible = false
		
	smoking.visible = !smoking.visible
	sedentary.visible = !sedentary.visible
	sunDaily.visible = !sunDaily.visible
	irresponsableSex.visible = !irresponsableSex.visible
	noUrologistVisit.visible = !noUrologistVisit.visible
	unhealthyEating.visible = !unhealthyEating.visible
	alcoholism.visible = !alcoholism.visible
	processedFood.visible = !processedFood.visible
	noMammogram.visible = !noMammogram.visible
