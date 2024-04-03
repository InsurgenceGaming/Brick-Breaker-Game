extends Node2D
@export var cannon_shot : PackedScene
func _process(delta):
	if Input.is_key_pressed(KEY_ALT):
		print(position)
		var projectile = cannon_shot.instantiate()
		print(projectile)
		get_node("/root/Node2D").add_child(projectile)
		projectile.position.x = global_position.x
		projectile.position.y = 300
		queue_free()
		remove_from_group("Powerups")
		print("Shot should be here")

		
