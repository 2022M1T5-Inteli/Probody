# Nó da barra/contêiner inferior. Este script controla o aparecimento e 
# desaparecimento dos pop-ups dos ícones de câncer. Implementado apenas para o 
# ícone de pulmão por agora.
extends Node

# Esconde o pop-up de detalhes de câncer ao carregar o nó. 
# Será incrementado para esconder todos os ícones quando estes forem criados.
func _ready():
	$LungCancer.hide()
	$ChosenName.text = Global.chosenName # Pega o nome guardado na Global.
	if Global.gender == "female":
		$Uterus.show()
		$Prostate.hide()
	if Global.gender == "male":
		$Prostate.show()
		$Uterus.hide()

# Mostra o pop-up de câncer de pulmão quando o mouse "hover" em cima dele
func _on_Lungs_mouse_entered():
	Global.get_cancer_risk()
	$LungCancer.set_cancer_bar(Global.ORGANS.LUNGS)
	$LungCancer.show()

# Esconde o o pop-up de câncer de pulmão quando o mouse sai em cima dele
func _on_Lungs_mouse_exited():
	$LungCancer.hide()

# Altera o texto entre as idades do avatar
func _process(_delta):
	$AgeBracket.text = Global.currentAge

func _on_Stomach_mouse_entered():
	Global.get_cancer_risk()
	$StomachCancer.set_cancer_bar(Global.ORGANS.STOMACH)
	$StomachCancer.show()


func _on_Stomach_mouse_exited():
	$StomachCancer.hide()


func _on_Liver_mouse_entered():
	Global.get_cancer_risk()
	$LiverCancer.set_cancer_bar(Global.ORGANS.LIVER)
	$LiverCancer.show()


func _on_Liver_mouse_exited():
	$LiverCancer.hide()


func _on_Skin_mouse_entered():
	Global.get_cancer_risk()
	$SkinCancer.set_cancer_bar(Global.ORGANS.SKIN)
	$SkinCancer.show()


func _on_Skin_mouse_exited():
	$SkinCancer.hide()


func _on_Intestines_mouse_entered():
	Global.get_cancer_risk()
	$IntestinesCancer.set_cancer_bar(Global.ORGANS.INTESTINES)
	$IntestinesCancer.show()


func _on_Intestines_mouse_exited():
	$IntestinesCancer.hide()


func _on_Uterus_mouse_entered():
	if Global.gender == "female":
		Global.get_cancer_risk()
		$UterusCancer.set_cancer_bar(Global.ORGANS.UTERUS)
		$UterusCancer.show()

func _on_Uterus_mouse_exited():
	$UterusCancer.hide()

func _on_Prostate_mouse_entered():
	if Global.gender == "male":
		Global.get_cancer_risk()
		$ProstateCancer.set_cancer_bar(Global.ORGANS.PROSTATE)
		$ProstateCancer.show()


func _on_Prostate_mouse_exited():
	if Global.gender == "male":
		$ProstateCancer.hide()
