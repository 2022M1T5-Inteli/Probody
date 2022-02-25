extends KinematicBody2D

var speed = 300
var direction = Vector2(0,0)
#variáveis utilizadas para criar a função de movimento

func _physics_process(delta):
	movimento()
#Ativa a função de movimento
	
func _process(delta):
	pass
	
func movimento():
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))) / float(2)
	var movimento = direction.normalized() * speed
	move_and_slide(movimento)
#função de movimento para o linfóssito
