extends StaticBody2D

@onready var paddle = $"../../Player"
@export var PowerUps = []
@export var Hits_to_break : int
var No_cannon_powerups
@onready var Dynamic_bricks =$"../../DynamicBricks"
# Called when the node enters the scene tree for the first time.
func _ready():
	No_cannon_powerups = PowerUps.duplicate()
	No_cannon_powerups.remove_at(1)
	pass

var one_in_10 = randi_range(1,10)

func Damage(DMG):
	Hits_to_break -= DMG
	if Hits_to_break <= 0:
		if get_tree().get_nodes_in_group("Brick").size() == 1:
			pass
		else:
			if one_in_10>0:
				var picked = PowerUps.pick_random()
				#print("i should be doing powerup stuff")
				if picked == PowerUps[1] and paddle.has_node("Cannon"):
					picked = No_cannon_powerups.pick_random()
				var picked_object = picked.instantiate()
				get_node("/root/Node2D").add_child(picked_object)
				picked_object.position.y = global_position.y
				picked_object.position.x = global_position.x
		queue_free()
		remove_from_group("Brick")
		paddle.SPEED += 10
	if get_tree().get_nodes_in_group("Brick").is_empty():
		paddle.New_stage()
		print("new stage has been run")
		Dynamic_bricks.Brick_spawn()
		print("New bricks have been spawned")
		for Power in get_tree().get_nodes_in_group("Powerups"):
			Power.queue_free()
			Power.remove_from_group("Powerups")
			print("Test")


