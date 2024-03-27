extends CharacterBody2D

class_name Ball

const VELCOITY_MAX = 50
@export var Ball_SPEED = 20

var start_pos: Vector2

func _ready():
	start_pos = position
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * Ball_SPEED * delta)
	if (!collision):
		return
	velocity = velocity.bounce(collision.get_normal())
	
	if collision.get_collider().is_in_group("Brick"):
		collision.get_collider().Damage(1)

func start_ball():
	position = start_pos
	randomize()
	velocity = (Vector2(randf_range(-1, 1), randf_range(-.1, -1)).normalized())

