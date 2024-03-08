extends MarmeladeSegment

class_name Player

@export var max_point_range: Vector2
@export var default_force: float
@export var rotate_force: float
@export var joint_segments: Array[MarmeladeSegment]

@onready var line: Line2D = $Line
@onready var raycast_array: Array[RayCast2D] = [$RayCast, $RayCast2]

func _physics_process(delta) -> void:
	if Input.is_action_pressed("ApplyForce") and is_segments_idle():
		draw_target_line()
	apply_torque(Input.get_axis("Left", "Right") * rotate_force)

func _unhandled_input(event) -> void:
	if event.is_action_released("ApplyForce") and is_segments_idle():
		set_falling_segments()
		throw_player()
		line.points[1] = Vector2.ZERO

func is_segments_idle() -> bool:
	for segment in joint_segments:
		if segment.segments_state_machine.current_state == segment.\
		segments_state_machine.states[segments_state_machine.STATES.IDLE]:
			return true
	return false

func set_falling_segments() -> void:
	for segment in joint_segments:
		segment.segments_state_machine.change_state(segments_state_machine.STATES.FALLING)

func throw_player() -> void:
	var throw_vector: Vector2
	
	throw_vector = get_global_mouse_position() - global_position
	throw_vector.limit_length(max_point_range.x)
	apply_central_force(throw_vector * default_force)

func draw_target_line() -> void:
	var last_point_pos: Vector2 = get_local_mouse_position()
	
	last_point_pos = last_point_pos.clamp(-max_point_range, max_point_range)
	line.points[1] = lerp(line.points[1], last_point_pos, 0.5)
