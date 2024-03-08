extends State

func _enter_state() -> void:
	animation = "Idle"
	target_sprite.animation = animation
	target.freeze = true

func _update(delta: float) -> void:
	return

func _exit_state() -> bool:
	return true
