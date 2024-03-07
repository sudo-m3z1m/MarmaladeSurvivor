extends Node

class_name State

var animation: String
var player: Player

func _init(player: Player) -> void:
	self.player = player

func _enter_state() -> void:
	pass

func _update(delta: float) -> void:
	pass

func _exit_state() -> bool:
	return true
