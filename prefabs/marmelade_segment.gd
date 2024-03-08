extends RigidBody2D

class_name MarmeladeSegment

@onready var raycasts_array: Array[RayCast2D] = [$RayCast, $RayCast2]
@onready var segments_state_machine: SegmentStateMachine = $StateMachine
@onready var raycast_timer: Timer = $RaycastTimer

func raycast_timer_timeout() -> void:
	set_raycasts_enabled(true)

func set_raycasts_enabled(is_enabled: bool) -> void:
	for raycast in raycasts_array:
		raycast.enabled = is_enabled
