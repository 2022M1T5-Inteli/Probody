extends Node

var boughtHabits = []
var playerScore = 0

func change_score(score):
	playerScore += score

func buy_habit(habitNode):
	boughtHabits.append(habitNode)
