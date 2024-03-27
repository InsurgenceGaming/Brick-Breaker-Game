extends RigidBody2D

@export var PowerUps = []
@export var Hits_to_break : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#for i in 10:
		#var picked = test.pick_random()
		#var picked_object = picked.instantiate()
		#get_tree().root.add_child(picked_object)
			##add_child(object)
		#picked_object.position.y = randi_range(-100,100)
		#picked_object.position.x = randi_range(-100,100)



# Called every frame. 'delta' is the elapsed time since the previous frame.


func Damage(DMG):
	Hits_to_break -= DMG
	if Hits_to_break == 0:
		print("Pre_spawn")
		for i in 1:
			var picked = PowerUps.pick_random()
			var picked_object = picked.instantiate()
			get_tree().root.add_child(picked_object)
				#add_child(object)
			picked_object.position.y = position.y
			picked_object.position.x = position.x
		print("Post Spawn")
		queue_free()
	else:
		print(Hits_to_break)
