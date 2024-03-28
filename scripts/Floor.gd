extends Area2D




func _on_body_entered(body):
	if body.is_in_group("Ball"):
		body.position = Vector2(1,1)
		#body.queue_free()
