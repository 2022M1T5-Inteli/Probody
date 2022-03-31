# Nó do pop_up de detalhes do câncer
extends Node
	
# Determina texto a aparecer em TIPO DE CÂNCER
func set_cancer_type(text):
	$CancerType.text = text

# Determina texto a aparecer em DIAGNÓSTICO PRECOCE
func set_diagnosis(text):
	$Diagnosis.text += text

# Retira texto de diagnóstico
func set_no_diagnosis():
	$Diagnosis.text = ""

# # Determina texto a aparecer em FATORES DE RISCO
func set_risks(risk1, risk2 = "Má alimentação", risk3 = "Sedentarismo"): # Seleciona textos padrão para riscos 2 e 3
	$Risk1.text = risk1
	$Risk2.text = risk2
	$Risk3.text = risk3

# Altera valor na barra de risco de câncer
func set_cancer_bar(organ):
	var value
	var specificRiskFactor
	if organ == "lungs":
		specificRiskFactor = Global.smoking
	value = Global.basalRisk + int(Global.unhealthyEating) * 20 + int(Global.sedentary) * 20 + specificRiskFactor * 50
	$CancerBar.value = value

# Determina ícones a aparecer nas prevenções
func set_preventions(path1, path2, path3):
	$Prevention1.texture = path1
	$Prevention2.texture = path2
	$Prevention3.texture = path3
