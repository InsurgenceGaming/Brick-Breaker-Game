extends Control




func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Audio.tscn")


func _on_controls_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
