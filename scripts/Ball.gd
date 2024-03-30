extends RigidBody2D

class_name Ball

const VELCOITY_MAX = 50
@export var Ball_SPEED = 75

var start_pos: Vector2

func _ready():
	start_pos = position
	print("ball ready!")
	

func _physics_process(delta):
	pass


func start_ball():
	randomize()
	var direction = Vector2(randf_range(-1, 1), randf_range(-3.5,-4))
	print(direction)
	linear_velocity = direction * Ball_SPEED
	print("ball started")
	set_freeze_enabled(false)



func _on_body_entered(body):
	if body.is_in_group("Brick"):
		body.Damage(1)
		print("I hit a brick")
