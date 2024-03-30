extends CharacterBody2D

class_name Paddle


var camera_rect : Rect2
var halved_paddle : float
@export var camera: Camera2D
const SPEED = 100.0
var direction = Vector2.ZERO
var Ball_spawned :bool = false
var lock_y
@onready var ball = $"../Ball" as Ball



func _ready():
	lock_y = position.y
	camera_rect = camera.get_viewport_rect()
	halved_paddle = $CollisionShape2D.shape.get_rect().size.x / 4 * scale.x
	ball.position = position
	ball.position.y = lock_y-5

func _process(delta):
	position.y = lock_y
	var camera_start_x = camera.position.x - camera_rect.size.x / 8
	var camera_end_x = camera_start_x + camera_rect.size.x /4
	
	if global_position.x - halved_paddle < camera_start_x:
		global_position.x = camera_start_x + halved_paddle
	elif global_position.x + halved_paddle > camera_end_x:
		global_position.x = camera_end_x - halved_paddle
	
func _physics_process(delta):
	move_and_collide(SPEED * direction * delta)	
func _input(event):
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	elif  Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
	if direction != Vector2.ZERO and !Ball_spawned:
		ball.start_ball()
		Ball_spawned = true
	


