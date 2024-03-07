extends Node

class_name SegmentStateMachine

@onready var target: Player = get_parent()

enum STATES {
	IDLE,
	FALLING
}

var current_state: State
#var states: Dictionary = {
	#STATES.IDLE : preload("").new(),
	#STATES.FALLING : preload("").new()
#}

func change_state(next_state: STATES) -> void:
	pass
