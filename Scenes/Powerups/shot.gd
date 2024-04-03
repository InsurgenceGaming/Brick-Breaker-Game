extends Area2D

func _physics_process(delta):
	position.y -= 80 * delta


func _on_body_entered(body):
	if body.is_in_group("Brick"):
		body.Damage(body.Hits_to_break)
