extends Node

class_name SegmentStateMachine

@export var state_paths: Array[String]

@onready var target: MarmeladeSegment = get_parent()
@onready var states: Dictionary = {
	STATES.IDLE : load(state_paths[0]).new(target),
	STATES.FALLING : load(state_paths[1]).new(target)
}
@onready var current_state: State = states[STATES.IDLE]

enum STATES {
	IDLE,
	FALLING
}

func _process(delta) -> void:
	current_state._update(delta)

func change_state(next_state: STATES) -> void:
	if current_state == states[next_state]:
		return
	current_state._exit_state()
	current_state = states[next_state]
	current_state._enter_state()
