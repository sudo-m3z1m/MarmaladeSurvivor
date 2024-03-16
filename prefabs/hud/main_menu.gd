extends Control

@export var start_scene_packed: PackedScene

@onready var settings_panel: Panel = $MarginContainer/SettingsPanel
@onready var video_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var screen_button: CheckButton = $MarginContainer/SettingsPanel/MarginContainer/VBoxContainer/HBoxContainer4/ScreenCheckButton

var delta_position: float = -600

func settings_button_pressed() -> void:
	var tween: Tween = create_tween()
	delta_position = -delta_position
	
	tween.tween_property(settings_panel, "global_position:x", settings_panel.\
	global_position.x + delta_position, 0.1)

func start_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene_packed)

func exit_button_pressed():
	get_tree().quit(0)

func sounds_check_button_pressed():
	video_player.set_visible(true)
	video_player.play()

func screen_check_button_pressed():
	var window_mode: int = DisplayServer.WINDOW_MODE_FULLSCREEN
	
	if !screen_button.button_pressed:
		window_mode = DisplayServer.WINDOW_MODE_WINDOWED
	DisplayServer.window_set_mode(window_mode)

func music_slider_value_changed(value):
	var bus_id: int = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_id, log(value) * 20)

func sounds_slider_value_changed(value):
	var bus_id: int = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(bus_id, log(value) * 20)
