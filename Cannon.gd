extends Node2D
@export var cannon_shot : PackedScene
var Cannon_shot : bool = false
func _process(delta):
	if Input.is_key_pressed(KEY_ALT) and !Cannon_shot:
		print(position)
		var projectile = cannon_shot.instantiate()
		print(projectile)
		get_node("/root/Node2D").add_child(projectile)
		print(projectile.position)
		projectile.position = position
		projectile.position.y = 78
		Cannon_shot = true
		print("Shot should be here")
		
