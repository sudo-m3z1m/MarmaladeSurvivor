extends CanvasLayer

@export var exit_menu_packed: PackedScene

@onready var settings_panel: Panel = $MarginContainer/SettingsPanel
@onready var screen_button: CheckButton = $MarginContainer/SettingsPanel/MarginContainer/VBoxContainer/HBoxContainer4/ScreenCheckButton

func continue_button_pressed() -> void:
	get_tree().paused = false
	visible = false

func settings_button_pressed() -> void:
	settings_panel.set_visible(!settings_panel.visible)

func exit_button_pressed() -> void:
	get_tree().paused = false
	set_visible(false)
	get_tree().change_scene_to_packed(exit_menu_packed)

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
