extends RefCounted
class_name State

var animation: String
var target: MarmeladeSegment
var target_sprite: AnimatedSprite2D

func _init(player: MarmeladeSegment) -> void:
	target = player
	target_sprite = player.get_node("Sprite2D")

func _enter_state() -> void:
	pass

func _update(delta: float) -> void:
	pass

func _exit_state() -> bool:
	return true
