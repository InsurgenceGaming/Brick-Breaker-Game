extends CharacterBody2D

class_name Paddle

@export var Lives_HUD : Label
var Lives : int = 3
var camera_rect : Rect2
var halved_paddle : float
@export var camera: Camera2D
var SPEED = 300
var direction = Vector2.ZERO
var Ball_spawned :bool = false
var lock_y
@onready var ball = $"../Ball" as Ball

var fire_ball : bool = false


func _ready():
	Lives_HUD.text = str("Lives: ", Lives)
	lock_y = position.y
	camera_rect = camera.get_viewport_rect()
	halved_paddle = $CollisionShape2D.shape.get_rect().size.x / 2 * scale.x
	ball.position = position

func _process(delta):
	position.y = lock_y
	var camera_start_x = camera.position.x - camera_rect.size.x / 2
	var camera_end_x = camera_start_x + camera_rect.size.x
	
	if global_position.x - halved_paddle < camera_start_x:
		global_position.x = camera_start_x + halved_paddle
	elif global_position.x + halved_paddle > camera_end_x:
		global_position.x = camera_end_x - halved_paddle
	
func _physics_process(delta):
	if Input.is_action_pressed("Paddle_move_left"):
		velocity = Vector2.LEFT * SPEED
	elif  Input.is_action_pressed("Paddle_move_right"):
		velocity = Vector2.RIGHT  * SPEED
	else:
		velocity = Vector2.ZERO
	if velocity != Vector2.ZERO and !Ball_spawned and is_instance_valid(ball):
		ball.start_ball()
		Ball_spawned = true
		print(Ball_spawned)
	move_and_slide()

func Lives_added():
	Lives += 1
	Lives_HUD.text = str("Lives: ", Lives)
	

func Lives_lost(lost_lives):
	if Lives == 0:
		await get_tree().create_timer(5.0).timeout
		get_tree().quit()
		
	else: 
		Lives -= lost_lives
		Ball_spawned = false
		print(Ball_spawned)
		position.x = Vector2.ZERO.x
		ball = new_ball.instantiate()
		print(ball)
		get_node("/root/Node2D").add_child(ball)
		ball.name = "Ball"
		ball.start_ball()
		ball.position.x = 0
		ball.position.y = 282
		ball.velocity = Vector2(0,0)
		Lives_HUD.text = str("Lives: ", Lives)
		for Power in get_tree().get_nodes_in_group("Powerups"):
			Power.queue_free()
			Power.remove_from_group("Powerups")

	 

var debug_mode : bool = false
@export var new_ball : PackedScene
func _input(event):
	if Input.is_key_pressed(KEY_SPACE) and debug_mode:
		for i in 999:
			var ball = new_ball.instantiate()
			print(ball)
			get_node("/root/Node2D").add_child(ball)
			ball.start_ball()
			ball.position = position
			ball.position.y = 282
			print("ball should be here")







func _on_body_entered(body):
	print(body)
