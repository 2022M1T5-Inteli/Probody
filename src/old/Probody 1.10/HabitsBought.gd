# Nó do painel de hábitos comprados
extends Node2D

# Quando estiver visível, checar se cada hábito já foi comprado. Se sim, mostrar o ícone.
# Utilizamos "== 0" para verificar a compra porque, no futuro, caso desejemos criar upgrades
# para cada hábito, o valor variará entre 0 e 100 dependendo do upgrade comprado.
func _on_HabitsBoughtArea2D_habitsBoughtVisible():
	if Global.smoking == 0:
		$Panel/NoSmoking.show()
		
	if Global.sedentary == 0:
		$Panel/Sedentary.show()
		
	if Global.sunDaily == 0:
		$Panel/Suncream.show()
	
	if Global.irresponsableSex == 0:
		$Panel/Vaccine.show()
	
	if Global.noUrologistVisit == 0:
		$Panel/Urologist.show()
		
	if Global.unhealthyEating == 0:
		$Panel/HealthyEating.show()
		
	if Global.alcoholism == 0:
		$Panel/NoAlcohol.show()
	
	if Global.processedFood == 0:
		$Panel/NoProcessedFood.show()
		
	if Global.noMammogram == 0:
		$Panel/Mammogram.show()
	
