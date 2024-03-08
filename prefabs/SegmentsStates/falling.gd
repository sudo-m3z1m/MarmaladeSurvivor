extends State

var raycasts_array: Array[RayCast2D]

func _enter_state() -> void:
	animation = "Falling"
	target_sprite.animation = animation
	target.freeze = false
	raycasts_array = target.raycasts_array
	
	target.set_raycasts_enabled(false)
	target.raycast_timer.start()

func _update(delta: float) -> void:
	for raycast in raycasts_array:
		if raycast.is_colliding():
			target.rotation = raycast.get_collision_normal().angle() - 90
			target.segments_state_machine.change_state(target.segments_state_machine.STATES.IDLE)
