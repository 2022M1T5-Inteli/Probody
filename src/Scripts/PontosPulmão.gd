extends RichTextLabel

var points = 0

func _ready():
	set_text("Pontos: "+str(points))
#Cria um campo de texto

func _on_Area2D_body_entered(body):
	points += 1
	set_text("Pontos: "+str(points))
#Adiciona 1 na variável "points", e muda o texto, utilizando seu novo valor
