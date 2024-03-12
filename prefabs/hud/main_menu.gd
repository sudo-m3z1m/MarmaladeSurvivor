extends Control

@export var start_scene_packed: PackedScene

@onready var settings_panel: Panel = $SettingsPanel

func settings_button_pressed() -> void:
	var tween: Tween = create_tween()
	var delta_panel: float = -600
	if settings_panel.global_position.x <= 652:
		delta_panel = 600
	tween.tween_property(settings_panel, "global_position:x", settings_panel.global_position.x + delta_panel, 0.1)

func start_button_pressed() -> void:
	get_tree().change_scene_to_packed(start_scene_packed)
