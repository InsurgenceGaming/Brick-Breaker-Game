extends CharacterBody2D

class_name Paddle
@export var RestartButton : Button
@export var MainMenuButton : Button
@export var RestartLevel : Button
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
var gameover = false
var fire_ball : bool = false
var Buttons = []


func _ready():
	RestartButton.disabled = true
	MainMenuButton.disabled = true
	RestartLevel.disabled = true
	Buttons = [RestartButton,MainMenuButton,RestartLevel]
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
	if !gameover:
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
		gameover = true
		var my_tween = create_tween()
		my_tween.set_parallel(true)
		print(Buttons)
		for button in Buttons:
			if button.name == "Quit":
				my_tween.tween_property(button,"position:x",-38,1)
			else:
				my_tween.tween_property(button,"position:x",-48,1)
			
		await get_tree().create_timer(1.0).timeout
		for button in Buttons:
			button.disabled = false
		
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

func New_stage():
	for ball in get_tree().get_nodes_in_group("Ball"):
		ball.queue_free()
		ball.remove_from_group("Ball")
	Ball_spawned = false
	position.x = Vector2.ZERO.x
	ball = new_ball.instantiate()
	get_node("/root/Node2D").add_child(ball)
	ball.name = "Ball"
	ball.start_ball()
	ball.position.x = 0
	ball.position.y = 282
	ball.velocity = Vector2(0,0)


	 

var debug_mode : bool = true
@export var new_ball : PackedScene
func _input(event):
	if Input.is_key_pressed(KEY_P) and debug_mode:
		Lives = 0
	if Input.is_key_pressed(KEY_SPACE) and debug_mode:
		for i in 999:
			var ball = new_ball.instantiate()
			print(ball)
			get_node("/root/Node2D").add_child(ball)
			ball.start_ball()
			ball.position = position
			ball.position.y = 282
			print("ball should be here")
			
func _on_back_pressed():
	get_tree().quit()


func _on_main_menu_pressed():
	var my_tween = create_tween()
	my_tween.set_parallel(true)
	for button in Buttons:
		if button.name == "Quit":
			my_tween.tween_property(button,"position:x",-671,1)
		else:
			my_tween.tween_property(button,"position:x",-684,1)
		button.disabled = true
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")


func _on_restart_pressed():
	var my_tween = create_tween()
	my_tween.set_parallel(true)
	for button in Buttons:
		if button.name == "Quit":
			my_tween.tween_property(button,"position:x",-671,1)
		else:
			my_tween.tween_property(button,"position:x",-684,1)
		button.disabled = true
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Snake.tscn")
