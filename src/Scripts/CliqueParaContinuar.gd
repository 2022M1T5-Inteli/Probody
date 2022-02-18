extends RichTextLabel

func _ready():
	set_text("Pressione qualquer botão para prosseguir")
#Cria um campo de texto
	
func _on_Timer_timeout():
	visible=true
#Faz o campo de texto tornar-se visível quando o Timer acabar

func _on_Timer2_timeout():
	visible=false
#Faz o campo de texto tornar-se visível quando o Timer2 acabar
