extends Node2D

func _ready():
	if Global.gender == "male":
		hide()
	set_cancer_type("Câncer de próstata")
	set_diagnosis("Diagnóstico: Exame de toque")
	set_risks("Maus hábitos gerais")
	set_preventions("res://assets/habitIcons/urologist-visit.png")
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
	$CancerBar.value = Global.cancerRisk[organ]

# Determina ícones a aparecer nas prevenções
func set_preventions(path1, path2 = "res://assets/habitIcons/salad.png", path3 = "res://assets/habitIcons/barbell.png"):
	$Prevention1.texture = load(path1)
	$Prevention2.texture = load(path2)
	$Prevention3.texture = load(path3)

