# Nó do botão que faz Celinha aparecer e desaparecer
extends Button

# Troca o texto do botão
func _on_CelinhaAppear_toggled(button_pressed):
	if text == "OFF":
		set_text("ON")
	else:
		set_text("OFF")
