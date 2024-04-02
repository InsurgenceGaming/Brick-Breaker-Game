extends CharacterBody2D

class_name Paddle

var Lives : int = 3
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

func _process(delta):
	position.y = lock_y
	var camera_start_x = camera.position.x - camera_rect.size.x / 8
	var camera_end_x = camera_start_x + camera_rect.size.x /4
	
	if global_position.x - halved_paddle < camera_start_x:
		global_position.x = camera_start_x + halved_paddle
	elif global_position.x + halved_paddle > camera_end_x:
		global_position.x = camera_end_x - halved_paddle
	
func _physics_process(delta):	
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT * SPEED
	elif  Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT  * SPEED
	else:
		velocity = Vector2.ZERO
	if velocity != Vector2.ZERO and !Ball_spawned:
		ball.start_ball()
		Ball_spawned = true
	move_and_slide()

	
@export var new_ball : PackedScene
func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		var ball = new_ball.instantiate()
		print(ball)
		get_tree().root.add_child(ball)
		ball.start_ball()
		ball.position = position
		ball.position.y + 10
		print("ball should be here")


