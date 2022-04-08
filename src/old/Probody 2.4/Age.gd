extends Label

var ages = ["adolescente", "jovem", "adulto", "meia-idade", "idoso" ]
var currentAge = "adolescente"
var next = 0


func _process(delta):
	self.text = currentAge
	if next == 4:
		next = -1

# Altera a idade quando um timer da Global acabar
func _on_Timer_timeout():
	next += 1
	currentAge = ages[next]
