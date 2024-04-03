extends Area2D

@export var new_ball : PackedScene
@export var amount_to_spawn: int = 10

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		ball_spawner(amount_to_spawn,body)
		queue_free()
		remove_from_group("Powerups")
func _physics_process(delta):
	position.y += 60 * delta
		
func ball_spawner(amount,paddle_body):
	for i in amount:
		var ball = new_ball.instantiate()
		print(ball)
		get_node("/root/Node2D").add_child(ball)
		ball.start_ball()
		ball.position = paddle_body.position
		print("ball should be here")
		
