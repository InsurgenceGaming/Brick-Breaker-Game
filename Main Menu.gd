extends Control

@export var Game : PackedScene
@export var bus_name : String
var bus_index : int
func _ready():
	var audio_settings = Settings.load_audio_settings()
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(audio_settings.Music)
	)
	print(audio_settings)

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
