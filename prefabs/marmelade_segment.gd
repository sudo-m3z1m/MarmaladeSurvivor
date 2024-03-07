extends RigidBody2D

class_name MarmeladeSegment

@onready var raycasts_array: Array[RayCast2D] = [$RayCast, $RayCast2]

func _process(delta) -> void:
	for raycast in raycasts_array:
		if raycast.is_colliding():
			set_deferred("freeze", true)
			rotation = raycast.get_collision_normal().angle() - 90
