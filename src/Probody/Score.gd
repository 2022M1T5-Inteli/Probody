# Nó de pontuação
extends Node2D
# Função que aumenta ou diminui a pontuação no label ScoreNumber. Para diminuir,
# um argumento negativo deve ser passado.
func _process(delta):
	$ScoreNumber.text = str(Global.playerScore)
	
