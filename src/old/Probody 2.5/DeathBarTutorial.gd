extends ProgressBar

# Faz a barra do tutorial crescer
func _process(delta):
	if visible:
		$Timer.start()
		
func _on_Timer_timeout():
	yield(get_tree().create_timer(0.5), "timeout")
	value -= 0.3
