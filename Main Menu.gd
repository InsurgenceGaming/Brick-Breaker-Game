extends Control

@export var Game : PackedScene


func _on_play_pressed():
	get_tree().change_scene_to_packed(Game)

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings_Menu.tscn")

func _on_quit_pressed():
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play()
	OS.alert("You Suck")
	OS.alert("no you really suck")
	OS.alert("Stop trying to close me")
	OS.alert("OK FINE YOU CUCK")
	get_tree().quit()
