extends PathFollow2D

func _process(delta) -> void:
	progress_ratio = lerp(progress_ratio, 1.0, 0.0001)
