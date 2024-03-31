extends Area2D




func _on_body_entered(body):
	if body.is_in_group("Ball"):
		body.queue_free()
		body.remove_from_group("Ball")
		#body.position = Vector2(1,1)
		var balls_remaining = get_tree().get_nodes_in_group("Ball")
		if balls_remaining.size() == 0:
			print("No balls remain")

		#body.queue_free()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("Powerups"):
		area.remove_from_group("Powerups")
		area.queue_free()
		print("i removed a powerup")
