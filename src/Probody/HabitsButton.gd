# Nó que controla pop-up de hábitos comprados
extends Area2D

# Cria sinal que indica que hábitos estão visíveis
signal habitsBoughtVisible

# Deixa painel escondido ao carregar
func _ready():
	$HabitsBoughtNode/Panel.hide()

# Ao 'hover' o mouse sobre o ícone, mostra painel e emite sinal.
func _on_HabitsBoughtArea2D_mouse_entered():
	$HabitsBoughtNode/Panel.show()
	emit_signal("habitsBoughtVisible")

# Ao parar de 'hover' o mouse, esconde o painel.
func _on_HabitsBoughtArea2D_mouse_exited():
	$HabitsBoughtNode/Panel.hide()
