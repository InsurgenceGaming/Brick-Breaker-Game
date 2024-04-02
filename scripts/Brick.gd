extends RigidBody2D

@export var PowerUps = []
@export var Hits_to_break : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func Damage(DMG):
	Hits_to_break -= DMG
	if Hits_to_break >= 0:
		print("Pre_spawn")
		for i in 1:
			var picked = PowerUps.pick_random()
			var picked_object = picked.instantiate()
			get_tree().root.add_child(picked_object)
			picked_object.position.y = position.y
			picked_object.position.x = position.x
		print("Post Spawn")
		queue_free()
	else:
		print(Hits_to_break)
