extends Area2D

@export var new_ball : PackedScene
@export var amount_to_spawn: int = 10

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		body.Lives += 1
		print(body.Lives)
		remove_from_group("Powerups")
		queue_free()
func _physics_process(delta):
	position.y += 180 * delta
		
