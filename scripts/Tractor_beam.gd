extends Area2D


var Tractor_beam = preload("res://Scenes/tractorbeam.tscn")


func _on_body_entered(body):
	if body.is_in_group("paddle"):
		var Add_tractor = Tractor_beam.instantiate()
		body.add_child(Add_tractor)

func _physics_process(delta):
	position.y += 80 * delta
