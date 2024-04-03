extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Ball"):
		print("I FOUND A BALL")
		body.fire_ball = true
		queue_free()
