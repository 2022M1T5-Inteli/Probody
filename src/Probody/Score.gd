# Nó de pontuação
extends Node2D
# Função que aumenta ou diminui a pontuação no label ScoreNumber. Para diminuir,
# um argumento negativo deve ser passado.
func change_score(score):
	var currentScore = int($ScoreNumber.text) # Transforma o texto em int para guardar em uma variável
	currentScore += int(score) # Soma pontos passados para a função
	$ScoreNumber.text = str(currentScore) # Transfoma o int new_score em texto e o coloca no ScoreNumber
	
