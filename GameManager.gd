extends Node2D

class_name GameManger
var ball_scene = preload("res://Scenes/ball.tscn")

func ball_new():
	print("ball_new started...")
	var new_ball = ball_scene.instantiate()
	print("new_ball:", new_ball)  # Add this line for debugging
	add_child(new_ball)
	print("the ball should be in the scene tree by here")
	new_ball.position.x = 10
	new_ball.position.y = 10
