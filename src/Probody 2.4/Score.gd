# Nó de pontuação
extends Node2D

# Altera o label de pontuação conforme mudanças na variável global relacionada.
func _process(_delta):
	$ScoreNumber.text = str(Global.playerScore)
