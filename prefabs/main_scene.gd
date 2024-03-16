extends Node2D

@onready var player: Node2D = $Player

func _ready() -> void:
	player.get_node("PlayebleSegment").apply_central_force(Vector2.DOWN * 1000000)
