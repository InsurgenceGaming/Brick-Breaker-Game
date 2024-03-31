extends CharacterBody2D

class_name Ball

const VELCOITY_MAX = 50
@export var Ball_SPEED = 100
var Ball_damage : int = 1
var start_pos: Vector2

func _ready():
	start_pos = position
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * Ball_SPEED * delta)
	if (!collision):
		return
	velocity = velocity.bounce(collision.get_normal())
	if collision.get_collider().is_in_group("paddle") && collision.get_angle() > 0:
		velocity = velocity.bounce(collision.get_normal())
		velocity.y = -.8
		collision_layer = 0 
		collision_mask = 0 
		await get_tree().create_timer(.5).timeout
		collision_layer = 2
		collision_mask = 1
		# add a timer here and when the timer runs out reset the collision layer/mask to the correct settings
	if collision.get_collider().is_in_group("Brick"):
		collision.get_collider().Damage(Ball_damage)

func start_ball():
	randomize()
	velocity = (Vector2(randf_range(-1, 1), randf_range(-.1, -1)).normalized())

