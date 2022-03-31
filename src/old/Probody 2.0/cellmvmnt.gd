extends KinematicBody2D

onready var speed = 8
onready var velocity=Vector2(15,15)

func _physics_process(delta):
	var collision=move_and_collide(velocity*delta*speed)
	if collision:
		velocity=velocity.bounce(collision.normal)
