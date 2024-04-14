extends Node2D

const Brick_width = 80
const Brick_Height = 20

@onready var Brick = preload("res://Scenes/brick.tscn")

var rows = 14
var colums = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	Brick_spawn()
	

func Brick_spawn():
	for row in range(0,rows):
		for colum in range (0,colums):
			var random = randf_range(0,1)
			if random <0.3:
				pass
			elif random <0.5:
				var New_brick = Brick.instantiate()
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				New_brick.modulate = Color(0,255,255)
				New_brick.position.x = row * Brick_width
				New_brick.position.y = colum * Brick_Height
			elif random < 0.6:
				var New_brick = Brick.instantiate()
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				New_brick.modulate = Color(0,255,0)
				New_brick.position.x = row * Brick_width
				New_brick.position.y = colum * Brick_Height
			elif random <0.7:
				var New_brick = Brick.instantiate()
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				New_brick.modulate = Color(255,0,0)
				New_brick.position.x = row * Brick_width
				New_brick.position.y = colum * Brick_Height
			elif random <0.8:
				var New_brick = Brick.instantiate()
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				New_brick.modulate = Color(90,0,255)
				New_brick.position.x = row * Brick_width
				New_brick.position.y = colum * Brick_Height
			else:
				var New_brick = Brick.instantiate()
				New_brick.Hits_to_break = 1
				New_brick.modulate = Color(255,255,255)
				add_child(New_brick)
				New_brick.position.x = row * Brick_width
				New_brick.position.y = colum * Brick_Height
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
