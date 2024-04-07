extends Node


var config = ConfigFile.new()

const SETTINGS_FILE_PATH = "user://Settings.ini"

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.set_value("keybindings","Paddle_move_right","D")
		config.set_value("keybindings","Paddle_move_left","A")
		config.set_value("keybindings","shoot_powerup","space")
		
		config.set_value("audio","Music",1.0)
		config.save(SETTINGS_FILE_PATH )
	else:
		config.load(SETTINGS_FILE_PATH)
		
func save_audio_settings(key: String,value):
		config.set_value("audio",key,value)
		config.save(SETTINGS_FILE_PATH)

func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio",key)
	return audio_settings
	
func save_key_binds(action: StringName, event:InputEvent):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventMouseButton:
		event_str = "mouse_" + str(event.button_index)
	config.set_value("keybindings",action,event_str)
	config.save(SETTINGS_FILE_PATH)

func load_key_binds():
	var keybindings = {}
	var keys = config.get_section_keys("keybindings")
	for key in keys:
		var input_event
		var event_str = config.get_value("keybindings",key)
		if event_str.contains("mouse_"):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
		keybindings[key] = input_event
	return keybindings	
