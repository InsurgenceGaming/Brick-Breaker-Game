extends Area2D

var fire_ball = preload("res://Fire_ball.tscn")


func _physics_process(delta):
	position.y += 180 * delta

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		var Add_fireball = fire_ball.instantiate()
		Add_fireball.position.y -= 1
		body.add_child(Add_fireball)
		queue_free()
		remove_from_group("Powerups")

