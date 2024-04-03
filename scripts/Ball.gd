extends CharacterBody2D

class_name Ball

const VELCOITY_MAX = 50
@export var Ball_SPEED = 400
var Ball_damage : int = 1
var start_pos: Vector2
var collided_with_paddle : bool = false
var collided_with_Beam : bool = false
var fire_ball = false



func _ready():
	start_pos = position
	

func _physics_process(delta):
	var collision = move_and_collide(velocity * Ball_SPEED * delta)
	if (!collision):
		return
	
	if collision.get_collider().is_in_group("paddle")&& !collided_with_paddle:
		if collision.get_angle()>0.5:
			velocity = -velocity.bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		collided_with_paddle = true
		await get_tree().create_timer(.5).timeout
		collided_with_paddle = false
		#print(collision.get_angle())
		#print(collided_with_paddle)
	elif !collision.get_collider().is_in_group("paddle") && !collision.get_collider().is_in_group("TractorBeam"):
		velocity = velocity.bounce(collision.get_normal())
		
		
	if fire_ball and collision.get_collider().is_in_group("Brick"):
		collision.get_collider().Damage(Ball_damage * 4)
	elif collision.get_collider().is_in_group("Brick"):
		collision.get_collider().Damage(Ball_damage)



func start_ball():
	randomize()
	velocity = (Vector2(randf_range(-1, 1), randf_range(-.1, -1)).normalized())

