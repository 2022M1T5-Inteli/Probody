# Nó do corpo humano com todos os órgãos clicáveis
extends Node

# Função que troca a tela principal pela tela do pulmão no momento do clique 
# sobre a Area2D. Em suma, checa se o evento foi um botão de mouse 
# + o botão esquerdo do mouse + se está pressionado. Depois, troca a cena.
func _on_LungArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		get_tree().change_scene("res://Lungs.tscn")

# Função que troca a tela principal pela tela do intestino. Segue a mesma
# lógica da primeira, porém ainda não troca a cena, pois a cena-destino ainda 
# não foi implementada.
func _on_InstestinesArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")

# Função que troca a tela principal pela tela do útero. Segue a mesma
# lógica da primeira, porém ainda não troca a cena, pois a cena-destino ainda 
# não foi implementada.
func _on_UterusArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")

# Função que troca a tela principal pela tela do fígado. Segue a mesma
# lógica da primeira, porém ainda não troca a cena, pois a cena-destino ainda 
# não foi implementada.
func _on_LiverArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		get_tree().change_scene("res://Liver.tscn")

# Função que troca a tela principal pela tela do estômago. Segue a mesma
# lógica da primeira, porém ainda não troca a cena, pois a cena-destino ainda 
# não foi implementada.
func _on_StomachArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")

# Função que troca a tela principal pela tela da pele. Segue a mesma
# lógica da primeira, porém ainda não troca a cena, pois a cena-destino ainda 
# não foi implementada.
func _on_SkinArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		print("Click")
