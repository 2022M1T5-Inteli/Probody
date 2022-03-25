# Nó do corpo humano com todos os órgãos clicáveis
extends Node

# Funções que trocam a tela principal pela tela do pulmão no momento do clique 
# sobre a Area2D. Em suma, checam se o evento foi um botão de mouse 
# + o botão esquerdo do mouse + se está pressionado. Depois, trocam a cena e pausam a música.
func _on_LeftLungArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Lungs.tscn")

func _on_RightLungArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Lungs.tscn")

# Função que troca a tela principal pela tela do intestino. Segue a mesma
# lógica das primeiras.
func _on_InstestinesArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Intestines.tscn")
		
# Função que troca a tela principal pela tela do útero..
func _on_UterusArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Ovaries.tscn")

# Função que troca a tela principal pela tela do fígado.
func _on_LiverArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Liver.tscn")

# Função que troca a tela principal pela tela do estômago.
func _on_StomachArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Stomach.tscn")

# Função que troca a tela principal pela tela da pele. A ser implementado.
func _on_SkinArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")

# Função que troca a tela principal pela tela da próstata.
func _on_ProstateArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		Global.pause_regular_music()
		Global.tree = get_tree().change_scene("res://Prostate.tscn")
