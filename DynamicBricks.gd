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
			var New_brick = Brick.instantiate()
			add_child(New_brick)
			New_brick.position.x = row * Brick_width
			New_brick.position.y = colum * Brick_Height
			print(row,colum)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
