extends RigidBody2D

@export var PowerUps = []
@export var Hits_to_break : int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

var one_in_10 = randi_range(1,10)

func Damage(DMG):
	Hits_to_break -= DMG
	if Hits_to_break <= 0:
		if  one_in_10>5:
			print(one_in_10)
			var picked = PowerUps.pick_random()
			var picked_object = picked.instantiate()
			get_node("/root/Node2D").add_child(picked_object)
			picked_object.position.y = position.y
			picked_object.position.x = position.x
		queue_free()
	else:
		print(Hits_to_break)
