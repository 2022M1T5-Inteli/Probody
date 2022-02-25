# Nó do pop_up de detalhes do câncer
extends Node

# Determina texto a aparecer em TIPO DE CÂNCER
func set_cancer_type(text):
	$CancerType.text = text

# Determina texto a aparecer em DIAGNÓSTICO PRECOCE
func set_diagnosis(text):
	$Diagnosis.text += text

# # Determina texto a aparecer em FATORES DE RISCO
func set_risks(risk1, risk2, risk3):
	$Risk1.text = risk1
	$Risk2.text = risk2
	$Risk3.text = risk3

# Altera valor na barra de risco de câncer
func set_cancer_bar(value):
	$CancerBar.value = value

# Determina ícones a aparecer nas prevenções
func set_preventions(path1, path2, path3):
	$Prevention1.texture = path1
	$Prevention2.texture = path2
	$Prevention3.texture = path3
