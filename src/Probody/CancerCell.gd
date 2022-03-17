extends KinematicBody2D

var growingCounter = 0
var eatenByCelinha = false

func _process(_delta):
	if growingCounter < 500: # Aumenta célula cancerosa por certo período segundo um timer
		var growTime = Timer.new()
		growTime.set_wait_time(0.1)
		growTime.set_one_shot(true)
		self.add_child(growTime)
		growTime.start()
		yield(growTime, "timeout")
		$BadMoleculeImage.scale.x *= 1.002
		$BadMoleculeImage.scale.y *= 1.002
		$BadMoleculeCollisionShape2D.scale.x *= 1.002
		$BadMoleculeCollisionShape2D.scale.y *= 1.002
		growingCounter += 1
	elif not eatenByCelinha: 
		Global.tree = get_tree().change_scene("res://GameOver.tscn")
