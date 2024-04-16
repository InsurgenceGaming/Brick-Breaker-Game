extends Node2D

const Brick_width = 80
const Brick_Height = 20
@export var Stage_Label : Label

@onready var Brick = preload("res://Scenes/brick.tscn")

var rows = 14
var colums = 10
var Cur_stage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	Brick_spawn()
	

func Brick_spawn():
	for row in range(0,rows):
		for colum in range (0,colums):
			var New_brick = Brick.instantiate()
			var random = randf_range(0,1)
			var brick_colour = Color(255,255,255)
			var Break
			if random <0.2:
				continue
			elif random <0.5:
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				brick_colour = Color(0,255,255)
			elif random < 0.6:
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				brick_colour = Color(0,255,0)
			elif random <0.7:
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				brick_colour = Color(255,0,0)
			elif random <0.8:
				add_child(New_brick)
				New_brick.Hits_to_break = 1
				brick_colour = Color(90,0,255)
			else:
				New_brick.Hits_to_break = 1
				brick_colour = Color(255,255,255)
			add_child(New_brick)
			New_brick.modulate = brick_colour
			New_brick.position.x = row * Brick_width
			New_brick.position.y = colum * Brick_Height
	var my_tween = create_tween()
	my_tween.tween_property(Stage_Label,"self_modulate",Color8(255,255,255,255),3)
	Stage_Label.text = str("Stage: ", Cur_stage)
	print("it should be here")
	my_tween.tween_property(Stage_Label,"self_modulate",Color8(255,255,255,0),3)
	Cur_stage += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
