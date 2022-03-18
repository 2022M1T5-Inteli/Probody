# Nó de pontuação. Altera o label de pontuação conforme mudanças na variável global relacionada.
extends Node2D

func _process(_delta):
	$ScoreNumber.text = str(Global.playerScore)
