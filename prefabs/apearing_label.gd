extends Label

@onready var area: Area2D = $Area2D

func _ready() -> void:
	area.body_entered.connect(show_label)
	area.body_exited.connect(hide_label)

func show_label(body: Node2D) -> void:
	if !(body is MarmeladeSegment):
		return
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.2)

func hide_label(body: Node2D) -> void:
	if !(body is MarmeladeSegment):
		return
	var tween: Tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.2)
