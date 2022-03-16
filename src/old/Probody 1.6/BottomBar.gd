# Nó da barra/contêiner inferior. Este script controla o aparecimento e 
# desaparecimento dos pop-ups dos ícones de câncer. Implementado apenas para o 
# ícone de pulmão por agora.
extends Node

# Esconde o pop-up de detalhes de câncer ao carregar o nó. 
# Será incrementado para esconder todos os ícones quando estes forem criados.
func _ready():
	$LungCancer.hide()

# Mostra o pop-up de câncer de pulmão quando o mouse "hover" em cima dele
func _on_Lungs_mouse_entered():
	$LungCancer.set_cancer_bar("lungs")
	$LungCancer.set_cancer_type("Câncer de pulmão")
	$LungCancer.set_diagnosis("")
	$LungCancer.set_risks("Fumar")
	$LungCancer.show()

# Esconde o o pop-up de câncer de pulmão quando o mouse sai em cima dele
func _on_Lungs_mouse_exited():
	$LungCancer.hide()

# Altera o texto entre as idades do avatar
func _process(delta):
	$AgeBracket.text = Global.currentAge
