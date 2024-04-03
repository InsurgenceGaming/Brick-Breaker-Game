extends Area2D


var Cannon = preload("res://Scenes/Powerups/cannon.tscn")


func _on_body_entered(body):
	if body.is_in_group("paddle"):
		var Add_cannon = Cannon.instantiate()
		body.add_child(Add_cannon)
		Add_cannon.position.y = global_position.y - 300
	queue_free()

func _physics_process(delta):
	position.y += 180 * delta
