extends Control




func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Audio.tscn")


func _on_controls_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Controls.tscn")
	pass #https://youtu.be/tfqJjDw0o7Y is the video to understand how to make settings save
	


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
