extends Control
@onready var music_volume_slider = $MusicVolumeSlider


func _ready():
	var audio_settings = Settings.load_audio_settings()
	music_volume_slider.value = audio_settings.Music
# Called when the node enters the scene tree for the first time.
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings_Menu.tscn")

func _on_music_volume_slider_drag_ended(value_changed):
		if value_changed:
			Settings.save_audio_settings("Music",music_volume_slider.value)
